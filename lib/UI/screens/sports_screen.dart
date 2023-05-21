import 'package:booking_ps_figma/data/cubit/cubit.dart';
import 'package:booking_ps_figma/data/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';

class SportsScreen extends StatefulWidget {
  SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {

  @override
  void initState() {
    if(AppCubit.i(context).sportsModel == null) {
      AppCubit.i(context).getNewes('sports');
    }

  }
  @override
  Widget build(BuildContext context) {
    return

      BlocBuilder<AppCubit,AppStates>(
        builder: (context, state) => Expanded(
          child: ListView.separated(itemBuilder: (context, index) =>ArticleWidget(data: AppCubit.i(context).sportsModel!.articles![index]),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[300],
              ),
              itemCount:AppCubit.i(context).sportsModel!.articles!.length),
        ),
      );
  }
}
