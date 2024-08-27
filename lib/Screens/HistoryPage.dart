import 'package:doggodash/Providers/Historyprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  List<dynamic> HistoryData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final historyData = Provider.of<historyProvider>(context, listen: false);
    HistoryData = historyData.gethistory;
  }

  @override
  Widget build(BuildContext context) {
    print("The HistoryData of Dogs : ${HistoryData}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 174, 192),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 1.0,
          width: MediaQuery.sizeOf(context).width * 1.0,
          child: ListView.builder(
            itemCount: HistoryData.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: NetworkImage(
                                HistoryData[index]["puppyImage"] ?? ""),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(HistoryData[index]["breed Name"] ?? ""),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(HistoryData[index]["price"] ?? ""),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
