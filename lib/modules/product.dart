import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/shared/cubit/cubit.dart';
import 'package:task/shared/cubit/states.dart';

import '../shared/component.dart/component.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var list= cubit.getnewproductlist();
          return state is !AppLoadingState ?  Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Product List",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        
                        height: 20,
                      ),
                      GridView.count(
                      
                        crossAxisCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1 / 0.5,
                        scrollDirection: Axis.vertical,
                        children: List.generate(
                          list.length,
                          (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              offersWidget(
                                  
                                  list[index]["name"],
                                 list[index]["quantitiy"],
                                  list[index]["distance"],
                                  list[index]["price"],
                                list[index]["oldPrice"],
                                  list[index]["isfavorite"], () {
                                cubit.addToFavorite( list[index]);
                              }, context,
                              list[index]["image"]),
                              IconButton(
                                onPressed: () {
                                  cubit.addToCard( list[index]);
                                },
                                icon: Icon(size: 40,
                                color: Colors.redAccent,
                                
                                   list[index]["isincard"]
                                    ? Icons.remove
                                    : Icons.add),
                              ),
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ):const Center(child: CircularProgressIndicator(color: Colors.redAccent),);
        });
  }
}
