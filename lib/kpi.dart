import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class kpi extends StatelessWidget {
  const kpi({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('KPI'),
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
                                    hintText: 'Name of KPI',
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
                            SizedBox(width: 10.0),
                            Expanded(
                              // optional flex property if flex is 1 because the default flex is 1
                              flex: 1,

                              child: TextFormField(

                                keyboardType: TextInputType.text,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    hintText: 'Calculation Basis',
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
