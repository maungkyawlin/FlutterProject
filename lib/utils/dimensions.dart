import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.6;
  static double pageViewContainer = screenHeight / 3.24;
  static double pageViewTextContainer = screenHeight / 6.0;

  //Dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;
  //Dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

  //font sizes
  static double font16 = screenHeight / 52.72;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  //radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  //icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  //list view size

  static double listViewImageSize = screenWidth / 3.25;
  static double listViewTextContainer = screenWidth / 3.95;

  //popular food
  static double popularFoodImgSize = screenHeight / 2.42;

  //bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
