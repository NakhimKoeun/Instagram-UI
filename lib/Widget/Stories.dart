import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Models/models.dart';

class StorieWidget extends StatelessWidget {
  const StorieWidget(
      {super.key,
      required this.currentUser,
      required this.Useronline,
      this.hasborder = false,
      this.Isactive = false});
  final User currentUser;
  final List<User> Useronline;
  final bool Isactive;
  final bool hasborder;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          color: Colors.black,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1 + Useronline.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(currentUser.imageUrl),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add Story",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 8,
                      bottom: 55,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.black)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                );
              }
              final User user = Useronline[index - 1];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: hasborder ? 37 : 40,
                          backgroundImage: NetworkImage(
                            user.imageUrl,
                            //   hasBorder: user.Isactive
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${user.name}",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
