import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CShadowStyles {
  // -- vertical box shadow
  static const verticalProductShadow = BoxShadow(
    //color: CColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: Offset(0, 2), // changes position of shadow
  );

// -- horizontal box shadow
  static final horizontalProductShadow = BoxShadow(
    color: CColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2), // changes position of shadow
  );
}
