import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class District extends StatelessWidget {
  const District({Key? key, required String title}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('District'),
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
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3.0)
                                ),
                                child: DropdownButton<String>(
//value: dropdownValue,
                                  isExpanded: true,
                                  hint: Text("Name District"),
                                  icon: Icon(Icons.keyboard_arrow_down, size: 22),
                                  underline: SizedBox(),
                                  items: <String>['D1', 'D2', 'D3', 'D4'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
//Do something with this value

                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            SizedBox(height: 10.0),
                            Expanded(
// optional flex property if flex is 1 because the default flex is 1
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3.0)
                                ),
                                child: DropdownButton<String>(
//value: dropdownValue,
                                  isExpanded: true,
                                  hint: Text("Country"),
                                  icon: Icon(Icons.keyboard_arrow_down, size: 22),
                                  underline: SizedBox(),
                                  items: <String>['C1', 'C2', 'C3', 'C4'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
//Do something with this value

                                  },
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 10.0),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            Expanded(
// optional flex property if flex is 1 because the default flex is 1
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3.0)
                                ),
                                child: DropdownButton<String>(
//value: dropdownValue,
                                  isExpanded: true,
                                  hint: Text("State"),
                                  icon: Icon(Icons.keyboard_arrow_down, size: 22),
                                  underline: SizedBox(),
                                  items: <String>['S1', 'S2', 'S3', 'S4'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
//Do something with this value

                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              // optional flex property if flex is 1 because the default flex is 1
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(3.0)
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
