import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
      ),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();
  final List<bool> _todosCompletionStatus = []; // List to track completion status

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _todosCompletionStatus.add(false); // Initialize completion status for new todo
        _controller.clear();
      });
    } else {
      // Show a snackbar if the input is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a todo item.')),
      );
    }
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add To-Do'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Enter a todo'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addTodo();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index); // Remove the todo item
      _todosCompletionStatus.removeAt(index); // Remove the corresponding completion status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // Set the background color for the AppBar
        title: const Text('To-Do App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index]),
                  leading: Checkbox(
                    value: _todosCompletionStatus[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _todosCompletionStatus[index] = value!;
                      });
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteTodo(index),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16), // Add some spacing
          Container(
            margin: const EdgeInsets.all(16.0), // Add margin around the button
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0), // Padding
                backgroundColor: Colors.lightBlue, // Background color
              ),
              onPressed: _showAddTodoDialog,
              child: const Text(
                'Add To-Do',
                style: TextStyle(fontSize: 18), // Increase font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
