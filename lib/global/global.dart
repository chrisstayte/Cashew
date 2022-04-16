import 'package:cashew/enum/bill_type.dart';
import 'package:cashew/enum/default_utilities.dart';
import 'package:flutter/material.dart';

class Global {
  static final colors = _Colors();
}

class _Colors {
  final lightIconColor = const Color(0XFFE7EAEB);
  late final lightIconColorDarker =
      HSLColor.fromColor(lightIconColor).withLightness(0.55).toColor();
  final darkIconColor = const Color(0XFF323031);
  late final darkIconColorLighter =
      HSLColor.fromColor(darkIconColor).withLightness(0.75).toColor();
}

class _DefaultIcons {
  final Map<DefaultUtilities, IconData> utilityIcons = {
    DefaultUtilities.electricity: Icons.electric_bike,
    DefaultUtilities.gas: Icons.fire_hydrant,
  };
}
