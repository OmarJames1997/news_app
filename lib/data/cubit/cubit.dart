import 'package:booking_ps_figma/data/cubit/states.dart';
import 'package:booking_ps_figma/shared/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../UI/screens/business_screen.dart';
import '../../UI/screens/science_screen.dart';
import '../../UI/screens/sports_screen.dart';
import '../model/Newes_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
   int currentIndex = 0;

  // Calling an Object From The Dio Helper
  //    To be called inside a method in the Cubit
  DioHelper dioHelper = DioHelper();

  static AppCubit i(BuildContext context) => BlocProvider.of(context);

  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(SetCurrentState());
  }

  NewsModel? businessModel;
  NewsModel? sportsModel;
  NewsModel? scienceModel;

  final List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen()
  ];
  bool isSearchLoading=false;



  void getNewes(String category) {
    emit(NewesLoadingState());
    dioHelper.get(
      path:"top-headlines",
      params: {
        'country':'us',
        'category':category,
        'apiKey':'ea352a9ffbe34f61b2e14d3921957c41',

      },
    ).then((value) {
     switch (category){
       case 'business':
    businessModel=NewsModel.fromJson(value.data);
      break;
      case 'science' :
    scienceModel=NewsModel.fromJson(value.data);
      break;
      default:
    sportsModel=NewsModel.fromJson(value.data);
     }

    emit(NewesLoadedState());
    }).catchError((e){
      print(e.toString());
      emit(NewesfailedState());
    });
  }

  void search(String text) {
    isSearchLoading=true;
    emit(NewesLoadingState());
    dioHelper.getData(path: "everything", params: {
      "q": text,
      "apiKey": "ea352a9ffbe34f61b2e14d3921957c41",
    }).then((value) {
      businessModel = NewsModel.fromJson(value.data);
      isSearchLoading=false;
      emit(NewesLoadedState());
    }).catchError((e) {
      print(e.toString());
      isSearchLoading=false;
      emit(NewesfailedState());
    });
  }

}
