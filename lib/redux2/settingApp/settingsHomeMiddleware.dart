import 'dart:async';

import 'package:pruebaTest/app/app_settings.dart';

import 'package:pruebaTest/data/models/UserModel2.dart';
import 'package:pruebaTest/data/networking/api.dart';
import 'package:pruebaTest/redux2/app/app_state.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';
import 'package:pruebaTest/redux2/settingApp/store.dart';
import 'package:pruebaTest/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


import 'settingsHomeActions.dart';

class settingHomeMiddleware extends MiddlewareClass<AppState> {
  settingHomeMiddleware(this.api);

  final API api;

  @override
  Future<void> call(
      Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
  
       if (action is getListUserAction) {
        return _getListUser(next, action, store);
      }
    }
  }


  Future<void> _getListUser(
      NextDispatcher next, getListUserAction action, Store<AppState> store) async {
    print("prueba67");

    // try {
    var response = await API().getUser2(
    );


    switch (response.statusCode) {
      case AppSettings.statusCodeSuccess:
        print("prueba1: "+response.data.toString());

        ModelActivityUser data =modelActivityUserFromJson(response.data.toString());

       // print("prueba2: "+data.length.toString());
        ReduxHome.store.dispatch(
          SetPostsStateActionHome( PostsStateHome(
              dataUserList: data
          )),
        );



        break;
      case AppSettings.statusCodeError:

        AlertWidget().message(action.context, response.message);

        // alertConfirmNumber2(action.context);
        // alertForgortPassword3(action.context);

        break;
      default:
        AlertWidget().message(action.context, response.message);
    }
    /*} catch (e) {

      AlertWidget().message(action.context, e.toString());
    }*/
  }


