import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('AlertDialog Sample')),
        body: Center(
          child: DialogExample(),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  DialogExample({super.key});

  List<String> list_value = ['Hello1', 'Hello2', 'Hello3', 'Hello4'];

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(child: Text("Select Value")),
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 40,
                        color: Colors.blueGrey[400],
                        child: Center(
                          child: Text(
                            list_value[index],
                            style: TextStyle(color: Colors.white),
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
      ),
      // onPressed: () => showDialog<String>(
      //   context: context,
      //   builder: (BuildContext context) => AlertDialog(
      //     title: const Text('AlertDialog Title'),
      //     content: SingleChildScrollView(
      //       child: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           ListView.builder(
      //               padding: EdgeInsets.all(8.0),
      //               shrinkWrap: true,
      //               physics: NeverScrollableScrollPhysics(),
      //               itemCount: list_value.length,
      //               itemBuilder: (BuildContext context, int index) {
      //                 return ListTile(

      //                 );
      //               }),
      //         ],
      //       ),
      //     ),
      //     actions: <Widget>[
      //       TextButton(
      //         onPressed: () => Navigator.pop(context, 'OK'),
      //         child: const Text('OK'),
      //       ),
      //     ],
      //   ),
      // ),
      child: const Text('Show Dialog'),
    );
  }
}
