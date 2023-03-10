import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyPage extends StatelessWidget {
  final String? label;
  const NotifyPage({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.grey[600] : Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
          ),
          title: Text(label.toString().split("|")[0],
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.black : Colors.white)),
        ),
        body: Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.isDarkMode ? Colors.white : Colors.grey[400]),
          child: Text(
            label.toString().split("|")[1],
            style: TextStyle(
              color: Get.isDarkMode ? Colors.black : Colors.white,
              fontSize: 20,
            ),
          ),
        ));
  }
}
