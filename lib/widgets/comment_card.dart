import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNubLmqdOK9pZWU-2IiD20cuSIdUUDi9-NvQ&s",
            ),
            radius: 18,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "username",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "Some discription to insert"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    "21/21/21",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.favorite, size: 16),
          ),
        ],
      ),
    );
  }
}
