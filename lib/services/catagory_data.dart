import 'package:news_app_using_flutter/models/catagory_model.dart';

List<CategoryModel> getCatagories() {
  List<CategoryModel> catagory = [];

  // this file is used to display the name and image of the different categories in Categories Section.

  //  1. first we create instance of the model to access their attributes.
  //  2. then we using the the name and image property to make a single record.
  //  3. add that record into our list called "catagory"
  //  4. this steps are repeat for each of category.
  //  5. at the end we return the list of different categries by  " return category " .

  CategoryModel catagoryModel = CategoryModel();
  catagoryModel.catagoryName = 'Business';
  catagoryModel.catagoryImage = 'assets/business.jpeg';
  catagory.add(catagoryModel);

  catagoryModel = CategoryModel();
  catagoryModel.catagoryName = 'Entertainment';
  catagoryModel.catagoryImage = 'assets/entertainment.jpg';
  catagory.add(catagoryModel);

  catagoryModel = CategoryModel();
  catagoryModel.catagoryName = 'General';
  catagoryModel.catagoryImage = 'assets/general.jpg';
  catagory.add(catagoryModel);

  catagoryModel = CategoryModel();
  catagoryModel.catagoryName = 'Health';
  catagoryModel.catagoryImage = 'assets/health.jpg';
  catagory.add(catagoryModel);

  catagoryModel = CategoryModel();
  catagoryModel.catagoryName = 'Sport';
  catagoryModel.catagoryImage = 'assets/sport.jpg';
  catagory.add(catagoryModel);

  return catagory;
}
