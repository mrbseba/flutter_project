// import 'package:flutter_svg/flutter_svg.dart';
// class AppIcons {
//   static SvgPicture menuIcon = SvgPicture.asset('assets/icons/menu.svg');
//   static SvgPicture shoppingCartIcon = SvgPicture.asset('assets/icons/shopping_cart.svg');
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  // icon for the top meniu
  static SvgPicture menuIcon(BuildContext context) {
    return SvgPicture.asset(
        'lib/prezentation/assets/icons/menu.svg'
    );
  }

  static SvgPicture shoppingCartIcon(BuildContext context) {
    return SvgPicture.asset(
      'lib/prezentation/assets/icons/shopping_cart.svg',
    );
  }

  // icon for the search bar
  static SvgPicture voiceIcon(BuildContext context) {
    return SvgPicture.asset(
      'lib/prezentation/assets/icons/voice.svg'
    );
  }

  // icons for the category
  static SvgPicture nikeIcon(BuildContext context) {
    return SvgPicture.asset(
        'lib/prezentation/assets/icons/nike.svg'
    );
  }
  static SvgPicture adidasIcon(BuildContext context) {
    return SvgPicture.asset(
        'lib/prezentation/assets/icons/adidas.svg'
    );
  }
  static SvgPicture filaIcon(BuildContext context) {
    return SvgPicture.asset(
        'lib/prezentation/assets/icons/fila.svg'
    );
  }
  static SvgPicture pumaIcon(BuildContext context) {
    return SvgPicture.asset(
        'lib/prezentation/assets/icons/puma.svg'
    );
  }

  // FIXME: add the hear icon

}
