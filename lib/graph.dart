import 'package:flutter/material.dart';

class MetroGraph {
  // Define metro lines as Dart Lists
  static const List<String> firstLine = [
    "Helwan", "Ain Helwan", "Helwan University", "Wadi Hof", "Hadayek Helwan", 
    "El-Maasara", "Tora El-Asmant", "Kozzika", "Tora El-Balad", "Sakanat El-Maadi", 
    "Maadi", "Hadayek El-Maadi", "Dar El-Salam", "El-Zahraa'", "Mar Girgis", 
    "El-Malek El-Saleh", "Al-Sayeda Zeinab", "Saad Zaghloul", "Sadat", "Nasser",
    "Orabi", "Al-Shohadaa", "Ghamra", "El-Demerdash", "Manshiet El-Sadr", 
    "Kobri El-Qobba", "Hammamat El-Qobba", "Saray El-Qobba", "Hadayeq El-Zaitoun", 
    "Helmeyet El-Zaitoun", "El-Matareyya", "Ain Shams", "Ezbet El-Nakhl", 
    "El-Marg", "New El-Marg"
  ];

  static const List<String> secondLine = [
    "El-Mounib", "Sakiat Mekky", "Omm El-Masryeen", "El Giza", "Faisal", 
    "Cairo University", "El Bohoth", "Dokki", "Opera", "Sadat", "Mohamed Naguib", 
    "Attaba", "Al-Shohadaa", "Masarra", "Road El-Farag", "St. Teresa", 
    "Khalafawy", "Mezallat", "Kolleyyet El-Zeraa", "Shubra El-Kheima"
  ];

  static const List<String> thirdLine = [
    "Adly Mansour", "El Haykestep", "Omar Ibn El-Khattab", "Qobaa", "Hesham Barakat", 
    "El-Nozha", "Nadi El-Shams", "Alf Maskan", "Heliopolis Square", "Haroun", 
    "Al-Ahram", "Koleyet El-Banat", "Stadium", "Fair Zone", "Abbassia", 
    "Abdou Pasha", "El Geish", "Bab El Shaaria", "Attaba", "Nasser", "Maspero", 
    "Safaa Hegazy", "Kit Kat"
  ];

  static const List<String> eltafreaa1 = [
    "Kit Kat", "Sudan Street", "Imbaba", "El-Bohy", "El-Qawmia", "Ring Road", 
    "Rod El-Farag Axis"
  ];

  static const List<String> eltafreaa2 = [
    "Kit Kat", "Tawfikeya", "Wadi El-Nil", "Gamaet El Dowal", "Bulaq El Dakrour", 
    "Cairo University"
  ];

  static const List<String> transationStations = [
    "Sadat", "Al-Shohadaa", "Nasser", "Attaba", "Cairo University"
  ];

  // Map of metro stations and their connections
  final Map<String, List<String>> metroMap = {};
  List<List<String>>allRoutes=[];

  MetroGraph() {
    _addLine(firstLine);
    _addLine(secondLine);
    _addLine(thirdLine);
    _addLine(eltafreaa1);
    _addLine(eltafreaa2);

    _connectStations("Sadat", "Sadat");
    _connectStations("Al-Shohadaa", "Al-Shohadaa");
    _connectStations("Nasser", "Nasser");
    _connectStations("Attaba", "Attaba");
    _connectStations("Cairo University", "Cairo University");
  }
  List<String> getLineList(String line) {
  switch (line) {
    case "Line 1":
      return MetroGraph.firstLine;
    case "Line 2":
      return MetroGraph.secondLine;
    case "Line 3":
      return MetroGraph.thirdLine;
    case "Eltafreaa 1":
      return MetroGraph.eltafreaa1;
    case "Eltafreaa 2":
      return MetroGraph.eltafreaa2;
    default:
      return [];
  }
}

  void _addLine(List<String> line) {
    for (int i = 0; i < line.length - 1; i++) {
      String station1 = line[i];
      String station2 = line[i + 1];
      _addEdge(station1, station2);
      _addEdge(station2, station1);
    }
  }

  void _addEdge(String station1, String station2) {
    if (!metroMap.containsKey(station1)) {
      metroMap[station1] = [];
    }
    metroMap[station1]!.add(station2);
  }

  void _connectStations(String station1, String station2) {
    _addEdge(station1, station2);
    _addEdge(station2, station1);
  }

  // Method to find all routes (DFS algorithm)
  List<String> findAllRoutes(String start, String end) {
  List<List<String>> routes = [];

  // Use DFS to find all possible routes
  _findRoutesDFS(start, end, <String>{}, [], routes);

  allRoutes = List.from(routes);

  // Sort routes by number of stations
  allRoutes.sort((a, b) => a.length.compareTo(b.length));

  // Generate detailed direction messages
  List<String> directionMessages = [];
  for (List<String> route in allRoutes) {
    directionMessages.add(getDirectionMessage(start, end, route));
  }

  return directionMessages;
}


