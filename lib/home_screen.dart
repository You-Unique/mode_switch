// Home Screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mode_switch/main.dart';
import 'package:mode_switch/next_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //access the ThemeController instance from anywhere in the app
    //Get.find() - A method from the GetX package that retrieves a registered controller or dependency
    //This is used to access the ThemeController instance that was initialized in main.dart using Get.put()
    final ThemeController themeController = Get.find();

    return Scaffold(
      //Top Bar with title and theme toggle button
      appBar: AppBar(
        //center the title
        centerTitle: true,
        title: Obx(
          //Obx - shrt for "Observer"
          //A widget from the GetX package that
          //listen to changes in observable variables and rebuilds when they change
          () => Text(
            //display current theme mode on the app bar
            themeController.isDarkMode.value ? 'Dark Mode' : 'Light Mode',
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
        actions: [
          //icon button to toggle theme
          IconButton(
            icon: Obx(
              () => Icon(
                themeController.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: themeController.isDarkMode.value
                    ? Colors.black
                    : Colors.white,
                size: 30,
              ),
            ),
            onPressed: () {
              //changes the theme when pressed
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => ElevatedButton(
            //ElevatedButton - A material design button that has a shadow and lifts when pressed
            //change button color based on theme
            style: ElevatedButton.styleFrom(
              //check the current theme and sets the button color accordingly
              backgroundColor: themeController.isDarkMode.value
                  ? Colors.amber
                  : Colors.blue,
              foregroundColor: Colors.white,
              // backgroundcolor - the colour of the button itself
              // foregroundColor - Text/icon color (what's on top of the button)
            ),
            //the text inside the button
            child: Text(
              'Go to Next Screen',
              style: TextStyle(
                //change text color based on theme
                color: themeController.isDarkMode.value
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            //button to move to the next screen
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NextScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
