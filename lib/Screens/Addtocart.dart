import 'package:doggodash/Providers/addtoCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addtocart extends StatefulWidget {
  const Addtocart({super.key});

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 174, 192),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height * 1.0,
        width: MediaQuery.sizeOf(context).width * 1.0,
        child: SafeArea(child: Consumer<addtoCart>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.CartItems.length,
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
                                  value.CartItems[index]["puppyImage"] ?? ""),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(value.CartItems[index]["breed Name"] ?? ""),
                        SizedBox(
                          height: 10,
                        ),
                        Text(value.CartItems[index]["price"] ?? ""),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        )),
      ),
    );
  }
}
