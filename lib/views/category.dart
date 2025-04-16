import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zain_backend/models/category.dart';
import 'package:zain_backend/services/category.dart';

class GetAllCategories extends StatelessWidget {
  const GetAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get All Categories"),
      ),
      body: FutureProvider.value(
        value: CategoryServices().getAllCategories(),
        initialData: [CategoryModel()],
        builder: (context, i) {
          List<CategoryModel> categoryList =
              context.watch<List<CategoryModel>>();
          return ListView.builder(

              itemCount: categoryList.length,
              itemBuilder: (context, i) {
            return ListTile(
              leading: Icon(Icons.category),
              title: Text(categoryList[i].name.toString()),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
            );
          });
        },
      ),
    );
  }
}
