import 'package:flutter/material.dart';
import 'package:newmetro/station.dart';

class Metropage extends StatelessWidget {
  Metropage({super.key});

  final startStationController = TextEditingController();
  final endStationController = TextEditingController();
  final showController = TextEditingController();
  final List<Station> allStations = [];

  // Defining stations for Line 1
  List<Station> line1Stations = [
    Station.withCoordinates("Helwan", 1, 29.848971477600465, 31.3342277402767),
    Station.withCoordinates(
        "Ain Helwan", 1, 29.862618672434877, 31.324868625198697),
    Station.withCoordinates(
        "Helwan University", 1, 29.869449601926597, 31.320046759925),
    Station.withCoordinates(
        "Wadi Hof", 1, 29.87907177726837, 31.31359877100767),
    Station.withCoordinates(
        "Hadayek Helwan", 1, 29.8971343176686, 31.303949916769852),
    Station.withCoordinates(
        "El-Maasara", 1, 29.90607180460953, 31.299546485341345),
    Station.withCoordinates(
        "Tora El-Asmant", 1, 29.925952436139358, 31.28751737050467),
    Station.withCoordinates(
        "Kozzika", 1, 29.936255483265562, 31.281746149662656),
    Station.withCoordinates(
        "Tora El-Balad", 1, 29.946753482470786, 31.27297339529574),
    Station.withCoordinates(
        "Sakanat El-Maadi", 1, 29.953295057267717, 31.262930306684932),
    Station.withCoordinates("Maadi", 1, 29.96030423051439, 31.25764948315825),
    Station.withCoordinates(
        "Hadayek El-Maadi", 1, 29.970122212488985, 31.250598693114473),
    Station.withCoordinates(
        "Dar El-Salam", 1, 29.982068330083234, 31.242137136641734),
    Station.withCoordinates(
        "El-Zahraa", 1, 29.995472526446658, 31.23118153562492),
    Station.withCoordinates(
        "Mar Girgis", 1, 30.006101473601202, 31.229614844174662),
    Station.withCoordinates(
        "El-Malek El-Saleh", 1, 30.017710810042463, 31.23120505463815),
    Station.withCoordinates(
        "Al-Sayeda Zeinab", 1, 30.02927144981774, 31.235431896201714),
    Station.withCoordinates(
        "Saad Zaghloul", 1, 30.037029775306358, 31.238362345996254),
    Station.withCoordinates("Sadat", 1, 30.044131546661667, 31.23442101982754),
    Station.withCoordinates("Orabi", 1, 30.05668848060458, 31.242045447595284),
    Station.withCoordinates(
        "Al-Shohadaa", 1, 30.061072829206587, 31.24605272665066),
    Station.withCoordinates("Ghamra", 1, 30.069023346371683, 31.26461830891386),
    Station.withCoordinates(
        "El-Demerdash", 1, 30.077330022991504, 31.27778779585812),
    Station.withCoordinates(
        "Manshiet El-Sadr", 1, 30.081992026306036, 31.287537619402794),
    Station.withCoordinates(
        "Kobri El-Qobba", 1, 30.08723160261677, 31.29411335237051),
    Station.withCoordinates(
        "Hammamat El-Qobba", 1, 30.09124391016904, 31.298899586798832),
    Station.withCoordinates(
        "Saray El-Qobba", 1, 30.097687390297263, 31.304588155210944),
    Station.withCoordinates(
        "Hadayeq El-Zaitoun", 1, 30.10589892269087, 31.31047449059628),
    Station.withCoordinates(
        "Helmeyet El-Zaitoun", 1, 30.11332907091743, 31.313954979683),
    Station.withCoordinates(
        "El-Matareyya", 1, 30.12137639637615, 31.31372848534359),
    Station.withCoordinates(
        "Ain Shams", 1, 30.131021186452816, 31.319080193578966),
    Station.withCoordinates(
        "Ezbet El-Nakhl", 1, 30.13929018873895, 31.324357231785047),
    Station.withCoordinates(
        "El-Marg", 1, 30.152100785277824, 31.335626552512593),
    Station.withCoordinates(
        "New El-Marg", 1, 30.163631522845037, 31.338291653561676),
  ];

