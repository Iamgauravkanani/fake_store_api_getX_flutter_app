import 'package:flutter/material.dart';
import 'package:rev_api_database/Modules/App/Home_Screen/Model/Api_Model/api_model.dart';
import 'package:rev_api_database/Modules/Utils/Helpers/Api_Helper/api_helper.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.fetchApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<FakeStoreData>? data = snapshot.data;
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (ctx, i) {
                  return Container(
                      color: Colors.grey,
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("${data?[i].title}"),
                          Text("${data?[i].description}"),
                          Text("${data?[i].id}"),
                          Text("${data?[i].price}"),
                          Text("${data?[i].rating['rate']}"),
                          Text("${data?[i].rating['count']}"),
                        ],
                      ));
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
