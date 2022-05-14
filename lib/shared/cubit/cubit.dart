// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_types_as_parameter_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/shared/cubit/states.dart';
import '../../modules/science/science_screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_basketball_sharp,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
        ),
        label: 'Science'),
  ];
  List<Widget> screens = [
    Sports_Screen(),
    BusinessScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getbusiness();
    if (index == 2) getscience();

    emit(NewsBottomNavState());
  }

  List<dynamic> sports = [];

  void getsports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '0803a9972d064bd8b3b7379123ea164c',
      },
    ).then((value) {
      sports = value.data['articles'];
      debugPrint(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((Error) {
      debugPrint(Error.toString());
      emit(NewsGetSportsErrorState(Error.toString()));
    });
  }

  List<dynamic> business = [];

  void getbusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value) {
        business = value.data['articles'];
        debugPrint(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((Error) {
        debugPrint(Error.toString());
        emit(NewsGetBusinessErrorState(Error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> science = [];

  void getscience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value) {
        science = value.data['articles'];
        debugPrint(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((Error) {
        debugPrint(Error.toString());
        emit(NewsGetScienceErrorState(Error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '0803a9972d064bd8b3b7379123ea164c',
      },
    ).then((value) {
      //debugPrint(value.data['articles'][0]['title']);
      search = value.data['articles'];
      debugPrint(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
