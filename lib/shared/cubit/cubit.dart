import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/modules/favorite_screen.dart';
import 'package:task/modules/news_screen.dart';
import 'package:task/shared/cubit/states.dart';

import '../../modules/card.dart';
import '../../modules/main_screen.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

List favorite = [];
List card = [];
List newProductlist = [];

class AppCubit extends Cubit<Appstates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  List<Widget> screens = [
    const MainScreen(),
    const NewsScreen(),
    const FvoriteScreen(),
    const CardScreen(),
  ];

  List product = [];
  List catogery = [];
  List adress = [];
  List deals = [];

  Future<void> readJson() async {
    emit(AppLoadingState());
    final String response = await rootBundle.loadString("assets/data.json");

    final data = await json.decode(response);
    product = data["product"];
    catogery = data["catogeries"];
    adress = data["Adress"];
    deals = data["Deals"];

    emit(AppSucssesState());
  }

  void search(List list, int key) {
    newProductlist.clear();
    emit(AppLoadingState());
    for (int i = 0; i < list.length; i++) {
      if (list[i]["catogeries"] == key) {
        newProductlist.add(list[i]);
      }
    }

    emit(AppSucssesState());
  }

  var index = 0;

  void changeindex(int i) {
    index = i;
    emit(AppCurrentState());
  }

  void addToFavorite(dynamic e) {
    if (e["isfavorite"]) {
      e["isfavorite"] = !e["isfavorite"];
      favorite.remove(e);
    } else {
      e["isfavorite"] = !e["isfavorite"];
      favorite.add(e);
    }

    emit(AppCurrentState());
  }

  void addToCard(dynamic e) {
    if (e["isincard"]) {
      e["isincard"] = !e["isincard"];
      card.remove(e);
    } else {
      e["isincard"] = !e["isincard"];
      card.add(e);
    }

    emit(AppCurrentState());
  }

  List getfavoritelist() {
    return favorite;
  }

  List getCardlist() {
    return card;
  }

  List getnewproductlist() {
    return newProductlist;
  }

  void incressquntiity(dynamic e) {
    e["quantitiy"]++;
    emit(AppCurrentState());
  }

  void decressquntiity(dynamic e) {
    if (e["quantitiy"] > 0) {
      e["quantitiy"]--;
    }
    emit(AppCurrentState());
  }

  dynamic totalprice = 0;
  void totalPrice() {
    for (int i = 0; i < card.length; i++) {
      totalprice += card[i]["price"] * card[i]["quantitiy"];
    }
    emit(AppCurrentState());
  }

  void zero() {
    totalprice = 0;
  }
}

