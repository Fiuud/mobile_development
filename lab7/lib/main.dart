import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second': (context) => const SecondPage(),
      },
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.supervised_user_circle_outlined)),
              ],
            ),
            title: const Text('FirstPage'),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              SearchScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _random = Random();
  String? _number;
  late int _randomNumber;

  static const String _inputText = 'Введённое число';
  static const String _numberGt = '$_inputText больше заданного';
  static const String _numberLt = '$_inputText меньше заданного';
  static const String _numberEq = 'Молодец, угадал';
  static const String _inputNumber = 'Попробуй угадать число (1-100)';
  static const String _submit = 'ВВЕСТИ ЗНАЧЕНИЕ';

  static const String _errorValue100 = '$_inputText БОЛЬШЕ 100';
  static const String _errorValue0 = '$_inputText МЕНЬШЕ 0';

  @override
  void initState() {
    super.initState();
    _randomNumber = _random.nextInt(100);
  }

  String _textView = _inputNumber;

  void _checkNumber(int number) {
    // print(_randomNumber);
    setState(
      () {
        if (number < 0) {
          _textView = _errorValue0;
        } else if (number > 100) {
          _textView = _errorValue100;
        } else if (number > _randomNumber) {
          _textView = _numberGt;
        } else if (number < _randomNumber) {
          _textView = _numberLt;
        } else {
          _textView = _numberEq;

          _randomNumber = _random.nextInt(100);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (_number ?? '').toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(_textView),
          SizedBox(
            width: 200,
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    if (controller.text.isNotEmpty) {
                      _checkNumber(int.parse(controller.text));
                    }
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _number = controller.text.toString();
                      if (controller.text.isNotEmpty) {
                        _checkNumber(int.parse(controller.text));
                      }
                    },
                    child: const Text(_submit),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog Title'),
          content: const Text('Dialog Content'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Search Dialog'),
        onPressed: () => _showDialog(context),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Next page')),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('SecondPage'),
      ),
    );
  }
}
