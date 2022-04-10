import './app_state.dart';
import './todo/todo_middleware.dart';
import './bottom_navigator/navigator_middleware.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    todoState: todoReducer(state.todoState, action),
    bottomNavigetorState: bottomNavigatorReducer(state.bottomNavigetorState, action)
  );
}