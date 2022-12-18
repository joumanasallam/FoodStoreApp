import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/shared/cubit/cubit.dart';
import 'package:task/shared/cubit/states.dart';

import '../shared/component.dart/component.dart';

class FvoriteScreen extends StatelessWidget {
  const FvoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, Appstates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            List favo= cubit.getfavoritelist();
            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Favorite List",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      favo.isNotEmpty?  GridView.count(
                          crossAxisCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1 / 0.5,
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            cubit.getfavoritelist().length,
                            (index) => offersWidget(
                              
                                favo[index]["name"],
                                favo[index]["quantitiy"],
                                favo[index]["distance"],
                                favo[index]["price"],
                                favo[index]["oldPrice"],
                                favo[index]["isfavorite"], () {
                              cubit.addToFavorite(favo[index]);
                            }, context,favo[index]["image"]),
                          ),
                        ):const Center(
                          child: Text("No Favorite products"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
