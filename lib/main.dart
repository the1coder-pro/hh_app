import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hassan Hotels',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9d1f26)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController floorController = TextEditingController();

  TextEditingController moneyController = TextEditingController();

  List<Map> bookedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Welcome To The Best Hotel\n",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "How can I help you? ",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        )),
              ])),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Choose one of the following options: ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit_calendar_outlined),
                  titleTextStyle: const TextStyle(fontSize: 20),
                  tileColor: const Color(0xFFedc93c),
                  title: const Text("Reservation"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Scaffold(
                              appBar: AppBar(
                                title: const Text("Reservation"),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.all(20),
                                child: ListView(
                                  children: [
                                    const Text(
                                        "Sure, Which floor do you prefer? "),
                                    const SizedBox(height: 20),
                                    TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: floorController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Floor Number"),
                                    ),
                                    const SizedBox(height: 20),
                                    FilledButton(
                                      onPressed: () {
                                        var roomNumber =
                                            Random().nextInt(400) + 1;

                                        setState(() {
                                          bookedRooms.add({
                                            "floor": floorController.text,
                                            "room": roomNumber
                                          });
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                icon: const Icon(Icons.check),
                                                title:
                                                    const Text("Room Booked!"),
                                                content: Text(
                                                    "great, your room is in the ${floorController.text}, room number is $roomNumber"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        floorController.text =
                                                            "";
                                                      },
                                                      child: const Text("OK"))
                                                ],
                                              );
                                            });
                                      },
                                      child: const Text("Book"),
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.question_answer_outlined),
                  titleTextStyle: const TextStyle(fontSize: 20),
                  tileColor: const Color(0xFFafd6da),
                  title: const Text("Inquiry"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Scaffold(
                              appBar: AppBar(
                                title: const Text("Inquiry"),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.all(20),
                                child: ListView(
                                  children: const [
                                    Center(
                                      child: Card(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Please Contact us at 911,\nI assure you we will be very helpful.",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.hotel_class_outlined),
                  titleTextStyle: const TextStyle(fontSize: 20),
                  tileColor: const Color(0xFFcabbe5),
                  title: const Text("Buying the hotel"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Scaffold(
                              appBar: AppBar(
                                title: const Text("Buying the hotel"),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.all(20),
                                child: ListView(
                                  children: [
                                    const Center(
                                      child: Card(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Oh, you are the first one asking to buy the whole hotel,\nhow much money do you have?",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    TextField(
                                      controller: moneyController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(Icons.attach_money),
                                          hintText: "Money Amount"),
                                    ),
                                    const SizedBox(height: 20),
                                    FilledButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                icon: const Icon(
                                                    Icons.error_outline),
                                                title: const Text("Sorry"),
                                                content: Text(
                                                    "The Best offer we can give you is \$${int.parse(moneyController.text) + 1}"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("OK"))
                                                ],
                                              );
                                            });
                                      },
                                      child: const Text("Submit Offer"),
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  },
                ),
                // show the booked rooms button if there are any
                if (bookedRooms.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.bedroom_parent_outlined),
                    titleTextStyle: const TextStyle(fontSize: 20),
                    tileColor: const Color(0xFFf4c7aa),
                    title: const Text("Show Booked Rooms"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Scaffold(
                              appBar: AppBar(
                                title: const Text("Booked Rooms"),
                              ),
                              body: ListView.builder(
                                itemCount: bookedRooms.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const Icon(
                                        Icons.bedroom_child_outlined),
                                    title: Text(
                                        "Room ${bookedRooms[index]['room']}\ - Floor ${bookedRooms[index]['floor']}"),
                                  );
                                },
                              ),
                            ),
                          ));
                    },
                  ),
              ],
            ),
          ),
          const Center(
              child: SizedBox(
                  height: 60,
                  child: Image(image: AssetImage("assets/logo.png")))),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
