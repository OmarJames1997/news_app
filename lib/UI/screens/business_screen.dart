import 'package:booking_ps_figma/data/cubit/cubit.dart';
import 'package:booking_ps_figma/data/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';

class BusinessScreen extends StatefulWidget {
  BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    if (AppCubit.i(context).businessModel == null)
      AppCubit.i(context).getNewes('business');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state)  {
        if (state is NewesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return
          Column(
            children:
            [
              if(AppCubit.i(context).businessModel!=null)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        ArticleWidget(data: AppCubit.i(context).businessModel!.articles![index]),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(height: 1, color: Colors.black.withOpacity(0.6)),
                    ),
                    itemCount: AppCubit.i(context).businessModel!.articles!.length,
                  ),
                ),
            ]

          );

      }
    );
  }
}
