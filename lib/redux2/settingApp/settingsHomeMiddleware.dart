import 'dart:async';

import 'package:pruebaTest/app/app_settings.dart';
import 'package:pruebaTest/data/models/CountryList.dart';
import 'package:pruebaTest/data/models/TokenModel.dart';


import 'package:pruebaTest/data/networking/api.dart';
import 'package:pruebaTest/redux2/app/app_state.dart';
import 'package:pruebaTest/redux2/settingApp/settingsHomeState.dart';
import 'package:pruebaTest/redux2/settingApp/store.dart';
import 'package:pruebaTest/redux2/store.dart';
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
  
       if (action is getTokenUserAction) {
        return _getTokenUser(next, action, store);
      }

        if (action is getCountryListAction) {
        return _getCountryList(next, action, store);
      }
    }
  }


  Future<void> _getCountryList(
      NextDispatcher next, getCountryListAction action, Store<AppState> store) async {


    // try {
    var response = await API().getCountryList();

    switch (response.statusCode) {
      case AppSettings.statusCodeSuccess:


    List<CountryListModel> data = countryListModelFromJson(response.data);

       // print("prueba2: "+data.length.toString());
        ReduxHome.store.dispatch(
          SetPostsStateActionHome( PostsStateHome(
              countryListModel: data,
          )),
        );



        break;
      case AppSettings.statusCodeError:

        AlertWidget().message(action.context, response.message);


        break;
      default:
        AlertWidget().message(action.context, response.message);
    }
    /*} catch (e) {

      AlertWidget().message(action.context, e.toString());
    }*/
  }


  Future<void> _getTokenUser(
      NextDispatcher next, getTokenUserAction action, Store<AppState> store) async {


    // try {
    var response = await API().getToken(
    );


    switch (response.statusCode) {
      case AppSettings.statusCodeSuccess:
   
        TokenModel data =tokenModelFromJson(response.data.toString());

     
        ReduxHome.store.dispatch(
          SetPostsStateActionHome( PostsStateHome(
             tokenModel: data,
          )),
        );

 asinc() async {
      Store<AppState> store =
      await createStore(api: API());


      store.dispatch(getCountryListAction(
        action.context,
      ));
    }

    asinc();


        break;
      case AppSettings.statusCodeError:

        AlertWidget().message(action.context, response.message);


        break;
      default:
        AlertWidget().message(action.context, response.message);
    }
    /*} catch (e) {

      AlertWidget().message(action.context, e.toString());
    }*/
  }


