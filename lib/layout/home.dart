import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:task/shared/cubit/cubit.dart';
import 'package:task/shared/cubit/states.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
              body: SpinCircleBottomBarHolder(
                  bottomNavigationBar: SCBottomBarDetails(
                      activeIconTheme: const IconThemeData(color: Colors.redAccent,weight: 0.5),
                      activeTitleStyle: const TextStyle(color: Colors.redAccent),
                      actionButtonDetails: SCActionButtonDetails(
                          color: Colors.redAccent,
                          icon: const Icon(Icons.add_shopping_cart_outlined),
                          elevation: 0.5),
                      bnbHeight: 60,
                      items: [
                        SCBottomBarItem(
                            icon: Icons.store,
                            title: "Grocery",
                            onPressed: () {
                              cubit.changeindex(0);
                            }),
                        SCBottomBarItem(
                            icon: Icons.notifications_none_outlined,
                            title: "News",
                            onPressed: () {
                              cubit.changeindex(1);
                            }),
                        SCBottomBarItem(
                            icon: Icons.favorite_outline,
                            title: "Favorites",
                            onPressed: () {
                              cubit.changeindex(2);
                            }),
                        SCBottomBarItem(
                            icon: Icons.cases_outlined,
                            title: "Cart",
                            onPressed: () {
                              cubit.changeindex(3);
                            }),
                      ],
                      circleItems: []),
                  child: cubit.screens[cubit.index]));
        });
  }
}
