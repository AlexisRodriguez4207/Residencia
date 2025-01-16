import 'package:latlong2/latlong.dart';

class MarkerData {
  final LatLng myPosition;
  final String title;
  final String description;

  MarkerData(
      {required this.myPosition,
      required this.title,
      required this.description});
}
