import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apicalling with ChangeNotifier {
  String url = "https://dog.ceo/api/breeds/image/random";
  Map<String, String> ListOfResponses = {};
  final dogPrice = [
    5000,
    8000,
    10000,
    4000,
    13000,
    7000,
    8000,
    19000,
    20000,
    15000
  ];

  void callApi() async {
    try {
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body.replaceAll(" ", ""));

        ListOfResponses["image"] = jsonResponse["message"];
        // print("${jsonResponse["message"]}");
        ListOfResponses["BreedName"] =
            _getBreedName(jsonResponse["message"].toString());
        ListOfResponses['price'] =
            dogPrice.elementAt(int.parse(_getPrice())).toString();

        notifyListeners();
      } else {
        notifyListeners();
      }
    } on HttpException catch (e) {
      e.message;
      notifyListeners();
      // TODO
    }
  }

  Map<String, String> get Respons => ListOfResponses;

  String _getBreedName(String _jsonResponse) {
    String breedName = "";
    final uri = Uri.parse(_jsonResponse);
    final pathSegments = uri.pathSegments;
    print(pathSegments);
    if (pathSegments.length >= 3) {
      breedName = pathSegments[1];

      print('Breed name: $breedName');
    } else {
      breedName = "";
      print('Unable to parse breed name from URL.');
    }
    return breedName;
  }

  String _getPrice() {
    final random = Random();
    final randomNumber = random.nextInt(10);
    return randomNumber.toString();
  }
}
