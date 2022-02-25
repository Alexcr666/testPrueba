import 'dart:async';


import 'package:trii/data/models/UserModel2.dart';
import 'package:trii/data/networking/api.dart';
import 'package:trii/generated/l10n.dart';


import 'package:trii/app/app_constants.dart';
import 'package:trii/redux2/app/app_state.dart';
import 'package:trii/redux2/settingApp/settingsHomeActions.dart';
import 'package:trii/redux2/settingApp/store.dart';
import 'package:trii/redux2/store.dart';

import 'package:trii/styles/colors.dart';
import 'package:trii/styles/style.dart';

import 'package:trii/utils/adapt_screen.dart';
import 'package:trii/widget/card/cardInicio.dart';
import 'package:trii/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:redux/redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//import 'package:google_sign_in/google_sign_in.dart';

import 'dart:convert';
import 'dart:math';

import 'dart:math';
import 'dart:ui';

import '../../styles/colors.dart';
class usersListProfilePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  usersListProfilePage({Key key,this.user}) : super(key: key);

  final Result user;
  @override
  _usersListProfileState createState() => _usersListProfileState();
}

var _store;
class _usersListProfileState extends State<usersListProfilePage> {
  
Widget itemProfile({String title,String data}){
  return  Container(margin: EdgeInsets.only(left: 5,right: 5,top:10),child:Row(

    mainAxisAlignment: MainAxisAlignment.center ,
crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        
                                          Text( title.toString()+": ",
                                            style: AppStyle().styleText(16, Colors.black54, true)),
                                            SizedBox(width:10),
                                        Text( data.toString(),
                                            style: AppStyle().styleText(15, Colors.black54, false)),
                                      ],
                                    ));
}
  @override
  Widget build(BuildContext context) {
    AdaptScreen.initAdapt(context);


    return



      Scaffold(
        body: StoreProvider<AppStateHome>(
          //ReduxSignUp.store,
            store: ReduxHome.store,
            child: StoreConnector<AppStateHome, dynamic>(
                distinct: true,
                converter: (store) => store.state.postsState,
                onInit: (store) {
                  _store = store;
                },
                builder: (context, value) {
                  return RefreshIndicator(
                      onRefresh: () {

                      refreshList();
                      },
                      child:Stack(children: <Widget>[
                        Positioned(
                            top: -60.0, right: -35, child: _decorationBox()),
                        Container(
                          padding: EdgeInsets.all(15.0),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          child: ListView(


                            children: [

                              Container(
                                margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
IconButton(
                                      icon: Icon(Icons.arrow_back, color: Colors.black),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                     ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AppWidget().widgetImage(
                    widget.user.image.toString(),
                      200,
                      200,
                    ),
                  ),
                                       SizedBox(height: 20,),
                                    Text(
                                      widget.user.name,
                                      style: AppStyle().styleText(25, Colors.black, true),
                                    ),
                                    SizedBox(height: 20,),
                                   itemProfile(title: "Nombre",data: widget.user.name.toString()),

                                       itemProfile(title: "Estado",data: widget.user.status.toString()),
                                           itemProfile(title: "Specie",data: widget.user.species.toString()),
                                               itemProfile(title: "Tipo",data: widget.user.type.toString()),
                                                   itemProfile(title: "Genero",data: widget.user.gender.toString()),
  SizedBox(height: 20,),
                                     ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:  widget.user.episode.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                              
                           
                               return ListTile(
                                 title: Text( "Episodio: "+index.toString()),
                                 leading :Icon(Icons.play_circle),
                                 onTap: (){
       void _launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
_launchURL(widget.user.episode[index].toString());
                                 },

                                    subtitle: Text(  widget.user.episode[index]),
                               );
                              }),


                                  ],
                                ),
                              ),
                                SizedBox(height: 20,),
                              Text(
                               "Ubicación: ",
                                style: AppStyle().styleText(20, Colors.black, true),
                              ),
                                SizedBox(height: 20,),

                                itemProfile(title: "Nombre",data: widget.user.location.name),
                                     itemProfile(title: "Url",data: widget.user.location.url),
                                       SizedBox(height: 20,),
                               Text(
                               "Origen: ",
                                style: AppStyle().styleText(20, Colors.black, true),
                              ),
                                SizedBox(height: 20,),

                                itemProfile(title: "Nombre",data: widget.user.origin.name),
                                 itemProfile(title: "Url",data: widget.user.origin.url),
                            
                            ],
                          ),
                        ),
                      ]));
                })),

      );
  }



  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 360.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
                AppColors.mainColor,
                AppColors.main2Color,
              ])),
        ));
  }
  refreshList(){
  
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshList();
  }
}



class RefreshItemsAction {
  final Completer<Null> completer;

  RefreshItemsAction({Completer completer})
      : this.completer = completer ?? Completer<Null>();
}
