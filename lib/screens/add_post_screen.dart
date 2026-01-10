import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_app/models/user.dart';
import 'package:instagram_clone_app/providers/user_provider.dart';
import 'package:instagram_clone_app/resources/firestore_method.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;

  void postImage(String uid, String username, String profile) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethod().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profile,
      );

      if (res == "success") {
        setState(() {
          _isLoading = false;
        });
        showSnackBar("Posted!", context);
        clearImage();
      } else {
        setState(() {
          _isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selecImage(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Create a Post"),
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: Text("Take photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: Text("Choose from gallery"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? IconButton(
            icon: Icon(Icons.upload_file),
            onPressed: () => _selecImage(context),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                onPressed: clearImage,
                icon: Icon(Icons.arrow_back),
              ),
              title: Text("Post to"),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () =>
                      postImage(user.uid, user.username, user.photoUrl),
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
                _isLoading
                    ? LinearProgressIndicator()
                    : Padding(padding: EdgeInsets.only(top: 0)),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(user.photoUrl)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
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
                            image: DecorationImage(image: MemoryImage(_file!)),
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
