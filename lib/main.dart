import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jsonplaceholder Example',
      theme:
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      home: JsonDataGrid(),
    );
  }
}

class JsonDataGrid extends StatefulWidget {
  @override
  _JsonDataGridState createState() => _JsonDataGridState();
}

class _JsonDataGridState extends State<JsonDataGrid> {
  late _JsonDataGridSource jsonDataGridSource;
  List<_todo> todoList = [];

  Future generateProductList() async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos'));//using api
    var list = json.decode(response.body).cast<Map<String, dynamic>>();
    todoList =
    await list.map<_todo>((json) => _todo.fromJson(json)).toList();
    jsonDataGridSource = _JsonDataGridSource(todoList);
    return todoList;
  }
//table view starts
  List<GridColumn> getColumns() {
    List<GridColumn> columns;
    columns = ([
      GridColumn(
        columnName: 'userID',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            'User ID',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'ID',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
            'ID',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'title',
        width: 500,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            'Title',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'completed',
        width: 100,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: Text(
            'Completed',
            overflow: TextOverflow.clip,
            softWrap: true,
          ),
        ),
      ),
    ]);
    return columns;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter DataGrid Sample'),
      ),
      body: Container(
          child: FutureBuilder(
              future: generateProductList(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.hasData
                    ? SfDataGrid(
                    source: jsonDataGridSource, columns: getColumns())
                    : Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                );
              })),
    );
  }
}
//populating data from api
class _todo {
  factory _todo.fromJson(Map<String, dynamic> json) {
    return _todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  _todo(
      {this.userId,
        this.id,
        this.title,
        this.completed,
      });
  int? userId;
  int? id;
  String? title;
  String? completed;
}

class _JsonDataGridSource extends DataGridSource {
  _JsonDataGridSource(this.productlist) {
    buildDataGridRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<_todo> productlist = [];

  void buildDataGridRow() {
    dataGridRows = productlist.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'userID', value: dataGridRow.userId),
        DataGridCell<int>(
            columnName: 'ID', value: dataGridRow.id),
        DataGridCell<String>(
            columnName: 'Title', value: dataGridRow.title),
        DataGridCell<String>(
            columnName: 'Completed', value: dataGridRow.completed),
      ]);
    }).toList(growable: true);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[1].value,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(8.0),
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
