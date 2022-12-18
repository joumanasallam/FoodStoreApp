import 'package:flutter/material.dart';

Widget adressContanier(String title, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.35,
    height: MediaQuery.of(context).size.height * 0.075,
    decoration: const BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(100),
        )),
    child: Row(
      children: [
        const Icon(Icons.location_on_outlined, color: Colors.white),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}

Widget searchfield(BuildContext context) {
  return Stack(children: [
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
          color: Colors.grey[200],
        ),
        child: TextFormField(
          textAlign: TextAlign.left,
          decoration: const InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "search in thousands of products",
          ),
        ),
      ),
    ),
  ]);
}

Widget adress(
    String? mainTitle, String? adress, String? floor, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: MediaQuery.of(context).size.height * 0.1,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.14,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$mainTitle",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
          ),
          Text(
           "$adress",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Text(
            "$floor",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          )
        ],
      )
    ]),
  );
}

Widget catogeryWidget(String? name, BuildContext context,String? url) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
           image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('$url'),),
            color:  const Color(0xffF8BBD0), borderRadius: BorderRadius.circular(15)),
      ),
      Text(
        name!,
        style: const TextStyle(color: Colors.grey),
      ),
    ],
  );
}

Widget offersWidget(
    
    String? title,
    int? quantitiy,
    String? distance,
    int? price,
    int? oldPrice,
    bool? isfavorite,
    dynamic fun,
    BuildContext context,
    String? url) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.70,
    height: MediaQuery.of(context).size.height * 0.16,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Stack(alignment: Alignment.topLeft, children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width * 0.28,
          height: MediaQuery.of(context).size.height * 0.16,
          decoration: BoxDecoration(
             image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('$url'),),
              color:  const Color(0xffF8BBD0),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
        ),
        InkWell(
            onTap: fun,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              radius: 15,
              child: isfavorite!
                  ? const Icon(Icons.favorite, size: 20)
                  : const Icon(Icons.favorite_border_outlined, size: 20),
            ))
      ]),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$title",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
          ),
          Text(
            "$quantitiy pices",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Text(
            "$distance",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                "$price\$",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.redAccent),
              ),
              const SizedBox(width: 10,),
              Text(
                "$oldPrice\$",
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              ),
            ],
          )
        ],
      )
    ]),
  );
}

navigator(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

Widget cardWidget(BuildContext context, String title, String info, int price,
    int quantitiy,dynamic decressfun,dynamic incressfun ,String? url){
  return Container(
    width: MediaQuery.of(context).size.width * 75,
    height: MediaQuery.of(context).size.height * 0.16,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width * 0.22,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('$url'),),
            color: const Color(0xffF8BBD0), borderRadius: BorderRadius.circular(15)),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
          ),
          Text(
            info,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
          ),
          Text(
            "$price\$",
            style: const TextStyle(fontSize: 20, color: Colors.redAccent),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: decressfun,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(Icons.remove),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            "$quantitiy",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            width: 3,
          ),
          InkWell(
            onTap: incressfun,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      )
    ]),
  );
}
