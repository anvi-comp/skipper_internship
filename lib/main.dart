// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var uid;
var id;
 String title;
 String body;
final uri = 'https://jsonplaceholder.typicode.com/posts';
var map = new Map<String, dynamic>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('POSTS Form'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 50.0, right: 50.0),
              child: Column(children: [

                //Text('TextFormField'),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //icon: Icon(Icons.person),
                      labelText: 'User ID',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value) {
                     uid= value;
                    //Do something with this value
                  },
                ),

                //Text('TextFormField'),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //icon: Icon(Icons.person),
                      labelText: 'ID',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value) {
                     id =value;
                    //Do something with this value
                  },
                ),

                SizedBox(height: 10.0),

                SizedBox(height: 10.0),
                //Text('DropDown Button'),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    //icon: Icon(Icons.person),
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value) {

                     title =value;
                    //Do something with this value
                  },
                ),


                SizedBox(height: 10.0),

                SizedBox(height: 10.0),
                //Text('DropDown Button'),
                SizedBox(height: 10.0),

                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person),
                      labelText: 'Body',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)
                      )

                  ),
                  onChanged: (value) {

                     body =value;
                    //Do something with this value
                  },
                ),





                SizedBox(height: 10.0),
                //Text('Buttons'),
                SizedBox(height: 10.0),
                //Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                Container(
                  color: Colors.lightBlue,
                  child: RawMaterialButton(
                    child: Text('Submit', style: TextStyle(color: Colors.white)),
                    onPressed: () async {

                      map['userId'] = uid;
                      map['id'] = id;
                      map['title'] = title;
                      map['body'] = body;

                      http.Response response = await http.post(
                        uri,
                        body: map,
                      );

                      //Do Something


                    },
                  ),
                )
                //])
              ])
          ),
        )
    );
  }
}
