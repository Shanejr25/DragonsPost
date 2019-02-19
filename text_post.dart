import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class TextPost extends StatelessWidget {
  // display the widget
  // create the global key
  
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        // display the custom textform
        body: MyCustomForm(),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Submit',
          child: Icon(Icons.send),
          onPressed: ()  {
              if (_formKey.currentState.validate()) {
              Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data...')));
            } //navigate to lair page
          }),
      ),
    );
  } 
}

class MyCustomForm extends StatefulWidget {
  MyCustomFormState createState() {
    // create the state of the widget
    return MyCustomFormState();
  }
  
}
class MyCustomFormState extends State<MyCustomForm> {
  // store the input from the title and description
  String inputTitle;
  String inputDesc;
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10.0),
      child: Form(
      key: _formKey,
      child:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Column(
        children: <Widget>[
          // call title method from pic_post
          title(inputTitle, titleController),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onFieldSubmitted: (String input) {
              // store the input into a string variable
              inputDesc = input;
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                // add clear button to the title
                icon: Icon(Icons.clear),
                onPressed: () {
                  descController.clear();
                },
              ),
              labelText: 'Enter the description',
            ),
            controller: descController,
            // validate the form
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter some text";
              }
            }
          ),
                ],
          ),
      ),
    ),
  );
  }
}
Widget title(String inputTitle, TextEditingController titleController) {
    return TextField(
      maxLength: 45,
      // link the controller for the title
      controller: titleController,
      // store the input
      onChanged: (String input) {
        inputTitle = input;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
        // add clear button to the title
        icon: Icon(Icons.close),
          onPressed: () {
            titleController.clear();
        },
      ),
      hintText: 'Please enter a title here',
      ),
    );
  }
