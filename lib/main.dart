import 'package:flutter/material.dart';
import 'package:locationapp/providers/great_places.dart';
import 'package:locationapp/screens/add_place_screen.dart';
import 'package:locationapp/screens/places_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesListScreen(),
        routes: {AddPlaceScreen.routeName: (context) => AddPlaceScreen()},
      ),
    );
  }
}
