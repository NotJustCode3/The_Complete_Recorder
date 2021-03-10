// TODO Implement this library.
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RecordListView extends StatefulWidget {
  final List<String> records;
  const RecordListView({
    Key key,
    this.records,
  }) : super(key: key);

  @override
  _RecordListViewState createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  int _totalDuration;
  int _currentDuration;
  double _completedPercentage = 0.0;
  bool _isPlaying = false;
  int _selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.purple[600], Colors.pink, Colors. red[600]],
        ),
      ),
      child: (ListView.builder(
        itemCount: widget.records.length,
        shrinkWrap: true,
        reverse: true,
        itemBuilder: (BuildContext context, int i) {
          final records = widget.records[i];
          return Dismissible(
            key: Key(records),
            onDismissed: (direction) {
              setState(() {
                widget.records.removeAt(i);
              });
              Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Recording Removed",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              );
            },
            background: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              color: Colors.greenAccent[700],
              child: Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 15.0),
              color: Colors.redAccent[700],
              child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 40.0,
              ),
            ),
            child: ExpansionTile(
              backgroundColor: Colors.purple[400],
              title: Text(
                  'New Recording ${widget.records.length - i}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              subtitle: Text(
                  _getDateFromFilePath(filePath: widget.records.elementAt(i)),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              ),
              onExpansionChanged: ((newState) {
                if (newState) {
                  setState(() {
                    _selectedIndex = i;
                  });
                }
              }),
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearProgressIndicator(
                        minHeight: 5,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                        value: _selectedIndex == i ? _completedPercentage : 0,
                      ),
                      IconButton(
                        icon: _selectedIndex == i
                            ? _isPlaying
                                ? Icon(Icons.pause)
                                : Icon(Icons.play_arrow)
                            : Icon(Icons.play_arrow),
                        onPressed: () => _onPlay(
                            filePath: widget.records.elementAt(i), index: i),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Future<void> _onPlay({@required String filePath, @required int index}) async {
    AudioPlayer audioPlayer = AudioPlayer();

    if (!_isPlaying) {
      audioPlayer.play(filePath, isLocal: true);
      setState(() {
        _selectedIndex = index;
        _completedPercentage = 0.0;
        _isPlaying = true;
      });

      audioPlayer.onPlayerCompletion.listen((_) {
        setState(() {
          _isPlaying = false;
          _completedPercentage = 0.0;
        });
      });
      audioPlayer.onDurationChanged.listen((duration) {
        setState(() {
          _totalDuration = duration.inMicroseconds;
        });
      });

      audioPlayer.onAudioPositionChanged.listen((duration) {
        setState(() {
          _currentDuration = duration.inMicroseconds;
          _completedPercentage =
              _currentDuration.toDouble() / _totalDuration.toDouble();
        });
      });
    }
  }

  String _getDateFromFilePath({@required String filePath}) {
    String fromEpoch = filePath.substring(
        filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));

    DateTime recordedDate =
        DateTime.fromMillisecondsSinceEpoch(int.parse(fromEpoch));
    int year = recordedDate.year;
    int month = recordedDate.month;
    int day = recordedDate.day;

    return ('$year-$month-$day');
  }
}
