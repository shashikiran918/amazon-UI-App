import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AmazonApp(),
  ));
}

class AmazonApp extends StatefulWidget {
  @override
  _AmazonAppState createState() => _AmazonAppState();
}

class _AmazonAppState extends State<AmazonApp> {
  //Here I'm going to create a custom widget for the items box
  Widget Items(String name, String category, String imgUrl, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // this widget will make your container clickable
        onTap: () {},
        child: Container(
          width: 180.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Image(
                image: NetworkImage(imgUrl),
                width: 170.0,
                height: 160.0,
                alignment: Alignment.center,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 22.0),
              ),
              Text(
                category,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                "$price",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Color(
                      0xFFFF9900,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Now I'm going to import a list of images that I collected from amazon website

  List<String> ImgUrl = [
    "https://m.media-amazon.com/images/I/61ptzNC8r8L._AC_UY327_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/71yYaNztZ0L._AC_UL480_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/71an9eiBxpL._AC_UY327_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/71aXlp2i+tL._AC_UL480_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/51d0+KdyP9L._AC_UL480_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/71Zf9uUp+GL._AC_UY327_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/9167i2ioFaS._AC_UY327_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/51tG4Z1loOL._AC_UL480_FMwebp_QL65_.jpg",
    "https://m.media-amazon.com/images/I/61oO32AgV6L._AC_UL480_FMwebp_QL65_.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10161D),
      appBar: AppBar(
        backgroundColor: Color(0xFF25348E),
        title: Text(
          "Amazon",
          style: TextStyle(
            color: Color(0xFFFF9900),
          ),
        ),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search...",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "New Items",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ),
              //Now we will add the items list
              Container(
                width: double
                    .infinity, // this line will make the container take the full width of the device
                height:
                270.0, // when you want to create a list view you should precise the height and width of it's container
                child: ListView(
                  scrollDirection: Axis
                      .horizontal, // this will make the list scroll horizontally
                  children: [
                    //now let's add an item to test
                    Items("JBL headphones", "Audio", ImgUrl[0], "Rs.1,670"),
                    Items("Samsung", "Smartphones", ImgUrl[1], "Rs.4,567"),
                    Items("MacBook pro", "Tech", ImgUrl[2], "Rs.675"),
                    Items("Blue yeti", "Audio", ImgUrl[3], "Rs.897"),
                    //Note that this is the UI of the App but you can easly implement a backend service via a REST API
                  ],
                ),
              ),
              //for the second part of the app it's the same principale so let's just copy the first elements
              //Let's add some space
              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Recommended for you",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
              ),
              Container(
                width: double
                    .infinity, // this line will make the container take the full width of the device
                height:
                270.0, // when you want to create a list view you should precise the height and width of it's container
                child: ListView(
                  scrollDirection: Axis
                      .horizontal, // this will make the list scroll horizontally
                  children: [
                    //now let's add an item to test
                    Items("Jacket", "Fashion", ImgUrl[4], "Rs.234"),
                    Items("IMac Pro", "Tech", ImgUrl[5], "Rs.34,567"),
                    Items("Books", "Books", ImgUrl[6], "Rs.1,300"),
                    Items("Sunglasses", "Fashion", ImgUrl[7], "RS.667"),
                    Items("Watch", "Fashion", ImgUrl[8], "Rs.600"),
                    //Note that this is the UI of the App but you can easly implement a backend service via a REST API
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //Now i'm going to add a bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF10161d),
        selectedItemColor: Color(0xFFFF9900),
        unselectedItemColor: Colors.white,
        items: [
          //you should at least have 2 items with the icon and title or you will have an error
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Account"),
          ),
        ],
        //that's it for the UI, thank you for watching, if you want to see a full Tutorial
        //on how to build a fully functional shopping app, just put it in the comment
        //Don't forget to subscribe ;) <3
      ),
    );
  }
}
