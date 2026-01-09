import 'package:flutter/material.dart';
import 'package:instagram_clone_app/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return IconButton(icon: Icon(Icons.upload_file), onPressed: () {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text("Post to"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/abstract-flowing-neon-wave-background_53876-101942.jpg?semt=ais_hybrid&w=740&q=80",
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'write a caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://img.freepik.com/free-photo/abstract-flowing-neon-wave-background_53876-101942.jpg?semt=ais_hybrid&w=740&q=80",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
