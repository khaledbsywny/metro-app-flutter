// import 'package:flutter/material.dart';
//
// class OutPutScreen extends StatelessWidget {
//   OutPutScreen({super.key});
//   final lineController = TextEditingController();
//   List<Station> line1Stations = [
//     Station("Station 1"),
//     Station("Station 2")
//   ]; // Replace with your data
//   List<Station> line2Stations = [Station("Station 3"), Station("Station 4")];
//   List<Station> line3Stations = [Station("Station 5"), Station("Station 6")];
//
//   List<Station> selectedStations = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backgroundColor: Color.black,
//       body: SafeArea(
//           child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               // Navigate to previous screen
//               // Navigator.pop(context);
//               Get.to(PlanPage(),
//                   transition: Transition.fadeIn); // navigate to contact page
//             },
//             child: Image.asset(
//               'assets/images/plan.jpg',
//               width: double.infinity,
//               height: 300,
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(
//             height: 60,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: DropdownMenu<String>(
//               width: double.infinity,
//               menuHeight: 400,
//               enableSearch: false,
//               enableFilter: false,
//               requestFocusOnTap: true,
//               hintText: 'Please select a line',
//               controller: lineController,
//               onSelected: (value) {
//                 if (value == 'Line 1') {
//                   setState(() {
//                     selectedStations = line1Stations;
//                   });
//                 } else if (value == 'Line 2') {
//                   setState(() {
//                     selectedStations = line2Stations;
//                   });
//                 } else if (value == 'Line 3') {
//                   setState(() {
//                     selectedStations = line3Stations;
//                   });
//                 }
//               },
//               dropdownMenuEntries: [
//                 DropdownMenuEntry(value: 'Line 1', label: 'Line 1'),
//                 DropdownMenuEntry(value: 'Line 2', label: 'Line 2'),
//                 DropdownMenuEntry(value: 'Line 3', label: 'Line 3'),
//               ],
//             ),
//           ),
//           if (selectedStations.isNotEmpty) ...[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownMenu<String>(
//                 width: double.infinity,
//                 menuHeight: 400,
//                 enableSearch: true,
//                 enableFilter: true,
//                 requestFocusOnTap: true,
//                 hintText: 'Please select a station',
//                 controller: stationController,
//                 onSelected: (value) {},
//                 dropdownMenuEntries: selectedStations
//                     .map((Station station) => DropdownMenuEntry(
//                           value: station.name,
//                           label: station.name,
//                         ))
//                     .toList(),
//               ),
//             ),
//           ],
//         ],
//       )),
//     );
//   }
// }
//
// class Station {
//   final String name;
//   Station(this.name);
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmetro/plan_page.dart';

class LineScreen extends StatefulWidget {
  @override
  _LineScreenState createState() => _LineScreenState();
}

class _LineScreenState extends State<LineScreen> {
  final lineController = TextEditingController();
  List<Station> line1Stations = [
    Station("Helwan"),
    Station("Ain.Helwan"),
    Station("Helwan University"),
    Station("Wadi hof"),
    Station("Hadik Helwan"),
    Station("Elmasara"),
    Station("Tora Elasmant"),
    Station("Kotcika"),
    Station("Tora Elbalad"),
    Station("Thakanat Elmaadi"),
    Station("Elmaadi"),
    Station("Hadik Elmaadi"),
    Station("Dar Elsalam"),
    Station("Elzahra"),
    Station("Maregerges"),
    Station("Elmalek Elsaleh"),
    Station("Elsaida Zainab"),
    Station("Saad Zaghlol"),
    Station("Elsadat"),
    Station("Jamal Abdulnasser"),
    Station("Ahmed Oraby"),
    Station("Elshohada"),
    Station("Ghamra"),
    Station("Eldemerdash"),
    Station("Manshia.Elsadr"),
    Station("Kobre.Eloba"),
    Station("Hamamat.Elkoba"),
    Station("Saria.Elkoba"),
    Station("Hadaik.Elzaiton"),
    Station("Helmit.Elzaiton"),
    Station("Elmataria"),
    Station("Ain.Shams"),
    Station("Ezbet.Elnakhl"),
    Station("Elmarg"),
    Station("Elmarg.Elgededa")
  ]; // Replace with your data
  List<Station> line2Stations = [
    Station("El Munib"),
    Station("saqiat makki"),
    Station("dawahi algiza"),
    Station("Algiza"),
    Station("Faisal"),
    Station("Cairo university"),
    Station("El bohoth"),
    Station("Dokki"),
    Station("El-opera"),
    Station("Elsadat"),
    Station("Muhammad Naguib"),
    Station("El-Ataba"),
    Station("Elshohada"),
    Station("Masarah"),
    Station("Rod El-farag"),
    Station("Saint Teresa"),
    Station("Al-Khalafawi"),
    Station("El-mazalat"),
    Station("faculty of Agriculture"),
    Station("Shubra Al-Khaimah")
  ];

  List<Station> line3Stations = [
    Station("Adly Mansour"),
    Station("Highstep"),
    Station("Omar bin al-khattab"),
    Station("Quba"),
    Station("Hisham Barakat"),
    Station("El-nozha"),
    Station("Nadi El-Shams"),
    Station("Alf Maskan"),
    Station("Heliopolis"),
    Station("Aaron"),
    Station("A-Ahram"),
    Station("Koliat El-panat"),
    Station("Al-Estad"),
    Station("ArdAl-Mared"),
    Station("Abbasiya"),
    Station("Abdo Pasha"),
    Station("Al-Gesh"),
    Station("Babal-sharya"),
    Station("El-Ataba"),
    Station("Jamal Abdulnasser"),
    Station("Maspero"),
    Station("safa hegaze"),
    Station("Kit Kat")
  ];

  List<Station> selectedStations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Metro Masr',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                // Navigate to previous screen
                Get.to(PlanPage(),
                    transition: Transition.fadeIn); // navigate to contact page
              },
              child: Image.asset(
                'assets/images/plan.jpg',
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                width: double.infinity,
                menuHeight: 400,
                enableSearch: false,
                enableFilter: false,
                requestFocusOnTap: true,
                hintText: 'Please select a line',
                controller: lineController,
                onSelected: (value) {
                  setState(() {
                    if (value == 'Line 1') {
                      selectedStations = line1Stations;
                    } else if (value == 'Line 2') {
                      selectedStations = line2Stations;
                    } else if (value == 'Line 3') {
                      selectedStations = line3Stations;
                    }
                  });
                },
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'Line 1', label: 'Line 1'),
                  DropdownMenuEntry(value: 'Line 2', label: 'Line 2'),
                  DropdownMenuEntry(value: 'Line 3', label: 'Line 3'),
                ],
              ),
            ),
            if (selectedStations.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.grey[850],
                  elevation: 4,
                  child: SizedBox(
                    height: 200, // Define the fixed height of the card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Stations of the selected line:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: selectedStations.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    selectedStations[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Station {
  final String name;
  Station(this.name);
}

// ...selectedStations.map((station) {
// return Padding(
// padding:
// const EdgeInsets.symmetric(vertical: 4.0),
// child: Text(
// station.name,
// style: const TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// color: Colors.white,
//}.tolist(
