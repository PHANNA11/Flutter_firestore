import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/main.dart';
import 'package:firestore/model/employee.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  TextEditingController IDController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController SalaryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future createEmployee(
      {String? id,
      required String name,
      required int age,
      required double salary}) async {
    final docEmployee = FirebaseFirestore.instance.collection('employee').doc();
    final emp =
        Employee(id: docEmployee.id, name: name, age: age, salary: salary);
    final json = emp.toJson();
    // final json = {
    //   'id': id,
    //   'name': name,
    //   'age': age,
    //   'salary': salary,
    // };
    await docEmployee.set(json);
    //  return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
        actions: [
          IconButton(
              onPressed: () async {}, icon: const Icon(Icons.get_app_outlined)),
          const SizedBox(
            width: 30,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.login_outlined,
                size: 30,
              )),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: IDController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'ID',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: NameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Name',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: AgeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Age',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: SalaryController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Salary',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 200,
            //  color: Colors.amber,
            child: CupertinoButton(
              child: const Text('Create'),
              onPressed: () {
                createEmployee(
                  id: IDController.text,
                  name: NameController.text,
                  age: int.parse(AgeController.text),
                  salary: double.parse(SalaryController.text),
                ).whenComplete(() => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: 'List Employee'),
                    ),
                    (route) => false));
              },
              color: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}
