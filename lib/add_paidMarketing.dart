import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/http.request.dart';

class PaidMarketingPage extends StatelessWidget {
  const PaidMarketingPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
          create: (_) => DocumentsBloc(),
          child: const PaidMarketingPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DocumentsBloc(),
        child: Container(
            padding: const EdgeInsets.fromLTRB(40, 100, 0, 0),
            child: PaidMarketingPageForm()));
  }
}

/// Table

class PaidMarketingPageForm extends StatefulWidget {
  const PaidMarketingPageForm({Key? key}) : super(key: key);

  @override
  State<PaidMarketingPageForm> createState() => _PaidMarketingPageFormState();
}

class _PaidMarketingPageFormState extends State<PaidMarketingPageForm> {
  final HttpService httpService = HttpService();
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  String _currentSelectedValue = "0"; // Default Active Selected
  String _currentSelectedValueDept = "0"; // Default Active Selected

  @override
  void initState() {
    super.initState();
    //calling  getDepartments Funtion
    getDepartments();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Map<String, dynamic>> statusList = [
    {"name": "Status", "value": "0"},
    {"name": "Active", "value": "1"},
    {"name": "Not-Active", "value": "2"}
  ];

  List<Map<String, dynamic>> _paidMarketingList = [];

  var FormData = new Map();

  getDepartments() async {
    var response = await httpService.getData('states');
    List<Map<String, dynamic>> paidMarketingList = [
      {"name": "State", "value": "0"},
    ];
    for (var item in response) {
      paidMarketingList.add({
        "name": item["state"],
        "value": item["stateId"].toString()
      });
    }

    setState(() {
      _paidMarketingList = paidMarketingList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            children: [
              // State Name
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    FormData["paidMarketingName"] = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "paidMarketing Name",
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
                    FormData["description"] = value;
                  },
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "description",
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
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: FormField<String>(
              //     builder: (FormFieldState<String> state) {
              //       return InputDecorator(
              //         decoration: const InputDecoration(
              //           hintText: "State",
              //           border: OutlineInputBorder(
              //             borderSide: BorderSide(
              //                 color: Colors.black,
              //                 style: BorderStyle.solid,
              //                 width: 1.0),
              //           ),
              //         ),
              //         // isEmpty: _currentSelectedValue == "",
              //         child: DropdownButtonHideUnderline(
              //           child: DropdownButton<String>(
              //             value: _currentSelectedValueDept,
              //             isDense: true,
              //             onChanged: (value) {
              //               print(value);
              //               FormData["stateId"] = value;
              //               setState(() {
              //                 _currentSelectedValueDept = value.toString();
              //                 // state.didChange(newValue);
              //               });
              //             },
              //             // items: [],
              //             items: _paidMarketingList.map((item) {
              //               return DropdownMenuItem<String>(
              //                 value: item["value"],
              //                 child: Text(item["name"]),
              //               );
              //             }).toList(),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
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
                      httpService.postData("paidMarketing", FormData);
                      FormData.clear();
                    },
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
