import 'dart:math';
import 'package:get_it/get_it.dart';
import 'package:small_test_task_unitpay/models/good.dart';

class Repository {
  final rnd = GetIt.I.get<Random>();
  List<Goodie> generated = [];
  final List<Map<String, dynamic>> listofGoodies = [
    {"name": "Table lamp", "url": 'https://bit.ly/3zG92XK'},
    {"name": "Book", "url": 'https://bit.ly/2XPWPlZ'},
    {"name": "Game", "url": 'https://bit.ly/3oclxsd'},
    {"name": "Coffee", "url": 'https://bit.ly/3ACyAGy'},
    {"name": "PS 5", "url": 'https://bit.ly/3i5EEQP'},
    {"name": "Best bike", "url": 'https://bit.ly/3o5RSAI'},
    {"name": "Chips", "url": 'https://bit.ly/3kHA1xK'},
    {"name": "Knife", "url": 'https://bit.ly/3EQShwV'},
    {"name": "Cereal", "url": 'https://bit.ly/39yLx8y'},
    {"name": "Pelmeni", "url": 'https://bit.ly/3kFjo5Q'},
    {"name": "Toys", "url": 'https://bit.ly/2WaoCNB'},
    {"name": "Gun", "url": 'https://bit.ly/3ubzvLA'},
    {"name": "Watches", "url": 'https://bit.ly/39DxvTa'},
    {"name": "Jewelery", "url": 'https://bit.ly/2XNN086'},
    {"name": "Vinyl", "url": 'https://bit.ly/3CKafPJ'},
    {"name": "Award", "url": 'https://bit.ly/3oaUYDw'},
    {"name": "Mug", "url": 'https://bit.ly/3CFBGKu'},
    {"name": "Teapot", "url": 'https://bit.ly/3zPjfkC'},
    {"name": "Chess", "url": 'https://bit.ly/3i4LLsy'},
    {"name": "Boots", "url": 'https://bit.ly/3lZIb4g'},
  ];

  List<Goodie> generateList() {
    int amount = rnd.nextInt(1000000) + 100000;
    return generated = List<Goodie>.generate(amount, (index) {
      Map<String, dynamic> element =
          listofGoodies[rnd.nextInt(listofGoodies.length)];
      return Goodie(name: element['name'], url: element['url'], index: index);
    }).toList();
  }
}
