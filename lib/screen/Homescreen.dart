import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instgramui/ListData/Stories_data.dart';
import '../Widget/Circor_buttom.dart';
import '../Widget/widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Circor_Buttom(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search");
            },
          ),
          SizedBox(
            width: 10,
          ),
          Circor_Buttom(
            icon: Icon(Icons.message),
            onPressed: () {
              print("Messager");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StorieWidget(currentUser: currentUser, Useronline: Useronline),
            Column(
              children: posts
                  .map((post) => PostWidget(
                        post: post,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
