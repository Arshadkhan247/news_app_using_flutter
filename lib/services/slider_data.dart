import 'package:news_app_using_flutter/models/slider_model.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];

  // this file is used to display the name and image of the different categories in Categories Section.

  //  1. first we create instance of the model to access their attributes.
  //  2. then we using the the name and image property to make a single record.
  //  3. add that record into our list called "catagory"
  //  4. this steps are repeat for each of category.
  //  5. at the end we return the list of different categries by  " return category " .

  SliderModel sliderModal = SliderModel();
  sliderModal.sliderName =
      '"Global markets rally as positive economic indicators drive investor confidence to new heights."';
  sliderModal.sliderImage = 'assets/business.jpeg';
  slider.add(sliderModal);

  sliderModal = SliderModel();
  sliderModal.sliderName =
      'A-list celebrity duo sparks romance rumors with cozy dinner date in the heart of Hollywood!"';
  sliderModal.sliderImage = 'assets/entertainment.jpg';
  slider.add(sliderModal);

  sliderModal = SliderModel();
  sliderModal.sliderName =
      '"Global leaders convene to address pressing issues at the annual summit."';
  sliderModal.sliderImage = 'assets/general.jpg';
  slider.add(sliderModal);

  sliderModal = SliderModel();
  sliderModal.sliderName =
      '"New study reveals that regular exercise can significantly reduce the risk of chronic diseases."';
  sliderModal.sliderImage = 'assets/health.jpg';
  slider.add(sliderModal);

  sliderModal = SliderModel();
  sliderModal.sliderName =
      '"Defending champions secure thrilling victory in nail-biting overtime, clinching a spot in the championship finals."';
  sliderModal.sliderImage = 'assets/sport.jpg';
  slider.add(sliderModal);

  return slider;
}
