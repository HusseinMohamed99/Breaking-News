
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/entertainment/entertainment_screen.dart';
import 'package:news/modules/general/general_screen.dart';
import 'package:news/modules/health/health_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/modules/technology/technology_screen.dart';
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
          Icons.home_outlined,
        ),
        label: 'General'),
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
    BottomNavigationBarItem(
        icon: Icon(
          Icons.laptop,
        ),
        label: 'Technology'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.health_and_safety_outlined,
        ),
        label: 'Health'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.games_outlined,
        ),
        label: 'Entertainment'),
  ];
  List<Widget> screens = [
    GeneralScreen(),
    Sports_Screen(),
    BusinessScreen(),
    ScienceScreen(),
    TechnologyScreen(),
    HealthScreen(),
    EntertainmentScreen(),

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getBusiness();
    if (index == 3) getScience();
    if (index == 4) getTechnology();
    if (index == 5) getHealth();
    if (index == 6) getEntertainment();

    emit(NewsBottomNavState());
  }

  List<dynamic> general = [];

  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
    if (general.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'general',
          'apiKey': '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value) {
        general = value.data['articles'];
        debugPrint(general[0]['title']);
        emit(NewsGetGeneralSuccessState());
      }).catchError((Error) {
        debugPrint(Error.toString());
        emit(NewsGetGeneralErrorState(Error.toString()));
      });
    } else {
      emit(NewsGetGeneralSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
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

  void getBusiness() {
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

  void getScience() {
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

  List<dynamic> technology = [];

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
    if (technology.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'technology',
          'apiKey': '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value) {
        technology = value.data['articles'];
        debugPrint(technology[0]['title']);
        emit(NewsGetTechnologySuccessState());
      }).catchError((Error) {
        debugPrint(Error.toString());
        emit(NewsGetTechnologyErrorState(Error.toString()));
      });
    } else {
      emit(NewsGetTechnologySuccessState());
    }
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());
    if (health.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'health',
          'apiKey': '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value) {
        health = value.data['articles'];
        debugPrint(health[0]['title']);
        emit(NewsGetHealthSuccessState());
      }).catchError((Error) {
        debugPrint(Error.toString());
        emit(NewsGetHealthErrorState(Error.toString()));
      });
    } else {
      emit(NewsGetHealthSuccessState());
    }
  }

  List<dynamic> entertainment = [];

  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    if (entertainment.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'entertainment',
          'apiKey': '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value) {
        entertainment = value.data['articles'];
        debugPrint(entertainment[0]['title']);
        emit(NewsGetEntertainmentSuccessState());
      }).catchError((Error) {
        debugPrint(Error.toString());
        emit(NewsGetEntertainmentErrorState(Error.toString()));
      });
    } else {
      emit(NewsGetEntertainmentSuccessState());
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
