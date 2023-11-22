import 'package:news_app_using_flutter/models/catagory_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.catagoryName = "Business";
  categoryModel.catagoryImage = "images/business.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.catagoryName = "Entertainment";
  categoryModel.catagoryImage = "images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.catagoryName = "General";
  categoryModel.catagoryImage = "images/general.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.catagoryName = "Health";
  categoryModel.catagoryImage = "images/health.jpg";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.catagoryName = "Sports";
  categoryModel.catagoryImage = "images/sport.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  return category;
}
