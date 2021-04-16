import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:clipboard/clipboard.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_plugin.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:open_file/open_file.dart';


class SpeechText extends StatefulWidget {
  @override
  _SpeechTextState createState() => _SpeechTextState();
}

class _SpeechTextState extends State<SpeechText> {
  final Map<String, HighlightedWord> _highlights = {};

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press The Record Button When You Are Ready';
  double _confidence = 1.0;
  final pdf = pw.Document();
  Directory appDirectory;


  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();

    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list();
      print(appDirectory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speech To Text"),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () async {
                await FlutterClipboard.copy(_text);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✓   Copied to Clipboard'),),
                  // backgroundColor: Color(0xFF0A0E21),),
                );
              },
            ),
          ),
          Builder(
            // child: pw.Text(_text),
            builder: (context) => IconButton(
              icon: Icon(Icons.picture_as_pdf_outlined),
              onPressed: () async {
                pdf.addPage(pw.Page(
                  pageFormat: PdfPageFormat.a4,
                  build: (pw.Context context) {
                    return pw.Container(
                      child: pw.Column(
                        children: <pw.Widget>[
                          pw.Header(
                          level: 0,
                            child: pw.Text('Transcribed Recording',
                              style: pw.TextStyle(
                                fontSize: 20, fontWeight: pw.FontWeight.bold)),
                              outlineStyle: PdfOutlineStyle.italicBold,),
                          pw.Paragraph(
                              text: _text,
                              style: pw.TextStyle(fontSize: 16)),
                        ]),
                      );
                  }));

                final output = await getTemporaryDirectory();
                final file = File('${output.path}/example.pdf');
                await file.writeAsBytes(await pdf.save());
                print(file.toString());
                print(file.path);
                // OpenFile.open(file.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullPdfViewerScreen(file.path)),
                );
              },
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFF111328),
            // gradient: LinearGradient(
            //   colors: [Colors.indigo[800], Colors.purple[800], Colors.indigo[800]],
            // ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 20000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5.0,
                  spreadRadius: 4.0,
                ),
              ]),
          child: RaisedButton(
            color: Colors.red[700],
            onPressed: _listen,
            shape: CircleBorder(
            ),
            child: Container(
              width: 100,
              height: 100,
              child: Icon(
                _isListening ? Icons.stop : Icons.mic,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: TextHighlight(
            text: _text,
            words: _highlights,
            textStyle: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Document"),
        ),
        path: pdfPath);
  }
}