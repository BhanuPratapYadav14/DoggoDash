import 'package:doggodash/Providers/Apicalling.dart';
import 'package:doggodash/Providers/Historyprovider.dart';
import 'package:doggodash/Providers/addtoCard.dart';
import 'package:doggodash/Screens/Addtocart.dart';
import 'package:doggodash/Screens/Drawerpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String image = "";
  String breed = "";
  String price = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final callApi = Provider.of<Apicalling>(context, listen: false);
    callApi.callApi();
  }

  @override
  Widget build(BuildContext context) {
    //print("RE - Building Widget");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 174, 192),
        foregroundColor: const Color.fromARGB(255, 20, 79, 127),
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/AppLogo.jpg"),
        ),
        title: const Text("DogoDash"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontFamily: "OpenSans"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Addtocart(),
                    ));
              },
              icon: const Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              )),
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  if (Scaffold.of(context).hasEndDrawer) {
                    Scaffold.of(context).openEndDrawer();
                  }
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ));
          })
        ],
      ),
      endDrawer: const Drawer(
        child: Drawerpage(),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height * 1.0,
        width: MediaQuery.sizeOf(context).width * 1.0,
        padding: const EdgeInsets.all(20),
        child: SafeArea(child: Center(
          child: Consumer<Apicalling>(
            builder: (context, value, child) {
              image = value.Respons['image'] ?? "";
              breed = value.Respons['BreedName'] ?? "";
              price = value.Respons['price'] ?? "";
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: value.Respons["image"] == null
                                    ? const AssetImage("assets/AppLogo.jpg")
                                    : NetworkImage(value.Respons["image"]!),
                                fit: BoxFit.fill),
                            border: Border.all(color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Breed Name: ${value.Respons['BreedName']}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Price: ${value.Respons['price']}"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<Apicalling>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                Map<String, String> history = {
                                  "puppyImage": image,
                                  "breed Name": breed,
                                  "price": price
                                };

                                Provider.of<historyProvider>(context,
                                        listen: false)
                                    .Sethistory(history);

                                image = "";
                                breed = "";
                                price = "";

                                value.callApi();
                              },
                              child: const Text("Next ->"));
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Consumer<addtoCart>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              onPressed: () {
                                final Map<String, String> newItem = {
                                  "puppyImage": image,
                                  "breed Name": breed,
                                  "price": price
                                };
                                value.cartItem(newItem);
                                // newItem.clear();
                              },
                              child: const Text("Add to Cart"));
                        },
                      )
                    ],
                  )
                ],
              );
            },
          ),
        )),
      ),
    );
  }

  // void updatehistory(Map<String, String> history) {
  //   Future.delayed(
  //     const Duration(milliseconds: 80),
  //     () {
  //       final storeHistory =
  //           Provider.of<historyProvider>(context, listen: false);
  //       storeHistory.Sethistory(history);
  //     },
  //   );
  // }
}
