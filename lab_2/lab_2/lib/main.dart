import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: const MyHomePage(title: 'Age Calculator (lab_2)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Your age isn't determined";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text( message,
            style:
              TextStyle(
                fontSize: 20,
              ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickBirthDate,
        tooltip: 'Pick Date',
        child: const Icon(Icons.calendar_month_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future pickBirthDate() async {
    DateTime? date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
    int d = int.parse(DateFormat("d").format(date!));
    int m = int.parse(DateFormat("M").format(date!));
    int y = int.parse(DateFormat("y").format(date!));

    DateTime curentDate = DateTime.now();
    int cd = int.parse(DateFormat("d").format(curentDate));
    int cm = int.parse(DateFormat("M").format(curentDate));
    int cy = int.parse(DateFormat("y").format(curentDate));

    if(d<=cd){
      d = cd - d;
    }else{
      d = 31 - d;
    };
    if(m<=cm){
      m = cm - m;
    }else{
      m = 12 - m;
      y -= 1;
    };
    y = cy - y;

    setState(() {
      message = "You are ${y} years ${m} months ${d} days old";
    });
  }
}
