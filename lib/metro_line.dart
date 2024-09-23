import 'package:newmetro/station.dart';

class MetroLine {
  static final Map<int, MetroLine> allLines = {};
  static const int timePerStation = 2; // in minutes
  static List<Station> stations = [];
  static int lines = 0;
  final int lineNumber;

  MetroLine(List<Station> stations, this.lineNumber) {
    MetroLine.stations = stations;
    lines++;
    allLines[lineNumber] = this;
  }

  static MetroLine? getLine(int lineNumber) {
    return allLines[lineNumber];
  }

  static int calculateTime(List<String>? route) {
    if (route == null) return -1;
    return (route.length - 1) * timePerStation;
  }

  static int calculateTicketPrice(List<String>? route) {
    if (route == null) return -1;

    int numberOfStations = route.length - 1;
    if (route.length == 1) {
      return 0;
    } else if (numberOfStations <= 9) {
      return 8;
    } else if (numberOfStations <= 16) {
      return 10;
    } else if (numberOfStations <= 23) {
      return 15;
    } else if (numberOfStations <= 39) {
      return 20;
    } else {
      return 25;
    }
  }

  static Station? findStationByName(
      List<Station> stations, String stationName) {
    for (var station in stations) {
      if (station.name.toLowerCase() == stationName.toLowerCase()) {
        return station;
      }
    }
    return null;
  }

  int getLineNumber() {
    return lineNumber;
  }

  List<Station> getStations() {
    return stations;
  }

  int getTimePerStation() {
    return timePerStation;
  }

  List<Station>? getRoute(Station start, Station destination) {
    int startIndex = stations.indexOf(start);
    int destinationIndex = stations.indexOf(destination);

    if (startIndex == -1 || destinationIndex == -1) {
      return null;
    }

    List<Station> route;
    if (startIndex <= destinationIndex) {
      route = stations.sublist(startIndex, destinationIndex + 1);
    } else {
      route =
          stations.sublist(destinationIndex, startIndex + 1).reversed.toList();
    }
    return route;
  }

  @override
  String toString() {
    return lineNumber.toString();
  }
}
