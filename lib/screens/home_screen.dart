import 'package:eos_todolist/widgets/add_button.dart';
import 'package:eos_todolist/widgets/todo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> toDoLists = ["1111", "22222", "333333"];
  List<bool> isClicked = [false, false, false];

  void _addToDoItem() {
    setState(() {
      toDoLists.add("+++++++++");
      isClicked.add(false);
    });
  }

  void _deleteToDoItem(int index) {
    setState(() {
      toDoLists.removeAt(index);
      isClicked.removeAt(index);
    });
  }

  void _toggleHeart(int index, bool isHeartClicked) {
    setState(() {
      isClicked[index] = isHeartClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.withOpacity(0.1),
        title: Text('EOS ToDoList'),
        leading: Image.asset('assets/images/eos_logo.png'),
      ),
      body: Column(
        children: [_buildCard(), Expanded(child: _toDoList())],
      ),
    );
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
          SizedBox(width: 35),
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
              SizedBox(height: 15),
              Text('감사합니다'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _toDoList() {
    return Stack(
      children: [
        // 초록색 박스와 'To Do List' 제목
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.lightGreen.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "To Do List",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: toDoLists.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(
                        title: toDoLists[index],
                        isClicked: isClicked[index],
                        onDelete: () => _deleteToDoItem(index),
                        onToggleHeart: (newState) =>
                            _toggleHeart(index, newState),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: AddButton(
              onPressed: _addToDoItem,
            ),
          ),
        ),
      ],
    );
  }
}
