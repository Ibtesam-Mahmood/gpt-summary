import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpt_summary/components/no_input_view.dart';
import 'package:gpt_summary/components/summary_view.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String? data;
  late StreamSubscription _intentData;

  @override
  void initState() {
    super.initState();

    // On data received when app is closed
    ReceiveSharingIntent.getInitialText().then(setData);

    // On data received when app in in background
    _intentData = ReceiveSharingIntent.getTextStream().listen((String value) => setData(value), onError: (err) {
      debugPrint("getLinkStream error: $err");
    });
  }

  @override
  void dispose() {
    _intentData.cancel();
    super.dispose();
  }

  void setData(String? value){
    setState(() {
      data = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPT Summary"),
        actions: data == null ? [] : [
          IconButton(
            icon: Icon(
              Icons.cancel, 
              color: Theme.of(context).errorColor,
            ),
            onPressed: () {
              // Clears the data
              setData(null);
            }
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: data == null ? const NoInputView() : SummaryView(text: data!),
        ),
      ),
      floatingActionButton: data == null ? FloatingActionButton(
        tooltip: 'Copy Clipboard Data',
        child: Icon(
          Icons.copy, 
          color: Theme.of(context).errorColor,
        ),
        onPressed: () async {
          ClipboardData? data = await Clipboard.getData('text/plain');
          setData(data?.text);
        },
      ) : null
    );
  }
}