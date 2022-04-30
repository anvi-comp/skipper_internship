import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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


  String dropdownValue = 'Dept1';
  String dropdownValue2 = 'Active';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Designation'),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 50.0, right: 50.0),
                child: Column(children: [
                  Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: <Widget>[
                            Expanded(
                              // optional flex property if flex is 1 because the default flex is 1
                              flex: 1,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Department Name',
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
                                  //Do something with this value
                                },
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              // optional flex property if flex is 1 because the default flex is 1
                              flex: 1,

                              child: TextFormField(

                                keyboardType: TextInputType.text,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    hintText: 'Description',
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
                                  //Do something with this value
                                },
                              ),


                            ),
                          ],
                        ),

                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
// optional flex property if flex is 1 because the default flex is 1
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white ,width: 32.0),
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: DropdownButton<String>(
//value: dropdownValue,
                                  isExpanded: true,
                                  hint: Text("Department"),
                                  icon: Icon(Icons.keyboard_arrow_down, size: 22),
                                  underline: SizedBox(),
                                  items: <String>['Dept1', 'Dept2', 'Dept3', 'Dept4'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
//Do something with this value
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              // optional flex property if flex is 1 because the default flex is 1
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white ,width: 32.0),
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: DropdownButton<String>(
                                  //value: dropdownValue2,
                                  hint: Text("Status"),
                                  isExpanded: true,
                                  icon: Icon(Icons.keyboard_arrow_down, size: 22),
                                  underline: SizedBox(),
                                  items: <String>['Active','Not-Active'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    //Do something with this value
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            //Text('Buttons'),
                            SizedBox(height: 10.0),
                            //Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                            // Container(
                            //   color: Colors.lightBlue,
                            //   child: RawMaterialButton(
                            //     child: Text('Submit', style: TextStyle(color: Colors.white)),
                            //     onPressed: () {
                            //       //Do Something
                            //     },
                            //   ),
                            // ),
                          ],

                        ),
                        Container(
                            margin: const EdgeInsets.all(40),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.centerRight,
                                      fixedSize: const Size(150, 20),
                                    ),
                                    onPressed: () {},
                                    child: const Align(
                                      child: Text('Submit'),
                                    )))),
                      ]

                  ),
                ])
            ))
    );
  }
}