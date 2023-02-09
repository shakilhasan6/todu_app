import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController todu = TextEditingController();
  @override
  List<String> name = ["Shakil Hasan", "Jannati", "Shohan"];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("todu-app")),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: todu,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter your value here"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (todu.text != "") {
                    name.insert(0, todu.text);
                  }
                  setState(() {});
                  todu.text = "";
                },
                child: const Text("Submited")),
            Expanded(
                child: ListView.builder(
                    itemCount: name.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(name[index]),
                          trailing: IconButton(
                              onPressed: () {
                                name.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
