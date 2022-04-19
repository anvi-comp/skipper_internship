import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class documentsPageForm extends StatelessWidget {
  const documentsPageForm({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(

      child:Column(

      children: [
        SizedBox(height: 10.0),

        SizedBox(height: 10.0),
        //Text('DropDown Button'),
        SizedBox(height: 10.0),
        TextFormField(
          decoration: InputDecoration(
            //icon: Icon(Icons.person),
              labelText: 'Department Name',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 32.0),
                  borderRadius: BorderRadius.circular(5.0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(height: 10.0),

        SizedBox(height: 10.0),
        //Text('DropDown Button'),
        SizedBox(height: 10.0),
        TextFormField(
          decoration: InputDecoration(
            //icon: Icon(Icons.person),
              labelText: 'Department Name',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 32.0),
                  borderRadius: BorderRadius.circular(5.0)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0)
              )
          ),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        SizedBox(height: 10.0),

        SizedBox(height: 10.0),
        //Text('DropDown Button'),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          decoration: BoxDecoration(
            //color: Icon(Icons.person),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(3.0)
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
              // setState(() {
              //   dropdownValue = value!;
              // });
            },
          ),
        ),
        SizedBox(height: 10.0),

        SizedBox(height: 10.0),
        //Text('DropDown Button'),
        SizedBox(height: 10.0),


        Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
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
              // setState(() {
              //   dropdownValue = value!;
              // });
            },
          ),
        ),
        SizedBox(height: 10.0),

        SizedBox(height: 10.0),
        //Text('DropDown Button'),
        SizedBox(height: 10.0),
        ElevatedButton(onPressed: () {}, child: const Text('Submit')),
        Container(
          child: const DocumentsPageTable(),
        )

      ]),
    );
  }
}

class DocumentsPageTable extends StatefulWidget {
  const DocumentsPageTable({Key? key}) : super(key: key);

  @override
  _DocumentsPageTableState createState() => _DocumentsPageTableState();
}

class _DocumentsPageTableState extends State<DocumentsPageTable> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child :DataTable(
      columnSpacing: 20.0,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontWeight: FontWeight.bold),

          ),
        ),
        DataColumn(
          label: Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Status',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Department',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Actions',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
            DataCell(Text('Student')),
            DataCell(ActionItem())
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
            DataCell(Text('Student')),
            DataCell(ActionItem()),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
            DataCell(Text('Student')),
            DataCell(ActionItem())
          ],
        ),
      ],
    ));
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem({Key? key}) : super(key: key);

  get context => null;
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Row(
      children: <Widget>[
        IconButton(
          icon: new Icon(Icons.edit),
          color: Colors.grey,
          //semanticLabel: 'Text to announce in accessibility modes',
          onPressed: (){
            openPopup(context);
          },

        ),
        Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ],
    ));
  }

  openPopup( context) {
    Alert(
      context:context,
      title: "EDIT",
      content: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Name'
            ),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Description'
            ),
          ),
          DropdownButton<String>(
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
              // setState(() {
              //   dropdownValue = value!;
              // });
            },
          ),
          DropdownButton<String>(
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
              // setState(() {
              //   dropdownValue = value!;
              // });
            },
          ),
        ],
      ),
      buttons: [
        DialogButton(onPressed:() => Navigator.pop(context),
        child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20),
        ),
        )
      ]
    ).show();
  }

}
