import 'package:flutter/material.dart';
import 'package:random_date_night/foodBody.dart';
import 'activityBody.dart';
import 'homeBody.dart';

// HOME
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
} // END HOME

// HOME SCREEN
class HomeScreenState extends State<HomeScreen> {

  Color colorBottomNavBar =  const Color.fromRGBO(255, 175, 240, 1.0);
  Color colorBackground = const Color.fromRGBO(57, 47, 90, 1.0);


  /*
  we want the app to start on the "create a date" page which is index 1
  there will be three tabs indexed 0 - 2
  */
  int _currentIndex = 1;

  // create the string list to hold Food places
  List<String> myFoods = List<String>();

  // create the string list to hold Food places
  List<String> myActivities = List<String>();

  // this array will hold the widgets that will make up the "body" of the app
  final pageOptions = [
    new FoodBody(),
    new HomeBody(),
    new ActivityBody(),
  ]; //

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*appBar: AppBar(
        title: Center(
          child: Text('Create a Date',
          style: TextStyle(
            color: colorBackground,
          ),),
        ),
      ),*/

      body: pageOptions.elementAt(_currentIndex),
      // tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.local_dining),
            title: new Text('Food List'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Create a Date'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.sentiment_very_satisfied),
            title: new Text('Activity List'),
          ),
        ],
        // this will be set when a new tab is pressed
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorBottomNavBar,


        // this will be called when a navigation tab is pressed
        onTap: onItemTapped,

      ),
    );
  } // Build

  // this will be ran whenever a bottom navigation item is pressed
  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }// end onItemTapped

} // HomeScreen