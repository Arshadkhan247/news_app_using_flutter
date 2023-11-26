import 'package:news_app_using_flutter/models/catagory_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.catagoryName = "Business";
  categoryModel.catagoryImage = "assets/business1.jpeg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.catagoryName = "Entertainment";
  categoryModel.catagoryImage = "assets/entertainment.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.catagoryName = "General";
  categoryModel.catagoryImage = "assets/general.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.catagoryName = "Health";
  categoryModel.catagoryImage = "assets/health.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.catagoryName = "Sports";
  categoryModel.catagoryImage = "assets/sport.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
