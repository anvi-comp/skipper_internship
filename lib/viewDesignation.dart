import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class viewDesignation extends StatefulWidget {
  const viewDesignation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<viewDesignation> createState() => _viewDesignation();
}

class _viewDesignation extends State<viewDesignation> {

  final List<Map> _desData = List.generate(15, (i) {
    return {"Department Name": "Dept $i", "Description": "AAAAAAABBBBCCCCCCC $i", "Department": "DEPT ${Random().nextInt(20) + 1}"};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Designations'),

          actions: <Widget>[
            RawMaterialButton(
              fillColor: Colors.greenAccent,
              onPressed: () {Navigator.pop(
                context,
                //MaterialPageRoute(builder: (context) => const viewDesignation(title: '',)),
              );},
              child: Text("+ Add Details"),
              //shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(



            child: DataTable(
              sortColumnIndex: _currentSortColumn,
              sortAscending: _isAscending,
              headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
              columns: [
                const DataColumn(label: Text('Department Name')),
                const DataColumn(label: Text('Description')),
                DataColumn(
                    label: const Text(
                      'Department',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    // Sorting function
                    onSort: (columnIndex, _) {
                      setState(() {
                        _currentSortColumn = columnIndex;
                        if (_isAscending == true) {
                          _isAscending = false;
                          // sort the product list in Ascending, order by Price
                          _desData.sort((productA, productB) =>
                              productB['Department'].compareTo(productA['Department']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _desData.sort((productA, productB) =>
                              productA['Department'].compareTo(productB['Department']));
                        }
                      });
                    }),
              ],
              rows: _desData.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['Department Name'].toString())),
                  DataCell(Text(item['Description'])),
                  DataCell(Text(item['Department'].toString()))
                ]);
              }).toList(),
            ),
          ),
        ));
  }

}