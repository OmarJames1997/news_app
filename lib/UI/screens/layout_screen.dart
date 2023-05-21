
import 'package:booking_ps_figma/data/cubit/cubit.dart';
import 'package:booking_ps_figma/data/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = AppCubit.i(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white),
            actions: [
              Image.asset('assets/images/Search....jpg'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.dark_mode),
                color: Colors.black38,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_bar_outlined), label: 'Sports'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.setCurrentIndex(index);
            },
            selectedItemColor: const Color(0xFF3F92A4),
            unselectedFontSize: 12,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Newsly',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'assets/fonts/static/LexendZetta-Bold.ttf'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    color: Colors.grey,
                    width: 350,
                    height: 3,
                  ),
                ),
              ),
              Expanded(child: cubit.screens[cubit.currentIndex]),
            ],
          ),
        );
      },
    );
  }
}
