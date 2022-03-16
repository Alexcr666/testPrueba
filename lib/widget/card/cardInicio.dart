
import 'package:pruebaTest/data/models/UserModel2.dart';
import 'package:pruebaTest/styles/colors.dart';
import 'package:pruebaTest/styles/style.dart';
import 'package:pruebaTest/ui/profile/profileScreen.dart';
import 'package:pruebaTest/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Widget widgetCardHome(BuildContext context, Result data) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 15),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AppWidget().widgetImage(
                    data.image,
                      80,
                      80,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20,bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.name,
                          style: AppStyle().styleText(20,  AppColors.main2Color, true),
                        ),
                        Row(
                          children: [
                          
                            Text("Especie: "+data.species.toString(),
                                style: AppStyle().styleText(14, Colors.black, false)),
                          ],
                        ),
                        Row(
                          children: [
                          
                            Text("Episodios: "+data.episode.length.toString(),
                                style: AppStyle().styleText(14, Colors.black, false)),
                          ],
                        ),


                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => usersListProfilePage(user: data,),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 40,top: 20,bottom: 15),
                            child: Row(
                              children: [

                              //  Icon(Icons.email,color: AppColors.main2Color,size: 19,),
                                Text("VER EPISODIOS",
                                    style: AppStyle().styleText(16,  AppColors.main2Color, true)),
                              ],
                            ),
                          ),
                        )
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
