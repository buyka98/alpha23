import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    // Хадгалсан утгаа аваад 1-р нэмэгдүүлнэ.
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    // Нэмэгдүүлсэн утгыг амжилттай хадгалвал state шинэчлэгдэнэ.
    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      print("Init counter value: ${prefs.getInt('counter')}");
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: FutureBuilder<int>(
                future: _counter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                          'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                          'This should persist across restarts.',
                        );
                      }
                  }
                })),
        ElevatedButton(onPressed: _incrementCounter, child: Text("Add")),
      ],
    );
  }
}
