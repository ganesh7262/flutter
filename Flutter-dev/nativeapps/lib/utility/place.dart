import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({required this.title}) : id = uuid.v4();
  final String id;
  final String title;
}

class PlaceModel extends ChangeNotifier {
  List<Place> _places = [];

  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  void add(Place place) {
    _places.add(place);
    notifyListeners();
  }

  void remove(Place place) {
    _places.remove(place);
    notifyListeners();
  }

  void removeAll() {
    _places.clear();
    notifyListeners();
  }
}