  List<Station> line2Stations = [
    Station.withCoordinates(
        "El-Mounib", 2, 29.981651991446835, 31.212367615420153),
    Station.withCoordinates(
        "Sakiat Mekky", 2, 29.995553588294797, 31.20854814991042),
    Station.withCoordinates(
        "Omm El-Masryeen", 2, 30.006197101467905, 31.208295299388546),
    Station.withCoordinates("El Giza", 2, 30.01060334066647, 31.20681571771362),
    Station.withCoordinates(
        "Faisal", 2, 30.017305743782682, 31.203790909502985),
    Station.withCoordinates("Cairo University", 3, 30.02589832890943,
        31.20108435766103), // transition with line#3
    Station.withCoordinates(
        "El Bohoth", 2, 30.03578346864703, 31.20015967637783),
    Station.withCoordinates("Dokki", 2, 30.038435227514427, 31.2122256011576),
    Station.withCoordinates("Opera", 2, 30.041898137974737, 31.225082621984463),
    Station.withCoordinates(
        "Mohamed Naguib", 2, 30.04535402428948, 31.244204262060276),
    Station.withCoordinates(
        "Masarra", 2, 30.070876977882186, 31.245128050666978),
    Station.withCoordinates(
        "Road El-Farag", 2, 30.080581951605392, 31.245372311976265),
    Station.withCoordinates(
        "St. Teresa", 2, 30.087964202326077, 31.245465729806423),
    Station.withCoordinates(
        "Khalafawy", 2, 30.097884814100773, 31.245399165907173),
    Station.withCoordinates(
        "Mezallat", 2, 30.104189603256174, 31.245632631338168),
    Station.withCoordinates(
        "Kolleyyet El-Zeraa", 2, 30.113690224264595, 31.248672945111473),
    Station.withCoordinates(
        "Shubra El-Kheima", 2, 30.122483587915514, 31.244492820715912),
  ];

  List<Station> line3Stations = [
    Station.withCoordinates(
        "Adly Mansour", 3, 30.146372169598383, 31.421179192021853),
    Station.withCoordinates(
        "El Haykestep", 3, 30.14396823599606, 31.404575148268314),
    Station.withCoordinates(
        "Omar Ibn El-Khattab", 3, 30.140368331060564, 31.39423255008058),
    Station.withCoordinates("Qobaa", 3, 30.13488508894196, 31.3837526712754),
    Station.withCoordinates(
        "Hesham Barakat", 3, 30.130846414814734, 31.372945960707547),
    Station.withCoordinates(
        "El-Nozha", 3, 30.127985836162438, 31.360164593827175),
    Station.withCoordinates(
        "Nadi El-Shams", 3, 30.125465090698878, 31.348926192773863),
    Station.withCoordinates(
        "Alf Maskan", 3, 30.11904607768164, 31.340186684856647),
    Station.withCoordinates(
        "Heliopolis Square", 3, 30.108413730947746, 31.338283579136842),
    Station.withCoordinates("Haroun", 3, 30.10137789648754, 31.332955060261323),
    Station.withCoordinates(
        "Al-Ahram", 3, 30.09172558994502, 31.326316943362475),
    Station.withCoordinates(
        "Koleyet El-Banat", 3, 30.084042044569536, 31.32901707758358),
    Station.withCoordinates(
        "Stadium", 3, 30.072910146730123, 31.31710969348421),
    Station.withCoordinates(
        "Fair Zone", 3, 30.07325199788208, 31.30505670373871),
    Station.withCoordinates(
        "Abbassia", 3, 30.07445559846205, 31.29503672972402),
    Station.withCoordinates(
        "Abdou Pasha", 3, 30.0738965872077, 31.28457915887145),
    Station.withCoordinates(
        "El Geish", 3, 30.073354943184047, 31.27509540673353),
    Station.withCoordinates(
        "Bab El Shaaria", 3, 30.073036182879436, 31.26335206166874),
    Station.withCoordinates(
        "Kit Kat", 3, 30.082529824365675, 31.227092969498086),
  ];

  @override
  Widget build(BuildContext context) {
    allStations.addAll(line1Stations);
    allStations.addAll(line2Stations);
    allStations.addAll(line3Stations);

    return Scaffold(
      appBar: AppBar(title: const Text('Metro Masr')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                width: double.infinity,
                menuHeight: 400,
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                hintText: 'please select start station',
                controller: startStationController,
                onSelected: (value) {},
                dropdownMenuEntries: allStations
                    .map((Station name) => DropdownMenuEntry(
                          value: name.name,
                          label: name.name,
                        ))
                    .toList(),
              ),
            ),
            InkWell(
              child: Icon(
                Icons.switch_left_rounded,
                color: Colors.blue,
                size: 48,
              ),
              onTap: () {
                print("The icon is clicked");
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                width: double.infinity,
                menuHeight: 400,
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                hintText: 'please select end station',
                controller: endStationController,
                onSelected: (value) {},
                dropdownMenuEntries: allStations
                    .map((Station name) => DropdownMenuEntry(
                          value: name.name,
                          label: name.name,
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: TextField(
                    controller: showController,
                    onChanged: (value) {
                      endStationController.text = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter destination',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("The icon is clicked");
                  },
                  child: Text('Show'),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                print("The icon is clicked");
              },
              child: Text('find'),
            ),
          ],
        ),
      ),
    );
  }
}
