import 'package:flutter/material.dart';
import '../../model/todo.dart';

@immutable
class TodoState {
  final List<TodoContent> todos;
  final List<TodoContent> selectTodos;

  // コンストラクタ
  TodoState(
    {
      required this.todos,
      required this.selectTodos
    }
  );

  // 初期値は空配列
  // lib/redux/app_state.dart で初期化している
  factory TodoState.initial() => TodoState(
    todos: [],
    selectTodos: []
  );

  TodoState copyWith(
    {
      List<TodoContent>? todos,
      List<TodoContent>? selectTodos
    }
  ) {
    return TodoState(
      todos: todos ?? this.todos,
      selectTodos: selectTodos ?? this.selectTodos
    );
  }
}