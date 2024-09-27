import 'package:newmetro/metro_line.dart';

class Station {
  String name;
  final int line;
  final double latitude;
  final double longitude;

  Station({
    required this.name,
    required this.line,
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  // Named constructors for different initialization cases
  Station.basic(String name, int line) : this(name: name, line: line);

  Station.withCoordinates(
      String name, int line, double latitude, double longitude)
      : this(name: name, line: line, latitude: latitude, longitude: longitude);

  // Method to check if the station is a transition station

  // Method to get the line (can be replaced by your logic to get MetroLine)
  MetroLine? getLine() {
    return MetroLine.getLine(line);
  }

  @override
  String toString() {
    return name;
  }
}
