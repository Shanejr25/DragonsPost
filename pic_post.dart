import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'text_post.dart';
import 'package:image/image.dart' as Img;

class PicturePost extends StatelessWidget {
  
  Widget build (BuildContext context){
    // create a scaffold inside material app to display button
    return MaterialApp(
      home: Container(
        child: PictureForm(),
      ),
    );
  }
}
// create a picture form
class PictureForm extends StatefulWidget {
  PictureFormState createState() {
    // return the a state of the pictureform
    return PictureFormState();
  }
}

// create a state for the form
class PictureFormState extends State<PictureForm> {
  // store the file here
  File _image;
  String inputTitle;
  
  // create formkey for the validation
  final _formKey = GlobalKey<FormState>();
  // control the textfield
  TextEditingController titleController = TextEditingController();

  Future getCamImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getGalImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
        child: Scaffold(
          
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                key: _formKey,
                child: title(inputTitle, titleController),
                ),
                Center(
                child: _image == null
                      ? Text('No image selected.')
                      : Image.file(_image),
                ),
                // form widget for title
              ]
          ),
          ),
          resizeToAvoidBottomPadding: false,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                gallery(),
                camera(),
                // ADD IMAGE WIDGET
              ],
            ),
        ),
    );
  }

  // floating button for the gallery
  Widget gallery() {
    // put action button into container
    return Container(
      child: FloatingActionButton(
        heroTag: 'gallery',
        tooltip: 'Add image from gallery',
        child: Icon(Icons.image),
        onPressed: () {
          getGalImage();
        },
      ),
    );
  }

  // floating button for the picture from camera
  Widget camera() {
    // put action button into container
    return Container(
      child: FloatingActionButton(
        heroTag: 'camera',
        tooltip: 'Add image from camera',
        child: Icon(Icons.camera),
        onPressed: () {
         getCamImage();
        },
      ),
    );
  }
}

  
  /*
  picturePost() async{ // post a picture
    galleryFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }
  */
