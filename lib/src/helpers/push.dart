import 'package:flutter/cupertino.dart';

extension Push on BuildContext {
  ///### Push to widget
  void to(Widget widget, {bool remofeFromStack = false}) {
    ///### Remove from stack
    if (remofeFromStack) {
      Navigator.of(this).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => widget),
        (route) => false,
      );
    } else {
      ///### Push to widget
      Navigator.of(this).push(CupertinoPageRoute(builder: (context) => widget));
    }
  }
}
