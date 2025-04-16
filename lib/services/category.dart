import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zain_backend/models/category.dart';

class CategoryServices {
  ///Get All Categories
  Future<List<CategoryModel>> getAllCategories() async {
    return await FirebaseFirestore.instance
        .collection('categoryCollection')
        .get()
        .then((val) =>
            val.docs.map((e) => CategoryModel.fromJson(e.data())).toList());
  }
}
