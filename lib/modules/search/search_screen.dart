import 'package:breaking_news/shared/components/widgets.dart';
import 'package:breaking_news/shared/cubit/cubit.dart';
import 'package:breaking_news/shared/cubit/states.dart';
import 'package:breaking_news/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0).r,
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      fillColor: AppMainColors.greyColor,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                      label: const Text(
                        'Search',
                      ),
                      labelStyle: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                ),
              ),
              Expanded(
                child: articleBuilder(
                  list: list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
