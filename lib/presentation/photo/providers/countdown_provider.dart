import 'package:flutter_riverpod/flutter_riverpod.dart';

final countdownProvider = StateNotifierProvider<CountdownNotifier, int?>(
  (ref) => CountdownNotifier(),
);

class CountdownNotifier extends StateNotifier<int?> {
  static const int initialCountdown = 3;

  CountdownNotifier() : super(null);

  void startCountdown([int? customCountdown]) {
    state = customCountdown ?? initialCountdown;
  }

  void decrementCountdown() {
    final currentValue = state;
    if (currentValue != null && currentValue > 0) {
      state = currentValue - 1;
    }
  }

  void resetCountdown() {
    state = null;
  }
}
