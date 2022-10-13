import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:bar_graph_app/models/model_people.dart';

class PeopleProvider extends ChangeNotifier {
  List<People> peoples = [];

  Future<void> fetchPeople() async {
    Future.delayed(Duration(seconds: 1), () {
      peoples = [
        People('스미스', 180, 92),
        People('메리', 162, 55),
        People('존', 177, 75),
        People('바트', 130, 40),
        People('콘', 194, 140),
        People('디디', 100, 80),
      ];
      notifyListeners();
    });
  }
}
