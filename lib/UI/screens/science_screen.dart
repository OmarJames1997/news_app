import 'package:booking_ps_figma/data/cubit/cubit.dart';
import 'package:booking_ps_figma/data/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/components.dart';

class ScienceScreen extends StatefulWidget {
  ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  @override
  void initState() {
    if (AppCubit.i(context).scienceModel == null)
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
                  if(AppCubit.i(context).scienceModel!=null)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            ArticleWidget(data: AppCubit.i(context).scienceModel!.articles![index]),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(height: 1, color: Colors.black.withOpacity(0.6)),
                        ),
                        itemCount: AppCubit.i(context).scienceModel!.articles!.length,
                      ),
                    ),
                ]

            );

        }
    );
  }
}
