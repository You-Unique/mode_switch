import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mode_switch/main.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        //back button
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Other Screen',
          style: TextStyle(
            //change text color based on theme
            color: themeController.isDarkMode.value
                ? Colors.black
                : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        // placse the card in the center of the screen

        //A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc.
        //It has slightly rounded corners and a shadow.
        //Cards can be used to create a consistent look across your app.

        //When to use Cards:
        // ✅ Displaying collections of information (like news articles, products)

        // ✅ Presenting options or settings

        // ✅ Showing user profiles or contact information

        // ✅ Creating visually separated content blocks

        //Read More:
        //https://api.flutter.dev/flutter/material/Card-class.html
        child: Card(
          child: Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            child: const Text('Other Screen'),
          ),
        ),
      ),
    );
  }
}
