// TODO Implement this library.
import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:intl/intl.dart'; //for datetime formatting
import 'package:path_provider/path_provider.dart';

enum PlayerState { stopped, playing, paused }
enum PlayingRouteState { speakers, earpiece }

class RecordListView extends StatefulWidget {
  final List<String> records;
  // final String url;
  final PlayerMode mode;

  const RecordListView({
    Key key, this.mode = PlayerMode.MEDIA_PLAYER, this.records, children,})
      : super(key: key);

  @override
  _RecordListViewState createState() {
    return _RecordListViewState(mode);
  }
}

class _RecordListViewState extends State<RecordListView> {
  // String url;
  PlayerMode mode;
  final TextEditingController titleController = new TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();

  // Directory appDirectory = await getApplicationDocumentsDirectory();

  int _selectedIndex = -1;

  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;
  PlayingRouteState _playingRouteState = PlayingRouteState.speakers;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;
  StreamSubscription<PlayerControlCommand> _playerControlCommandSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  get _isPlayingThroughEarpiece =>
      _playingRouteState == PlayingRouteState.earpiece;

  _RecordListViewState(this.mode);

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _playerControlCommandSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (ListView.builder(
        itemCount: widget.records.length,
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (BuildContext context, int i) {

          final records = widget.records[i];
          return GestureDetector(
            // onLongPress: ,
            child: FocusedMenuHolder(
              onPressed: (){},
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                  title: Text("Rename", style: TextStyle(color: Colors.white),),
                  trailingIcon: Icon(Icons.edit),
                  backgroundColor: Colors.grey,
                  onPressed: () async{
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Form(
                              key: _keyDialogForm,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.ac_unit),
                                    ),
                                    maxLength: 30,
                                    textAlign: TextAlign.center,
                                    onSaved: (val) {
                                      titleController.text = val;
                                      setState(() {});
                                    },
                                    autovalidate: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Title Name';
                                      }
                                      return null;
                                    },
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  if (_keyDialogForm.currentState.validate()) {
                                    _keyDialogForm.currentState.save();
                                    //   final dir = Directory(widget.records[i]);
                                    //   dir.deleteSync(recursive:true);

                                    // var file = (appDirectory.path + '/' + titleController.text + '.aac');
                                    // return dir.renameSync(file);

                                    Navigator.pop(context);
                                  }

                                  final path = (Directory(widget.records[i]).path);
                                  print('Original path: $path');
                                  var lastSeparator = path.lastIndexOf('-');
                                  var newPath = path.substring(0, lastSeparator + 1) + (titleController.text).toString() +'.aac';
                                  print('Original path: $newPath');
                                  setState(() {});
                                  return File(widget.records[i]).renameSync(newPath);

                                },

                                child: Text('Save'),
                                color: Colors.blue,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                            ],
                          );
                        });
                  },),
              ],
              child: Dismissible(
                key: Key(records),
                onDismissed: (DismissDirection direction) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Change Complete",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                background: Container(
                  color: Colors.greenAccent[700],
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget> [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        Text(
                            ' Add to Library',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.redAccent[700],
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        Text(
                            'Delete ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            )
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart)  {
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Remove Confirmation"),
                            content: Text(
                                "Are you sure you want to delete this recording?"),//widget.records.removeAt(i), ${widget.records[i]}
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              FlatButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  // TODO: Delete the item from DB etc..
                                  final dir = Directory(widget.records[i]);
                                  dir.deleteSync(recursive:true);
                                  setState(() {
                                    widget.records.removeAt(i);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  } else {
                    return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Form(
                              key: _keyDialogForm,
                              child: Column(
                                children: <Widget>[

                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                    Navigator.pop(context);

                                },

                                child: Text('Move'),
                                color: Colors.blue,
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                            ],
                          );
                        });
                    // return res;
                  }
                },
                child: ExpansionTile(
                  title: Text('${(((widget.records.elementAt(i)).split('-').last).split('.').first)}'),
                  // title:  Text(titleController.text),//Text('New Recording ${widget.records.length - i}'),
                  // subtitle: Text(_getDateFromFilePath(filePath: widget.records.elementAt(i))),
                  onExpansionChanged: ((newState) {
                    if (newState) {
                      setState(() {
                        _selectedIndex = i;
                      });
                    }
                  }),
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          key: Key('play_button'),
                          onPressed: _isPlaying ? null : () => _play(filePath: widget.records.elementAt(i), index: i),
                          iconSize: 64.0,
                          icon: Icon(Icons.play_arrow),
                          color: Colors.cyan,
                        ),
                        IconButton(
                          key: Key('pause_button'),
                          onPressed: _isPlaying ? () => _pause() : null,
                          iconSize: 64.0,
                          icon: Icon(Icons.pause),
                          color: Colors.cyan,
                        ),
                        IconButton(
                          key: Key('stop_button'),
                          onPressed: _isPlaying || _isPaused ? () => _stop() : null,
                          iconSize: 64.0,
                          icon: Icon(Icons.stop),
                          color: Colors.cyan,
                        ),
                        IconButton(
                          onPressed: _earpieceOrSpeakersToggle,
                          iconSize: 64.0,
                          icon: _isPlayingThroughEarpiece
                              ? Icon(Icons.volume_up)
                              : Icon(Icons.hearing),
                          color: Colors.cyan,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Stack(
                            children: [
                              Slider(
                                onChanged: (v) {
                                  final Position = v * _duration.inMilliseconds;
                                  _audioPlayer
                                      .seek(Duration(milliseconds: Position.round()));
                                },
                                value: (_position != null &&
                                    _duration != null &&
                                    _position.inMilliseconds > 0 &&
                                    _position.inMilliseconds < _duration.inMilliseconds)
                                    ? _position.inMilliseconds / _duration.inMilliseconds
                                    : 0.0,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          _position != null
                              ? '${_positionText ?? ''} / ${_durationText ?? ''}'
                              : _duration != null
                              ? _durationText
                              : '',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }

  // String _getDateFromFilePath({@required String filePath}) {
  //   String fromEpoch = filePath.substring(filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('-'));
  //   DateTime recordedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(fromEpoch));
  //
  //   final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss a');
  //   final String formatted = formatter.format(recordedDate);
  //
  //   return (formatted); //('$year-$month-$day $hour:$minute:$second');
  // }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);

      // TODO implemented for iOS, waiting for android impl
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        // (Optional) listen for notification updates in the background
        _audioPlayer.startHeadlessService();

        // set at least title to see the notification bar on ios.
        _audioPlayer.setNotification(
          title: 'App Name',
          artist: 'Artist or blank',
          albumTitle: 'Name or blank',
          imageUrl: 'url or blank',
          // forwardSkipInterval: const Duration(seconds: 30), // default is 30s
          // backwardSkipInterval: const Duration(seconds: 30), // default is 30s
          duration: duration,
          elapsedTime: Duration(seconds: 0),
          hasNextTrack: true,
          hasPreviousTrack: false,
        );
      }
    });

    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
          _position = p;
        }));

    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
          _stop();
          setState(() {
            _position = _duration;
          });
        });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _playerControlCommandSubscription =
        _audioPlayer.onPlayerCommand.listen((command) {
          print('command');
        });

    // _audioPlayer.onPlayerStateChanged.listen((state) {
    //   if (!mounted) return;
    //   setState(() {
    //     _audioPlayerState = state;
    //   });
    // });
    //
    // _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
    //   if (!mounted) return;
    //   setState(() => _audioPlayerState = state);
    // });

    _playingRouteState = PlayingRouteState.speakers;
  }

  Future<int> _play({@required String filePath, @required int index}) async {
    final playPosition = (_position != null &&
        _duration != null &&
        _position.inMilliseconds > 0 &&
        _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final result = await _audioPlayer.play(filePath, isLocal: true, position: playPosition);
    if (result == 1) setState(() => _playerState = PlayerState.playing);

    // default playback rate is 1.0
    // this should be called after _audioPlayer.play() or _audioPlayer.resume()
    // this can also be called everytime the user wants to change playback rate in the UI
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);

    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  Future<int> _earpieceOrSpeakersToggle() async {
    final result = await _audioPlayer.earpieceOrSpeakersToggle();
    if (result == 1)
      setState(() => _playingRouteState =
      _playingRouteState == PlayingRouteState.speakers
          ? PlayingRouteState.earpiece
          : PlayingRouteState.speakers);
    return result;
  }

  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration();
      });
    }
    return result;
  }

}

