import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tgweb/modules/documents/designation.dart';
import '../../services/http.request.dart';

class partyTypePageList extends StatelessWidget {
  const partyTypePageList({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (_) => DocumentsBloc(),
          child: const partyTypePageList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DocumentsBloc(),
        child: Container(
            padding: const EdgeInsets.fromLTRB(40, 100, 0, 0),
            child: partyTypePageTable()));
  }
}

// Table

class partyTypePageTable extends StatefulWidget {
  const partyTypePageTable({Key? key}) : super(key: key);

  @override
  _partyTypePageTableState createState() => _partyTypePageTableState();
}

class _partyTypePageTableState extends State<partyTypePageTable> {
  final HttpService httpService = HttpService();
  List<dynamic> _desData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var _data = await httpService.getData("partyType");
    List<dynamic> desData = [];
    for (var item in _data) {
      print(item);
      desData.add({
        "partyType": item["partyType"],
        "description": item["description"],
        "id": item["districtID"],
        //"stateID": item["stateID"],
        "status": int.parse(item["status"]) == 1 ? 'Active' : 'Not Active',
        "columnEdit": false
      });
    }
    setState(() {
      _desData = desData;
    });
  }

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
                  'partyType Name',
                ),
              ),
              DataColumn(
                label: Text(
                  'description',
                ),
              ),
              DataColumn(
                label: Text(
                  'Status',
                ),
              ),
              // DataColumn(
              //   label: Text(
              //     'Country Name',
              //   ),
              // ),
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
                    initialValue: item['partyType'],
                    onChanged: (value) {
                      item['partyType'] = value;
                    },
                    style: TextStyle(fontSize: 14))
                    : Text(item['partyType'])),
                // DataCell(_isindex == item["id"]
                //     ? TextFormField(
                //     initialValue: item['state'],
                //     onChanged: (value) {
                //       item['state'] = value;
                //     },
                //     style: TextStyle(fontSize: 14))
                //     : Text(item['state'])),
                DataCell(Text(item['status'].toString())),
                DataCell(Text(item['country'].toString())),
                DataCell(_isindex == item["id"]
                    ? EditActionButton(onSaveClick: () {
                  item["status"] = "1";
                 // item["districtID"] = _isindex;
                  httpService.updateData("partyType", _isindex, item);
                  getData();
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
                    if (edit) {
                      setState(() {
                        _isindex = count;
                      });
                    } else {
                      httpService.deleteData("partyType", count);
                      getData();
                    }
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
        IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            this.onRowClick(
              false,
              rowNumber,
            );
          },
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



// json https://suragch.medium.com/parsing-simple-json-in-flutter-83ee1809a6ab