  void _findRoutesDFS(
      String current, String end, Set<String> visited, List<String> path, List<List<String>> routes) {
    visited.add(current);
    path.add(current);

    if (current == end) {
      routes.add(List.from(path));
    } else {
      for (String neighbor in metroMap[current] ?? []) {
        if (!visited.contains(neighbor)) {
          _findRoutesDFS(neighbor, end, visited, path, routes);
        }
      }
    }
    path.removeLast();
    visited.remove(current);
  }
  String getLine(String station, String previousLine, String nextStation) {
  if (station == "Cairo University" && eltafreaa2.contains(nextStation)) {
    return "Eltafreaa 2";
  }
  if (firstLine.contains(station) && secondLine.contains(station)) {
    if (firstLine.contains(nextStation)) {
      return "Line 1";
    } else if (secondLine.contains(nextStation)) {
      return "Line 2";
    }
  }
  if (secondLine.contains(station) && thirdLine.contains(station)) {
    if (secondLine.contains(nextStation)) {
      return "Line 2";
    } else if (thirdLine.contains(nextStation)) {
      return "Line 3";
    }
  }
  if (firstLine.contains(station) && thirdLine.contains(station)) {
    if (firstLine.contains(nextStation)) {
      return "Line 1";
    } else if (thirdLine.contains(nextStation)) {
      return "Line 3";
    }
  }
  if (thirdLine.contains(station) && eltafreaa1.contains(station)) {
    if (thirdLine.contains(nextStation)) {
      return "Line 3";
    } else if (eltafreaa1.contains(nextStation)) {
      return "Eltafreaa 1";
    }
  }
  if (thirdLine.contains(station) && eltafreaa2.contains(station)) {
    if (thirdLine.contains(nextStation)) {
      return "Line 3";
    } else if (eltafreaa2.contains(nextStation)) {
      return "Eltafreaa 2";
    }
  }
  if (firstLine.contains(station)) return "Line 1";
  if (secondLine.contains(station)) return "Line 2";
  if (thirdLine.contains(station)) return "Line 3";
  if (eltafreaa1.contains(station)) return "Eltafreaa 1";
  if (eltafreaa2.contains(station)) return "Eltafreaa 2";
  return "Unknown Line";
}

String getDirectionMessage(String start, String end, List<String> route) {
  StringBuffer directionMessage = StringBuffer();
  directionMessage.write("Start at $start.\n");

  String previousLine = getLine(route[0], "", route[1]);
  String previousDirection = getDirection(previousLine, route[0], route[1]);
  directionMessage.write("Take $previousLine $previousDirection.\n");

  for (int i = 1; i < route.length; i++) {
    String currentStation = route[i];
    String nextStation = (i + 1 < route.length) ? route[i + 1] : end;
    String currentLine = getLine(currentStation, previousLine, nextStation);

    if (currentLine != previousLine && currentStation != end) {
      directionMessage.write("Change to $currentLine at $currentStation.\n");
      String currentDirection = getDirection(currentLine, currentStation, nextStation);
      directionMessage.write("Take $currentLine $currentDirection.\n");
      previousLine = currentLine;
    }
  }

  directionMessage.write("Arrive at $end.");
  return directionMessage.toString();
}
String getDirection(String line, String startStation, String endStation) {
  List<String> lineList = getLineList(line);
  if (lineList.isEmpty) return "";
  int startIndex = lineList.indexOf(startStation);
  int endIndex = lineList.indexOf(endStation);
  if (startIndex == -1 || endIndex == -1) return "";

  if (line == "Line 1") {
    if (endIndex > startIndex) {
      return "towards New El-Marg";
    } else if (endIndex < startIndex) {
      return "towards Helwan";
    }
  } else if (line == "Line 2") {
    if (endIndex > startIndex) {
      return "towards Shubra El-Kheima";
    } else if (endIndex < startIndex) {
      return "towards Elmounib";
    }
  } else if (line == "Line 3") {
    if (endIndex > startIndex) {
      return "towards Kit Kat";
    } else if (endIndex < startIndex) {
      return "towards Adly Mansour";
    }
  } else if (line == "Eltafreaa 1") {
    if (endIndex > startIndex) {
      return "towards Kit Kat";
    } else if (endIndex < startIndex) {
      return "towards Rod El-Farag Axis";
    }
  } else if (line == "Eltafreaa 2") {
    if (endIndex > startIndex) {
      return "towards Cairo University";
    } else if (endIndex < startIndex) {
      return "towards Kit Kat";
    }
  }

  return "";
}


}
