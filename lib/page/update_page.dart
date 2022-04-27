import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/main.dart';
import 'package:firestore/model/employee.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage(
      {required this.id,
      required this.name,
      required this.age,
      required this.salary,
      Key? key})
      : super(key: key);
  late String id;
  late String name;
  late int age;
  late double salary;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController IDController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController SalaryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      IDController.text = widget.id;
      NameController.text = widget.name;
      AgeController.text = widget.age.toString();
      SalaryController.text = widget.salary.toString();
    });
  }

  // Future createEmployee(
  //     {String? id,
  //     required String name,
  //     required int age,
  //     required double salary}) async {
  //   final docEmployee = FirebaseFirestore.instance.collection('employee').doc();
  //   final emp =
  //       Employee(id: docEmployee.id, name: name, age: age, salary: salary);
  //   final json = emp.toJson();
  //   await docEmployee.set(json);
  //   //  return 'null';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Employee\'s Infor'),
        actions: [
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
              child: const Text('Save'),
              onPressed: () {
                // createEmployee(
                //   id: IDController.text,
                //   name: NameController.text,
                //   age: int.parse(AgeController.text),
                //   salary: double.parse(SalaryController.text),
                // ).whenComplete(() => Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) =>
                //           const MyHomePage(title: 'List Employee'),
                //     ),
                //     (route) => false));
              },
              color: Colors.red[400],
            ),
          ),
        ],
      ),
    );
  }
}
