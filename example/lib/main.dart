import 'package:flutter/material.dart';
import 'package:rich_input/rich_input.dart';

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
  final _controller = RichInputController(text: "Text");
  final _focusNode = FocusNode();

  @override
  void initState() {
    // Refresh text display, not required
    _controller.addListener(() {
      setState(() {});
    });
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
              RichInput(
                focusNode: _focusNode,
                controller: _controller,
              ),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.insertText("Text");
                    },
                    child: const Text("Add Text"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.insertText("😁");
                    },
                    child: const Text("Add 😁"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.insertText("👍");
                    },
                    child: const Text("Add 👍"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final block = RichBlock(
                        text: "@abc‎​‎ ",
                        data: "@123456",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                      _controller.insertBlock(block);
                    },
                    child: const Text("Add @    "),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final block = RichBlock(
                        text: "#subject ",
                        data: "#888999 ",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                      _controller.insertBlock(block);
                    },
                    child: const Text("Add #"),
                  ),
                  ElevatedButton(
                    onPressed: _controller.clear,
                    child: const Text("clear"),
                  ),
                  ElevatedButton(
                    onPressed: _focusNode.unfocus,
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
