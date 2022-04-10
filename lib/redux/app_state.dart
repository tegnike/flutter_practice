import 'package:flutter/material.dart';
import './todo/todo_state.dart';
import './bottom_navigator/navigator_state.dart';

@immutable
class AppState {
  final TodoState todoState;
  final BottomNavigetorState bottomNavigetorState;

  // コンストラクタ
  AppState(
    {
      required this.todoState,
      required this.bottomNavigetorState
    }
  );

  // factoryコンストラクタ
  // AppState初期化時の処理（AppState.initial()）
  // lib/redux/store.dart で初期化している
  factory AppState.initial() => AppState(
    todoState: TodoState.initial(),
    bottomNavigetorState: BottomNavigatorState.initial()
  );

  // Stateの更新時に呼び出すメソッド
  // Stateをこす飲するときは、書き換えるのではなく、新しいStateを用意する
  AppState copyWith(
    TodoState? todoState,
    BottomNavigatorState? bottomNavigatorState
  ) {
    return AppState(
      todoState: todoState ?? this.todoState,
      bottomNavigetorState: bottomNavigetorState ?? this.bottomNavigetorState
    );
  }
}
