import 'package:flutter/material.dart';
import 'package:rich_input/rich_input_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RichInputController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = RichInputController(text: "Text");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                focusNode: _focusNode,
                controller: _controller,
              ),
              Wrap(
                spacing: 10,
                children: [
                  RaisedButton(
                    onPressed: () {
                      _controller.text += "Text";
                    },
                    child: const Text("Add Text"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _controller.text += "😁";
                    },
                    child: const Text("Add 😁"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _controller.text += "👍";
                    },
                    child: const Text("Add 👍"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      const block = RichBlock(
                        text: " @abc ",
                        data: " @123456 ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                      _controller.addBlock(block);
                    },
                    child: const Text("Add @    "),
                  ),
                  RaisedButton(
                    onPressed: () {
                      const block = RichBlock(
                        text: " #subject ",
                        data: " #888999 ",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                      _controller.addBlock(block);
                    },
                    child: const Text("Add #"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _focusNode.unfocus();
                    },
                    child: const Text("unfocus"),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text("Text:${_controller.text}"),
              const SizedBox(height: 10),
              Text("Data:${_controller.data}"),
            ],
          ),
        ),
      ),
    );
  }
}
