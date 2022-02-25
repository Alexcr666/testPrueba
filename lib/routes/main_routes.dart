import 'package:trii/ui/login/login_screen.dart';
import 'package:trii/ui/main/main_screen.dart';
import 'package:trii/ui/profile/profileScreen.dart';
import 'package:flutter/material.dart';

final mainRoutes = {
  'login': (BuildContext context) => LoginScreen(),
  'main': (BuildContext context) => usersListPage(),
  'profile': (BuildContext context) => usersListProfilePage(),
};
