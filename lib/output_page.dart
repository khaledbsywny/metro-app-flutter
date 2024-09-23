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

class OutPutScreen extends StatefulWidget {
  @override
  _OutPutScreenState createState() => _OutPutScreenState();
}

class _OutPutScreenState extends State<OutPutScreen> {
  final lineController = TextEditingController();
  List<Station> line1Stations = [
    Station("Station 1"),
    Station("Station 2")
  ]; // Replace with your data
  List<Station> line2Stations = [Station("Station 3"), Station("Station 4")];
  List<Station> line3Stations = [Station("Station 5"), Station("Station 6")];

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
                // Navigator.pop(context);
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
                //hintText: TextStyle(color: Colors.white), // Hint text color
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
                              color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        ...selectedStations.map((station) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              station.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }).toList(),
                      ],
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
