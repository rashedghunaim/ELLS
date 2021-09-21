import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class NavigationModel {
  String title;
  IconData icon;
  Function iconOntap;

  NavigationModel({this.title, this.icon, this.iconOntap});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Requests", icon: MyIcons.request),
  NavigationModel(title: "Dashboard", icon: MyIcons.userdashboard2),
  NavigationModel(title: "My Network", icon: MyIcons.network),
  NavigationModel(title: "Settings", icon: Icons.settings),
];
