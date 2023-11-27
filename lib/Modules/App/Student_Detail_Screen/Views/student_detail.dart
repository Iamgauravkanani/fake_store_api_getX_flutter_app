import 'package:flutter/material.dart';
import 'package:rev_api_database/Modules/App/Database_Screen/Model/db_model.dart';
import 'package:rev_api_database/Modules/Utils/Helpers/Database_Helper/db_helper.dart';

class Student_Detail extends StatelessWidget {
  const Student_Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DB_Helper.db_helper.viewData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Student>? StudentData = snapshot.data;
            return ListView.builder(
                itemCount: StudentData?.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: ListTile(
                      title: Text("${StudentData?[i].name}"),
                      subtitle: Text("${StudentData?[i].course}"),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
