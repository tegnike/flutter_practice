import 'package:flutter/material.dart';
import './show_todo_page.dart';
import '../model/todo.dart';

class TodoListPage extends StatelessWidget {
  // stateを保つ必要がないのでStatelessを継承

  final List<TodoContent> todos;

  // コンストラクタ
  TodoListPage(
    {
      required this.todos
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              // Expanded: 子Widgetを縦方向いっぱいまでという制限を与えるWidget, ないと無制限になる
              child: ListView.builder(
                // ListView.builder: 配列の長さが変わる場合に使用できるWidget
                // 固定吸う配列の場合はListView
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    // GestureDetector: 画面の操作に他のWidgetをもたせることができるWidget
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowTodoPage(
                            todo: todos[index],
                          )
                        )
                      );
                    },
                    child: ListTile(
                      title: Text("${todos[index].title}(${todos[index].getStateString()})"),
                      subtitle: Text(todos[index].content),
                    ),
                  );
                },
              )
            )
          ],
        )
      )
    );
  }
}
