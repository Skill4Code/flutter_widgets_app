

import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

}

   const appMenuItems = <MenuItem>[

    MenuItem(
      title: 'Botones', 
      subTitle: 'Varios botones en Flutter', 
      link: '/buttons', 
      icon: Icons.smart_button_outlined
    ),
    
    MenuItem(
      title: 'Tarjetas', 
      subTitle: 'Un contenedor estilizado', 
      link: '/cards', 
      icon: Icons.credit_card
    ),

    MenuItem(
      title: 'ProgressIndicators', 
      subTitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded
    ),

    MenuItem(
      title: 'Snackbars and Dialogs', 
      subTitle: 'Snackbars, dialogs, and other utility widgets', 
      link: '/snackbar', 
      icon: Icons.info_outline
    ),

    MenuItem(
      title: 'Animated container', 
      subTitle: 'Stateful widget  animated', 
      link: '/animated', 
      icon: Icons.check_box_outline_blank_rounded
    ),

    MenuItem(
      title: 'UI Controls + Tiles', 
      subTitle: 'a series of flutter controls', 
      link: '/ui-controls', 
      icon: Icons.car_rental_outlined
    ),

    MenuItem(
      title: 'Introduction tutorial', 
      subTitle: 'A short introductory tutorial', 
      link: '/tutorial', 
      icon: Icons.accessible_rounded
    ),

    MenuItem(
      title: 'InfiniteScroll and Pull to refresh', 
      subTitle: 'A screen with infinite scroll and pull to refresh', 
      link: '/infinite', 
      icon: Icons.list_alt_rounded
    ),
  ];



