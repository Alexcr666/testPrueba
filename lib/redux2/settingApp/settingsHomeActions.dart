
import 'package:pruebaTest/redux2/common_actions.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';



class getTokenUserAction extends ErrorAction {
  getTokenUserAction(BuildContext context) : super(context);

}

class getCountryListAction extends ErrorAction {
  getCountryListAction(BuildContext context) : super(context);

}



@immutable
class SetPostsStateActionHome {
  final PostsStateHome postsState;

  SetPostsStateActionHome(this.postsState);
}
