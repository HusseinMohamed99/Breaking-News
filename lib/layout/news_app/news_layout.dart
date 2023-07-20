import 'package:breaking_news/modules/search/search_screen.dart';
import 'package:breaking_news/shared/components/navigator.dart';
import 'package:breaking_news/shared/cubit/cubit.dart';
import 'package:breaking_news/shared/cubit/states.dart';
import 'package:breaking_news/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                  size: 24.sp,
                  color: cubit.isDark
                      ? AppColorsLight.secondaryColor
                      : AppMainColors.blueColor,
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  size: 24.sp,
                  color: cubit.isDark
                      ? AppColorsLight.secondaryColor
                      : AppMainColors.blueColor,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
