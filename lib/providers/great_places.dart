import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locationapp/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  addPlace(String title, File image) {
    final NewPlace = Place(
        title: title,
        id: DateTime.now().toString(),
        image: image,
        location: null);
    _items.add(NewPlace);
    notifyListeners();
  }
}
