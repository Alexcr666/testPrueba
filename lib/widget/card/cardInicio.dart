
import 'package:pruebaTest/data/models/CountryList.dart';

import 'package:pruebaTest/styles/colors.dart';
import 'package:pruebaTest/styles/style.dart';

import 'package:pruebaTest/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppCard {
  /*Widget widgetCardHomePost(BuildContext context, PostModel data) {
    return Card(
      elevation: 2,
      child:  Container(
        margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              data.title,
              style: AppStyle().styleText(18, Colors.black, true),
            ),

                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(data.body.toString(),
                      style: AppStyle().styleText(14, Colors.grey, false)),
                ),



          ],
        ),
      ),
    );
  }*/
  Widget widgetCardHome(BuildContext context, CountryListModel data) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: () {
       

   String url = "https://www.google.com/maps/place/"+data.countryName.toString();
_launchURL() async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL()
;
        },
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: Stack(
            children: [
              Row(
                children: [
               
               
                 Container(
                   padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    
    boxShadow: [
      BoxShadow(color: Colors.grey, spreadRadius: 2),
    ],
  ),
                   child: Text(
                         data.countryShortName.toString(),
                          style: AppStyle().styleText(30,  AppColors.main2Color, true),
                        )),
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.countryName,
                          style: AppStyle().styleText(20,  AppColors.main2Color, true),
                        ),
                        Row(
                          children: [
                          
                            Text("Nombre corto: "+data.countryShortName,
                                style: AppStyle().styleText(16, Colors.black, false)),
                          ],
                        ),
                        Row(
                          children: [
                          
                            Text("Codigo pais: "+data.countryPhoneCode.toString(),
                                style: AppStyle().styleText(16, Colors.black, false)),
                          ],
                        ),


                     
                        
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
