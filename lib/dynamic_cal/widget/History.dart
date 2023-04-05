import 'package:calculator_project/dynamic_cal/widget/color.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
  List<String> list_value = [];

  history(this.list_value, {Key? key}) : super(key: key);

  //final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.transparent)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Center(child: Text("History")),
                backgroundColor: Colors.blueGrey,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 1),
                          child: Container(
                            height: 40,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                list_value[index],
                                style: TextStyle(color: Color(text_color), fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: list_value.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.exit_to_app_outlined)),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.history,
          color: Colors.white,
        ));
  }
}
