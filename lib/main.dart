
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/bloc_observer.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/layout/news_app/news_layout.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/styles/themes.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark: isDark));
}



class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({
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
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => ModeCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: SplashScreenView(
              duration: 3500,
              pageRouteTransition: PageRouteTransition.SlideTransition,
              navigateRoute: News_Screen(),
              text: 'Breaking News 🎤️🗞️',
              textType: TextType.ColorizeAnimationText,
              textStyle: GoogleFonts.libreBaskerville(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
              ),
              colors:  [
                ModeCubit.get(context).isDark
                    ? Colors.white
                    : Colors.black ,
                Colors.green,
                Colors.green,
                Color(0xff04043A),
              ],
              backgroundColor: ModeCubit.get(context).isDark
                  ? const Color(0xff04043A)
                  :  Colors.white
            ),
          );
        },
      ),
    );
  }
}