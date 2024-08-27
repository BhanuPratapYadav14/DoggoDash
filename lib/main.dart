import 'package:doggodash/Providers/Apicalling.dart';
import 'package:doggodash/Providers/Historyprovider.dart';
import 'package:doggodash/Providers/addtoCard.dart';
import 'package:doggodash/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Sets up multiple providers for state management
      providers: [
        ChangeNotifierProvider(
            create: (_) => Apicalling()), // Provides API calling functionality
        ChangeNotifierProvider(
            create: (_) =>
                addtoCart()), // Provides cart management functionality
        ChangeNotifierProvider(
            create: (_) =>
                historyProvider()) // Provides history management functionality
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splashscreen(), // Sets the initial screen to Splashscreen
      ),
    );
  }
}
