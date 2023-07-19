import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/entertainment/entertainment_screen.dart';
import 'package:news/modules/general/general_screen.dart';
import 'package:news/modules/health/health_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';
import 'package:news/modules/technology/technology_screen.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'General'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_basketball_sharp,
        ),
        label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
        ),
        label: 'Science'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.laptop,
        ),
        label: 'Technology'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.health_and_safety_outlined,
        ),
        label: 'Health'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.games_outlined,
        ),
        label: 'Entertainment'),
  ];
  List<Widget> screens = [
    const GeneralScreen(),
    const SportsScreen(),
    const BusinessScreen(),
    const ScienceScreen(),
    const TechnologyScreen(),
    const HealthScreen(),
    const EntertainmentScreen(),
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

  static const String apiKey = 'bac2e727513c4a49882b1e3c7aac6b5b';

  List<dynamic> general = [];

  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
    if (general.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'general',
          'apiKey': apiKey,
        },
      ).then((value) {
        general = value.data['articles'];
        debugPrint(general[0]['title']);
        emit(NewsGetGeneralSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetGeneralErrorState(error.toString()));
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
        'country': 'us',
        'category': 'sports',
        'apiKey': apiKey,
      },
    ).then((value) {
      sports = value.data['articles'];
      debugPrint(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': apiKey,
        },
      ).then((value) {
        business = value.data['articles'];
        debugPrint(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
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
          'country': 'us',
          'category': 'science',
          'apiKey': apiKey,
        },
      ).then((value) {
        science = value.data['articles'];
        debugPrint(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
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
          'country': 'us',
          'category': 'technology',
          'apiKey': apiKey,
        },
      ).then((value) {
        technology = value.data['articles'];
        debugPrint(technology[0]['title']);
        emit(NewsGetTechnologySuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
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
          'country': 'us',
          'category': 'health',
          'apiKey': apiKey,
        },
      ).then((value) {
        health = value.data['articles'];
        debugPrint(health[0]['title']);
        emit(NewsGetHealthSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetHealthErrorState(error.toString()));
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
          'country': 'us',
          'category': 'entertainment',
          'apiKey': apiKey,
        },
      ).then((value) {
        entertainment = value.data['articles'];
        debugPrint(entertainment[0]['title']);
        emit(NewsGetEntertainmentSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(NewsGetEntertainmentErrorState(error.toString()));
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
        'q': value,
        'apiKey': apiKey,
      },
    ).then((value) {
      search = value.data['articles'];
      debugPrint(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
}
