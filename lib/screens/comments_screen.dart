import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/colors.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("Comments"),
        centerTitle: false,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNubLmqdOK9pZWU-2IiD20cuSIdUUDi9-NvQ&s",
                ),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "comment as a username",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text("Post", style: TextStyle(color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
