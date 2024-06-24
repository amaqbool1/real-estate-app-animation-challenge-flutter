import 'package:flutter/cupertino.dart';

extension View on num {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());
}
