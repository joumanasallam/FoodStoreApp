import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/modules/product.dart';
import 'package:task/shared/component.dart/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return state is !AppLoadingState ? SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        adressContanier("Mostafa ST.",context),
                        Container(
                          width: MediaQuery.of(context).size.width*0.14,
                          height: MediaQuery.of(context).size.height*0.08,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(25)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    searchfield(context),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //fe sho8l
                        adress(cubit.adress[0]["mainTitle"], cubit.adress[0]["adress"], cubit.adress[0]["floor"],context),
                        adress(cubit.adress[1]["mainTitle"], cubit.adress[1]["adress"],
                           cubit.adress[1]["floor"],context),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Explore by category",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height*0.15,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...cubit.catogery.map((e) {
                                return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: InkWell(
                                      onTap:(){
                                        cubit.search(cubit.product, e["id"]);
                                        navigator(context,const ProductScreen());
                                      } ,
                                      child: catogeryWidget(e["name"],context,e["url"])));
                              }).toList(),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Deals of to day",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.16,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...cubit.deals.map((e) {
                              return offersWidget(
                                
                                  e["name"],
                                  e["quantitiy"],
                                  e["distance"],
                                  e["price"],
                                  e["oldPrice"],
                                  e["isfavorite"], () {
                                cubit.addToFavorite(e);
                              },context,e["image"]);
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width*0.9,
                        height: MediaQuery.of(context).size.height*0.23,
                        decoration: BoxDecoration(
                            color: const Color(0xffF8BBD0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Mega",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "W H O P P",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff4A148C),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "E ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "P",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff4A148C),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "17 \$",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.redAccent),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "32 \$",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Avilable until 24 Dec 2022",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ):const Center(child: CircularProgressIndicator(color: Colors.redAccent),);
        });
  }
}
