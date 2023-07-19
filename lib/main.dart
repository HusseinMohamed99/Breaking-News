import 'package:breaking_news/bloc_observer.dart';
import 'package:breaking_news/layout/news_app/news_layout.dart';
import 'package:breaking_news/shared/cubit/cubit.dart';
import 'package:breaking_news/shared/cubit/states.dart';
import 'package:breaking_news/shared/enum/enum.dart';
import 'package:breaking_news/shared/network/local/cache_helper.dart';
import 'package:breaking_news/shared/network/remote/dio_helper.dart';
import 'package:breaking_news/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Wakelock.enable();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  DioHelper.init();

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({
    super.key,
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getGeneral()
            ..getEntertainment()
            ..getHealth()
            ..getTechnology()
            ..getSports()
            ..getBusiness()
            ..getScience()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Breaking News🗞️',
                debugShowCheckedModeBanner: false,
                theme: getThemeData[AppTheme.lightTheme],
                darkTheme: getThemeData[AppTheme.darkTheme],
                themeMode: NewsCubit.get(context).isDark
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: const NewsScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
