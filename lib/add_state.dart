import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tgweb/modules/documents/documents.dart';
import '../../services/http.request.dart';
import 'list_state.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (_) => DocumentsBloc(),
          child: const DocumentsPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DocumentsBloc(),
        child: Container(
            padding: const EdgeInsets.fromLTRB(40, 100, 0, 0),
            child: DocumentsPageForm()));
  }
}

/// Table

class DocumentsPageForm extends StatefulWidget {
  const DocumentsPageForm({Key? key}) : super(key: key);

  @override
  State<DocumentsPageForm> createState() => _DocumentsPageFormState();
}

class _DocumentsPageFormState extends State<DocumentsPageForm> {
  final HttpService httpService = HttpService();
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  String _currentSelectedValue = "1"; // Default Active Selected
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Map<String, dynamic>> statusList = [
    {"name": "Active", "value": "1"},
    {"name": "Not-Active", "value": "2"}
  ];

  var FormData = new Map();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            children: [
              // Department Name
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    FormData["stateName"] = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "State Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0),
                    ),
                  ),
                ),
              ),
              // Description
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    FormData["country"] = value;
                  },
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Country",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // Drop Down Menu
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: const InputDecoration(
                        hintText: "Status",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                      // isEmpty: _currentSelectedValue == "",
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (value) {
                            FormData["status"] = value;
                            setState(() {
                              _currentSelectedValue = value.toString();
                              // state.didChange(newValue);
                            });
                          },
                          // items: [],
                          items: statusList.map((item) {
                            return DropdownMenuItem<String>(
                              value: item["value"],
                              child: Text(item["name"]),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              // Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.062,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.green.shade400),
                    onPressed: () {
                      httpService.postData("states", FormData);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StateList()),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20, color: Colors.black45),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
