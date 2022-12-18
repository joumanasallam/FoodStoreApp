import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component.dart/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          List card = cubit.getCardlist();
          var price=cubit.totalprice;
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        adressContanier("Oxford ST.", context),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.14,
                          height: MediaQuery.of(context).size.height * 0.08,
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
                    const Text(
                      "Product List",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    card.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...card.map((e) {
                                return cardWidget(context, e["name"],
                                    e["distance"], e["price"], e["quantitiy"], () {
                                  cubit.decressquntiity(e);
                                  cubit.zero();
                                }, () {
                                  cubit.incressquntiity(e);
                                   cubit.zero(); 
                                },e["image"]);
                              }).toList(),
                              Center(
                            child: MaterialButton(onPressed: (){
                              cubit.totalPrice();
                         
                            }
                            ,
                            color: Colors.redAccent,child: const Text("calculate total price",style: TextStyle(color: Colors.white),),),
                          ),
                    Row(
                      children: [
                        const Text(
                          "Total Price:",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),  Text(
                          "$price",
                          style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),

                      ],
                    ),
                            ],
                          )

                        : const Center(
                            child: Text("Choose products first"),
                          ),
                          

                  ],
                ),
              ),
            ),
          );
        });
  }
}
