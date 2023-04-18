import 'package:bloc/bloc.dart';
import 'package:bloctest/viewmodel/database/network/dio-helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/postmodel.dart';
import '../../../database/network/end_points.dart';
import 'poststate.dart';

class PostCubit extends Cubit<PostsState> {
  PostCubit() : super(PostsInitial());

  List<PostModel> postModel = [];

  static PostCubit get(context) => BlocProvider.of(context);

  void getpost() {
    emit(PostsLoading());
    DioHelper.getData(url: baseUrl + posts).then((value) {
      print(value);
      for (var i in value.data) {
        postModel.add(PostModel.fromJson(i));
      }

      emit(PostsSuccess());
    }).catchError((onError){
      print(onError);
      emit(PostsError());

    });
  }
}