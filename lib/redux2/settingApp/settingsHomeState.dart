
import 'package:pruebaTest/data/models/CountryList.dart';
import 'package:pruebaTest/data/models/TokenModel.dart';

import 'package:meta/meta.dart';


@immutable
class PostsStateHome {
  final bool isError;
  final bool isLoading;



  final List<CountryListModel> countryListModel;
  final TokenModel tokenModel;

  // final List<modelFavorites> posts;

  PostsStateHome({

    this.isError,

    this.isLoading,


    this.countryListModel,
    this.tokenModel,
  

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        isLoading: false,
        isError: false,



    countryListModel: null,
    tokenModel: null,

      );

  PostsStateHome copyWith({
    @required bool isError,

    @required bool isLoading,


    @required countryListModel,
    @required  tokenModel,

  }) {
    return PostsStateHome(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,



      countryListModel: countryListModel ?? this.countryListModel,
tokenModel: tokenModel ?? this.tokenModel,
    );
  }
}
