import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class districtTable extends StatefulWidget {
  const districtTable({Key? key, required String title}) : super(key: key);

  @override
  _DocumentsPageTableState createState() => _DocumentsPageTableState();
}

class _DocumentsPageTableState extends State<districtTable> {
  final List<Map> _desData = List.generate(5, (i) {
    return {
      "id": i,
      "District": "Dist $i",
      "Country": "Coun $i",
      "State": "State $i",
      "Status": "Active",
      "columnEdit": false
    };
  });
  bool _isEditMode = false;
  int? _isindex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          child: DataTable(
            columnSpacing: 20.0,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'District',
                ),
              ),
              DataColumn(
                label: Text(
                  'Country',
                ),
              ),
              DataColumn(
                label: Text(
                  'State',
                ),
              ),
              DataColumn(
                label: Text(
                  'Status',
                ),
              ),
              DataColumn(
                label: Text(
                  'Actions',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: _desData.map((item) {
              return DataRow(cells: [
                DataCell(_isindex == item["id"]
                    ? TextFormField(
                    initialValue: item['District'],
                    style: TextStyle(fontSize: 14))
                    : Text(item['District'])),
                DataCell(_isindex == item["id"]
                    ? TextFormField(
                    initialValue: item['Country'],
                    style: TextStyle(fontSize: 14))
                    : Text(item['Country'])),
                DataCell(_isindex == item["id"]
                    ? TextFormField(
                    initialValue: item['State'],
                    style: TextStyle(fontSize: 14))
                    : Text(item['State'])),
                DataCell(Text(item['Status'].toString())),
                DataCell(_isindex == item["id"]
                    ? EditActionButton(onSaveClick: () {
                  print(item);
                  setState(() {
                    _isindex = -1;
                  });
                }, onCancelClick: () {
                  setState(() {
                    _isindex = -1;
                  });
                })
                    : ActionItem(
                  onRowClick: (bool edit, int count) {
                    setState(() {
                      _isindex = count;
                    });
                  },
                  rowNumber: item["id"],
                ))
              ]);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ActionItem extends StatelessWidget {
  ActionItem({required this.onRowClick, required this.rowNumber});
  int rowNumber;
  final editCallback onRowClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.edit),
          color: Colors.grey,
          onPressed: () {
            this.onRowClick(true, rowNumber);
          },
        ),
        Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ],
    );
  }
}

typedef editCallback = void Function(bool edit, int count);

class EditActionButton extends StatelessWidget {
  EditActionButton({required this.onSaveClick, required this.onCancelClick});
  final saveRowClick onSaveClick;
  final cancelRowClick onCancelClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            icon: const Icon(Icons.save),
            color: Colors.grey,
            onPressed: () {
              this.onSaveClick();
            }),
        IconButton(
            icon: const Icon(Icons.cancel),
            color: Colors.grey,
            onPressed: () {
              this.onCancelClick();
            }),
      ],
    );
  }
}

typedef saveRowClick = void Function();
typedef cancelRowClick = void Function();