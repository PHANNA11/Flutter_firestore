import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/model/employee.dart';
import 'package:firestore/page/dashboad_page.dart';
import 'package:firestore/page/update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection('employee').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    //  Stream<List<Employee>> getEmployee() => FirebaseFirestore.instance
    //   .collection('employee')
    //   .snapshots()
    //   .map((snapshot) => snapshot.docs.map(doc)=>Employee.Employee.fromJson(doc.data()));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('employee').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var temm = snapshot.data?.docChanges ?? [];
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.size,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      dismissible: DismissiblePane(onDismissed: () {}),
                      motion: const ScrollMotion(),
                      children: const [
                        SlidableAction(
                          onPressed: null,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: InkWell(
                      onLongPress: (() {}),
                      onTap: (() {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdatePage(
                                    id: temm[index].doc['id'],
                                    name: temm[index].doc['name'],
                                    age: temm[index].doc['age'],
                                    salary: temm[index].doc['salary']),
                              ));
                        });
                      }),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            temm[index].doc['name'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            'Age :  ${temm[index].doc['age']}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          trailing: Text(
                            'Salary: \$ ${temm[index].doc['salary']}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoardPage(),
                ));
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
