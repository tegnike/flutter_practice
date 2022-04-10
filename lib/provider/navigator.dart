import 'package:riverpod/riverpod.dart';

// int型のstateを持ったProviderを生成している、0が初期値
final bottomNavigatorNumProvider = StateProvider<int>((_) => 0);
