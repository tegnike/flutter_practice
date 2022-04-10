import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import '../model/todo.dart';
import './navigator.dart';

// Todoの配列を管理するStateNotifier
class Todos extends StateNotifier<List<TodoContent>> {
  // コンストラクタ
  // Stateの初期値を受け取って親クラスに渡す
  Todos(List<TodoContent> initTodos) : super(initTodos ?? []);

  void add({ required String title, required String content}) {
    state = [
      ...state,
      TodoContent(title: title, content: content),
    ];
  }

  void update() {
    state = state;
  }
}

// 上記のStateNotifierを使って生成したProvider
final todosProvider = StateNotifierProvider<Todos, List<TodoContent>>((ref) {
  return Todos([]);
});

// 上記で作ったTodosのProviderとBottomNavigationBarのProviderを使うSelectTodosProvider
final selectTodosProvider = Provider<List<TodoContent>>((ref) {
  final navigator = ref.watch(bottomNavigatorNumProvider);
  final todos = ref.watch(todosProvider);

  switch (navigator.state) {
    case 0:
      return todos;
    case 1:
      return todos.where((todo) {
        return todo.isTo();
      }).toList();
    case 2:
      return todos.where((todo) {
        return todo.isDoing();
      }).toList();
    case 3:
      return todos.where((todo) {
        return todo.isDone();
      }).toList();
    default:
      return todos;
  }
});
