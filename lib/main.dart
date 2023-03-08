import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var se = <int>{};
  var pos = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                height: size.height * 0.22,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                    border: Border.all(color: Colors.black)),
                child: const Center(
                    child: Text(
                  "Store",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: (1 / 0.4),
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: 12,
                    itemBuilder: ((context, index) {
                      var z = Colors.blue;
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              //BoxShadow
                            ],
                            border: Border.all(color: Colors.black)),
                        child: (se.contains(index))
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 50,
                              )
                            : null,
                      );
                    })),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    se.add(pos);
                    (pos < 12) ? pos++ : pos;
                  });
                },
                child: Text("add")),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
                onPressed: (() {
                  setState(() {
                    (pos > 0) ? pos -= 1 : pos;
                    se.remove(pos);
                  });
                }),
                child: Text("Remove")),
          ],
        ),
      ),
    );
  }
}
