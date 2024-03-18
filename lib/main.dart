import 'package:flutter/material.dart';
import 'package:pr_4/lists/column.dart';
import 'package:pr_4/lists/listview.dart';
import 'package:pr_4/lists/separated.dart';
import 'package:pr_4/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TaskController _controller = TaskController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            bottom: const TabBar(
              tabs: [
                Tab(text: "Column"),
                Tab(text: "ListView"),
                Tab(text: "Separated"),
              ],
            )
        ),
        body: Column(
          children: [
              AddTaskBlock(onNewTask: (title, text) => setState(() => _controller.addTask(title, text))),
              Expanded(
                child: TabBarView(
                  children: [
                    ColumnDisplay(controller: _controller),
                    ListViewDisplay(controller: _controller),
                    SeparatedListViewDisplay(controller: _controller),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}

class AddTaskBlock extends StatefulWidget {
  final Function(String title, String text) onNewTask;

  const AddTaskBlock({super.key, required this.onNewTask});

  @override
  State<AddTaskBlock> createState() => _AddTaskBlockState();
}

class _AddTaskBlockState extends State<AddTaskBlock> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  void addTask() {
    widget.onNewTask(_titleController.value.text, _textController.value.text);
    _titleController.clear();
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
          ),
          TextField(
            controller: _textController,
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: addTask,
            child: const Text("Добавить"),
          ),
        ],
      ),
    );
  }
}
