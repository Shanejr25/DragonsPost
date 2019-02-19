import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
 
  Widget build(context) {
    
    return buildTile();
  }

  Widget buildTile(){
     int _tileCount = 0;
    _tileCount ++;
    return Container(
      child: Column (
        children: <Widget>[
          ListTile(
            title: Text('post ' + _tileCount.toString()),
          ),
          Divider(
            height: 8.0,
          ),
        ],
      )
    );
    
  }

}