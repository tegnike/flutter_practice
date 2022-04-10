import '../../model/todo.dart';

class AddTodoAction {
  final String title;
  final String content;

  // コンストラクタ
  AddTodoAction(
    {
      required this.title,
      required this.content
    }
  );
}

// 選択されたTodoをselectTodosに入れる際に発行されるアクション
class SetSelectTodosAction {
  final List<TodoContent> selectTodos;

  // コンストラクタ
  SetSelectTodosAction(
    this.selectTodos
  );
}

// 更新するアクションはインスタンス変数がない
class RefreshSelectTodoAction {}
