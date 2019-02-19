import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'post_types.dart';
import '../widgets/text_post.dart';
import '../widgets/pic_post.dart';
import '../widgets/link_post.dart';

class CreatePost extends StatefulWidget {
  CreatePostState createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  File galleryFile;
  // build the app here
  Widget build (BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.text_fields)),
                Tab(icon: Icon(Icons.image)),
                
              ],
            ),
            title: Text('Create Post'),
          ),
          body: TabBarView(
            children: [
              new TextPost(),
              new PicturePost(),
              
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: IconButton(
                    //home
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/'); //navigate back to trending page from home
                    },
                  ),
                ),

                Container(
                  width: 150,
                  height: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.layers,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/lair'); //navigate to lair page
                    },
                  ),
                ),
              
                Container(
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/userPage'); //navigate to userpage page
                    },
                  ),
                ),
              ],
            ),
              ),
              ),
            ),
          );
        

          /*
          return Scaffold(
            appBar: AppBar(
              elevation: 4,
              backgroundColor: Colors.blueAccent,
              title: Center(
                child: Text(
                  ('Create Post'),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )
                  ),
              ),
              flexibleSpace: Divider(color: Colors.white54),
              bottom: PreferredSize(
                preferredSize: Size(300, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      child: IconButton(
                        //home button
                        icon: Icon(Icons.text_fields),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context,
                              '/'); //navigate to home screen from trending page
                        },
                      ),
                    ),
                    VerticalDivider(color: Colors.white54),
                    Container(
                      width: 100,
                      height: 50,
                      child: IconButton(
                        //lair button
                        icon: Icon(Icons.image),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context,
                              '/'); //navigate to lair screen from trending page
                        },
                      ),
                    ),
                    VerticalDivider(color: Colors.white54),
                    Container(
                      width: 100,
                      height: 50,
                      child: IconButton(
                        //user updates
                        color: Colors.white,
                        icon: Icon(Icons.link),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
          );
          */
        }
 
}