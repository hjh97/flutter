import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EOS ToDoList',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.withOpacity(0.1),
        title: Text('EOS ToDoList'),
        leading: Image.asset('assets/images/eos_logo.png'),
      ),
      body: Column(
        children: [
          _buildCard(),
          _toDoList(context),
        ],
      ),
    );
  }
}

Widget _buildCard() {
  return Container(
    height: 200,
    color: Colors.lightGreen.withOpacity(0.2),
    padding: EdgeInsets.all(25),
    child: Row(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 10,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Image.asset('assets/images/eos_logo.png'),
          ),
        ),
        SizedBox(
          width: 35,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '홍준혁',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('감사합니다'),
          ],
        ),
      ],
    ),
  );
}

Widget _toDoList(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      Container(
          margin: EdgeInsets.all(20),
          height: height - 355,
          width: width,
          decoration: BoxDecoration(
            color: Colors.lightGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          )),
      Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: Colors.lightGreen.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            "To Do List",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
