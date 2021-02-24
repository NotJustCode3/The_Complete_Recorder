// TODO Implement this library.
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //for datetime formatting


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
    return (ListView.builder(
      itemCount: widget.records.length,
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (BuildContext context, int i) {
        return ExpansionTile(
          title: Text('New recording ${widget.records.length - i}'),
          subtitle: Text(
              _getDateFromFilePath(filePath: widget.records.elementAt(i))),
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
                    backgroundColor: Colors.black,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
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
        );
      },
    ));
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
    // int year = recordedDate.year;
    // int month = recordedDate.month;
    // int day = recordedDate.day;
    // int hour = recordedDate.hour;
    // int minute = recordedDate.minute;
    // int second = recordedDate.second;

    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss a');
    final String formatted = formatter.format(recordedDate);

    return (formatted);//('$year-$month-$day $hour:$minute:$second');
  }
}
