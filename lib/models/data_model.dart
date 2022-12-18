// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));



class FoodModel {
    FoodModel({
        this.product,
        this.catogeries, 
        this.adress,
        this.deals
    });

    List<Product>? product;
    List<Catogery>? catogeries;
    List<Adress>? adress;
    List<Deals>? deals;

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        catogeries: List<Catogery>.from(json["catogeries"].map((x) => Catogery.fromJson(x))),
          adress: List<Adress>.from(json["adress"].map((x) => Adress.fromJson(x))),
        deals: List<Deals>.from(json["deals"].map((x) => Deals.fromJson(x))),
    );

    
}

class Catogery {
    Catogery({
        this.id,
        this.name,
        this.url
    });

    int? id;
    String? name;
    String? url;

    factory Catogery.fromJson(Map<String, dynamic> json) => Catogery(
        id: json["id"],
        name: json["name"],
        url: json["url"],
    );

  
}

class Product {
    Product({
        this.catogeries,
        this.name,
        this.image,
        this.quantitiy,
        this.distance,
        this.price,
        this.oldPrice,
        this.isfavorite,
        this.isincard,
        this.title,
    });

    int? catogeries;
    String? name;
    String? image;
    int? quantitiy;
    String? distance;
    int? price;
    int? oldPrice;
    bool? isfavorite;
    bool? isincard;
    String? title;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        catogeries: json["catogeries"],
        name: json["name"],
        image: json["image"],
        quantitiy: json["quantitiy"],
        distance: json["distance"],
        price: json["price"],
        oldPrice: json["oldPrice"],
        isfavorite: json["isfavorite"],
        isincard: json["isincard"],
        title: json["title"],
    );

   
}
class Adress {
    Adress({
        this.mainTitle,
        this.adress,
        this.floor
    });

    String? mainTitle;
    String? adress;
    String? floor;

    factory Adress.fromJson(Map<String, dynamic> json) => Adress(
        mainTitle: json["mainTitle"],
        adress: json["adress"],
        floor: json["floor"],
    );

  
}

class Deals {
    Deals({
       
        this.title,
        this.image,
        this.quantitiy,
        this.distance,
        this.price,
        this.oldPrice,
        this.isfavorite,
       
       
    });

    String? title;
    String? image;
    int? quantitiy;
    String? distance;
    int? price;
    int? oldPrice;
    bool? isfavorite;
 

    factory Deals.fromJson(Map<String, dynamic> json) => Deals(
       
        title: json["title"],
        image: json["image"],
        quantitiy: json["quantitiy"],
        distance: json["distance"],
        price: json["price"],
        oldPrice: json["oldPrice"],
        isfavorite: json["isfavorite"],
        
    );

   
}