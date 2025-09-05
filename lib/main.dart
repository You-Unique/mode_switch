import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mode_switch/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

//we need a controller to manage our theme state
//GetxController - A controller class from the GetX package that provides reactive state management capabilities
//run "flutter pub add get" to add the get package
//this controller will hold our theme state and provide methods to toggle the theme anywhere in the app
class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  //.obs - Makes this variable "observable"
  //watch the app for changes and automatically update when it changes

  //flip switch to toggle theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //initialize the ThemeController and make it available throughout the app
    //Get.put() - A method from the GetX package that registers a controller or dependency
    //Compulsory so it can be accessed from anywhere in the app
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(
      //Obx - shprt for "Observer"
      //A widget from the GetX package that listens to changes in observable variables and rebuilds when they change
      //GetMaterialApp - A specialized version of MaterialApp provided by the GetX package
      () => GetMaterialApp(
        //to remove the debug banner
        debugShowCheckedModeBanner: false,
        //app title - shows when you minimize the app
        title: 'Younique Tutorials',
        //defining the light and dark themes
        theme: ThemeData.light().copyWith(
          //changes the app bar color to blue in light mode
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        ),
        darkTheme: ThemeData.dark().copyWith(
          //changes the app bar color to amber in light mode
          appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
        ),
        //set the theme mode based on the controller's state
        themeMode: themeController.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        //setting the first screen to be the SplashScreen
        home: const SplashScreen(),
      ),
    );
  }
}
