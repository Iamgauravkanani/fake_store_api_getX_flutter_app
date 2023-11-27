// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rev_api_database/Modules/App/Database_Screen/Model/db_model.dart';
import 'package:rev_api_database/Modules/App/Student_Detail_Screen/Views/student_detail.dart';
import 'package:rev_api_database/Modules/Utils/Helpers/Database_Helper/db_helper.dart';
import '../../../Utils/Globals/global.dart';

class DataBase_Screen extends StatelessWidget {
  DataBase_Screen({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "enter name first..";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  Global.name = val;
                },
                controller: Global.nameController,
                decoration: const InputDecoration(
                    hintText: "enter your name...",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "enter course first..";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  Global.course = val;
                },
                controller: Global.courseController,
                decoration: const InputDecoration(
                    hintText: "enter your course...",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      Student student_data =
                          Student(name: Global.name!, course: Global.course!);

                      int? res = await DB_Helper.db_helper
                          .insertData(data: student_data);

                      Get.snackbar("Student App", "Data inserted at $res");

                      log("=====================================");

                      log("${Global.name}");
                      log("${Global.course}");

                      log("=====================================");
                    }
                    Global.nameController.clear();
                    Global.courseController.clear();
                  },
                  child: Text("Add Student")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(Student_Detail());
                  },
                  child: Text("View Student Details")),
            ],
          ),
        ),
      ),
    );
  }
}
