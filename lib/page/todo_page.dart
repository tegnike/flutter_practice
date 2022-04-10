import 'package:flutter/material.dart';
import './todo_list_page.dart';
import './new_todo_page.dart';
import '../model/todo.dart';

class TodoPage extends StatefulWidget {
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

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<TodoContent> todos = [];         // 登録されたtodoを保持するためのstate
  List<TodoContent> selectedTodos = []; // 画面に表示するためのtodoをコピーするための変数
  int navigation = 0;                   // todoのリストを切り替えるための変数

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
  void initState() {
    super.initState();
    // 初期画面ではtodosにあるすべてのTodoを表示させる
    selectedTodos = todos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoListPage(
        todos: selectedTodos,
      ),
      floatingActionButton: FloatingActionButton(
        // 新規登録画面へ遷移させる
        child: Icon(Icons.add),
        onPressed: () async {
          // asyncをつけてメソッドを定義することで非同期処理を実行できる
          Map<String, String> todo = await Navigator.push(
            // Navigator.pushで繊維席画面へ、Navigator.popで一つ前の画面に戻る
            // awaitを使うと、遷移先の画面から値を非同期で受け取ることができる, 今回はtitleとcontentをMapで受け取る
            context, MaterialPageRoute(builder: (context) {
              return NewTodoPage();
            })
          );
          if (todo != null) {
            // NewTodoPageから受け取った値がnullでない場合
            setState(() {
              todos.add(
                TodoContent(
                  // !をつけるのはnullではなくStringであることを明示化するため
                  title: todo["title"]!,
                  content: todo["content"]!
                )
              );
            });
          }
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        fixedColor: Colors.blueAccent,
        currentIndex: navigation,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            navigation = index;
            switch (index) {
              case 0:
                selectedTodos = todos;
                break;
              case 1:
                selectedTodos = _toTodoContents();
                break;
              case 2:
                selectedTodos = _doingTodoContents();
                break;
              case 3:
                selectedTodos = _doneTodoContents();
                break;
            }
          });
        }
      ),
    );
  }

  List<TodoContent> _toTodoContents() {
    return todos.where((todo) {
      return todo.isTo();
    }).toList();
  }

  List<TodoContent> _doingTodoContents() {
    return todos.where((todo) {
      return todo.isDoing();
    }).toList();
  }

  List<TodoContent> _doneTodoContents() {
    return todos.where((todo) {
      return todo.isDone();
    }).toList();
  }
}
