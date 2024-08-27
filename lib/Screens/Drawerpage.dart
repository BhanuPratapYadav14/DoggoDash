import 'package:doggodash/Screens/HistoryPage.dart';
import 'package:flutter/material.dart';

class Drawerpage extends StatefulWidget {
  const Drawerpage({super.key});

  @override
  State<Drawerpage> createState() => _DrawerpageState();
}

class _DrawerpageState extends State<Drawerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 174, 192),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height * 1.0,
        width: MediaQuery.sizeOf(context).width * 1.0,
        child: SafeArea(
            child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.04),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).closeEndDrawer();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Historypage()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history),
                    SizedBox(
                      width: 5,
                    ),
                    Text("History")
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
