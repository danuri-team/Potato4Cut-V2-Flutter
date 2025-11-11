import 'dart:async';

class Throttle {
  static Timer? _timer;

  static void run(Function() onTap) async {
    if (_timer?.isActive ?? false) return;

    onTap();

    _timer = Timer(
      const Duration(seconds: 2),
      () => _timer = null,
    );
  }
}
