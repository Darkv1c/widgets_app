import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String route;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.icon,
  });
}

final List<MenuItem> menuItems = [
  MenuItem(
    title: 'Buttons',
    subtitle: 'Flutter buttons',
    route: '/buttons',
    icon: Icons.info,
  ),
  MenuItem(
    title: 'Cards',
    subtitle: 'customized cards',
    route: '/cards',
    icon: Icons.contact_mail,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'General and controlled',
    route: '/progress-indicators',
    icon: Icons.circle,
  ),
  MenuItem(
    title: 'Snackbars',
    subtitle: 'Snackbars & dialogs',
    route: '/snackbars',
    icon: Icons.snapchat,
  ),
];
