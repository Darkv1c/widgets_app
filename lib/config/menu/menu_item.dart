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
  MenuItem(
    title: 'Animated container',
    subtitle: 'animations',
    route: '/animated-screen',
    icon: Icons.animation,
  ),
  MenuItem(
    title: 'UI Controls',
    subtitle: 'UI Controls Screen',
    route: '/ui-controls',
    icon: Icons.control_point,
  ),
  MenuItem(
    title: 'Tutorial',
    subtitle: 'App introduction',
    route: '/tutorial',
    icon: Icons.school,
  ),
];
