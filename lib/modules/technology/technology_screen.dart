import 'package:breaking_news/shared/components/widgets.dart';
import 'package:breaking_news/shared/cubit/cubit.dart';
import 'package:breaking_news/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).technology;

        return articleBuilder(list: list, context);
      },
    );
  }
}
