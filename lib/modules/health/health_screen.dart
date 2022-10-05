import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/componentes.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HealthScreen extends StatelessWidget {

  const HealthScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).health;

        return articleBuilder(list, context);
      },
    );
  }
}
