
import 'package:pruebaTest/data/models/UserModel2.dart';
import 'package:meta/meta.dart';


@immutable
class PostsStateHome {
  final bool isError;
  final bool isLoading;

  final ModelActivityUser dataUserList;

  // final List<modelFavorites> posts;

  PostsStateHome({

    this.isError,

    this.isLoading,

    this.dataUserList,

    //this.posts,
  });

  factory PostsStateHome.initial() => PostsStateHome(
        isLoading: false,
        isError: false,


    dataUserList: null,

      );

  PostsStateHome copyWith({
    @required bool isError,

    @required bool isLoading,

    @required ModelActivityUser dataUserList,

  }) {
    return PostsStateHome(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,


      dataUserList: dataUserList ?? this.dataUserList,

    );
  }
}
