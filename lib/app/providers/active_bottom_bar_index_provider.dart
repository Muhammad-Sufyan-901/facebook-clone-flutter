import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActiveBottomBarIndexNotifier extends StateNotifier<int> {
  ActiveBottomBarIndexNotifier() : super(0);

  void setActiveIndex(int index) {
    state = index;
  }

  void resetIndex() {
    state = 0;
  }
}

final activeBottomBarIndexProvider =
    StateNotifierProvider<ActiveBottomBarIndexNotifier, int>(
  (ref) {
    return ActiveBottomBarIndexNotifier();
  },
);
