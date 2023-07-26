import 'dart:collection';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:nativeapps/utility/location_input.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart' as sysPath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

const uuid = Uuid();

Future<sql.Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, "places.db"),
      onCreate: (db, version) {
    return db.execute(
        "CREATE TABLE user_places (id TEXT PRIMARY KEY, title  TEXT NOT NULL, image TEXT NOT NULL, lat REAL, lon REAL)");
  }, version: 1);
  return db;
}

class Place {
  Place({required this.title, required this.image, required this.location, id})
      : id = id ?? uuid.v4();
  String? id;
  final String title;
  final File image;
  final userLocationHelper location;
}

class PlaceModel extends ChangeNotifier {
  List<Place> _places = [];

  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  void add(String title, File image, userLocationHelper location) async {
    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final imageFileName = path.basename(image.path);
    final copiedImage = await image.copy("${appDir.path}/$imageFileName");
    final newPlace =
        Place(title: title, image: copiedImage, location: location);

    final db = await _getDatabase();

    db.insert('user_places', {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
      "lat": newPlace.location.lat,
      "lon": newPlace.location.lon,
    });

    _places.add(newPlace);
    notifyListeners();
  }

  void loadDatabase() async {
    final db = await _getDatabase();
    final data = await db.query("user_places");
    final places_from_db = data
        .map(
          (row) => Place(
            id: row["id"] as String,
            title: row["title"] as String,
            image: File(row["image"] as String),
            location: userLocationHelper(
                lat: row["lat"] as double, lon: row["lon"] as double),
          ),
        )
        .toList();
    _places = places_from_db;
    print(_places);
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
