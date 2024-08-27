import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class historyProvider with ChangeNotifier {
  List<dynamic> History = []; // Declare a list to store history items
  Future<void> Sethistory(Map<String, String> history) async {
    String appDirectory = (await getApplicationSupportDirectory())
        .path; // Get the application's data directory
    String filePath = '$appDirectory/appInfo.json'; // Construct the file path

    try {
      // Read existing data if the file exists
      if (File(filePath).existsSync()) {
        if (History.isEmpty) {
          // Read JSON data from the file
          String jsonString = await File(filePath).readAsString();

          // Decode the JSON data
          List<dynamic> decodedData = jsonDecode(jsonString);

          print("This is list Data : $decodedData");

          // History = decodedData.cast<List<Map<String, String>>>();
          History = decodedData; // Update History with decoded data
        } else {
          History.add(history);
        }

        // Write the updated data to the file
        await File(filePath).writeAsString(jsonEncode(History));
      } else {
        // Add the new history item to the existing list
        History.add(history);

        // Write the updated data to the file
        await File(filePath).writeAsString(jsonEncode(History));
      }
    } catch (e) {
      // Handle errors, e.g., print an error message
      print('Error writing to file: $e');
    }

    notifyListeners();
  }

  List<dynamic> get gethistory {
    Future.delayed(Duration(milliseconds: 0), () async {
      return await getjsonDadta(); // Call the async function to retrieve history
    }).then((value) {
      History = value; // Update the History list with the retrieved data
    });

    return History;
  }

  Future<List<dynamic>> getjsonDadta() async {
    String appDirectory = (await getApplicationSupportDirectory()).path;
    String filePath = '$appDirectory/appInfo.json';

    // Read existing data if the file exists
    if (File(filePath).existsSync()) {
      String jsonString = await File(filePath).readAsString();

      List<dynamic> decodedData = jsonDecode(jsonString);

      print("This is list Data 1: $decodedData");

      // History = decodedData.cast<List<Map<String, String>>>();
      return decodedData; // Return the decoded data
    }
    return []; // Return an empty list if the file doesn't exist
  }
}
