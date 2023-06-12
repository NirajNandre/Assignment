import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 21, 21, 21),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Jost',
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Jost',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: VehiclePage(),
    );
  }
}

class VehiclePage extends StatefulWidget {
  VehiclePage({Key? key}) : super(key: key);
  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  
  final _pageController = PageController();

  final List<Map<String, dynamic>> itemList = [
    {'icon': Icons.currency_rupee, 'text': 'Pricing'},
    {'icon': Icons.location_on_outlined, 'text': 'Pickup Location'},
    {'icon': Icons.camera_alt_outlined, 'text': 'Vehicle Photos'},
    {'icon': Icons.menu, 'text': 'Vehicle Description'},
    {'icon': Icons.calendar_month, 'text': 'Set Availability'},
    {'icon': Icons.sticky_note_2_sharp, 'text': 'Notes for pickup'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          elevation: 4,
          backgroundColor: Colors.white,
          title: const Text(
            "Honda Activa 110cc",
            style: TextStyle(fontSize: 20),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Image.network(
                             "https://bd.gaadicdn.com/processedimages/honda/activa-6g/640X309/activa-6g63ce6a450dd74.jpg",
                              fit: BoxFit.cover,
                            ),
                          
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: FractionalTranslation(
                          translation: const Offset(0.2, 1.5),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: IconButton(
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                              color: const Color(0xFFFFFFFF),
                              onPressed: () {},
                            ),
                          ),
                        )
                        ),
                    Positioned(
                      bottom: 12,
                      right: 0,
                      left: 150,
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: const SlideEffect(
                          activeDotColor: Colors.black54,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Title(
                        color: Colors.black,
                        child: const Text(
                          "Honda Activa 110cc ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: const Icon(
                          Icons.star,
                          color: Color.fromRGBO(99, 64, 186, 1),
                          size: 15,
                        ),
                      ),
                      const Text(
                        "4.3",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(99, 64, 186, 1)),
                      ),
                      const Text(
                        " (44 rides)",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "MH 12 KP 3431",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 98, 97, 97)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.verified,
                        color: Color.fromRGBO(80, 246, 158, 1),
                        size: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      onPressed: () {},
                      label: const Text("Vehicle Preview",
                          style: TextStyle(color: Colors.black)),
                      icon: Icon(Icons.remove_red_eye, color: Colors.black)),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      'SETTINGS',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    final item = itemList[index];
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(item['icon']),
                        title: Text(item['text']),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        onTap: () {},
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
                Center(
                    child: const Text(
                  "Remove this vehicle",
                  style: TextStyle(fontSize: 15, color: Colors.red),
                ))
              ],
            ),
          ),
        ));
  }
}
