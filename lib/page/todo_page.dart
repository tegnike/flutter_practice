import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:helloapp/provider/navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './todo_list_page.dart';
import './new_todo_page.dart';

class TodoPage extends HookWidget {
  final String title;

  // コンストラクタ
  TodoPage(
    {
      Key? key,
      required this.title
    }
  ) : super(
    key: key
  );

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.list
      ),
      label: 'All'
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.push_pin
      ),
      label: 'To'
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.play_arrow
      ),
      label: 'Doing'
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.check
      ),
      label: 'DOne'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final navigator = useProvider(bottomNavigatorNumProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TodoListPage(),
      floatingActionButton: FloatingActionButton(
        // 新規登録画面へ遷移させる
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            // Navigator.pushで繊維席画面へ、Navigator.popで一つ前の画面に戻る
            context, MaterialPageRoute(builder: (context) {
              return NewTodoPage();
            })
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        fixedColor: Colors.blueAccent,
        currentIndex: navigator.state,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          navigator.state = index;
        }
      ),
    );
  }
}
