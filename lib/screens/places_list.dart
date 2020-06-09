import 'package:flutter/material.dart';
import 'package:locationapp/providers/great_places.dart';
import 'package:locationapp/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your places"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
            )
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: Center(
            child: Text("Add a new place"),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.items[index].image),
                    ),
                    title: Text(greatPlaces.items[index].title),
                  ),
                ),
        ));
  }
}
