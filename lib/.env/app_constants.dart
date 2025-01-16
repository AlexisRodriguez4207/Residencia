import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class AppConstants {
  static const String mapbox_access_token =
      'pk.eyJ1IjoieGVybzQyMDciLCJhIjoiY201eGR1dzYxMDg3ODJrcHltNjJ1M2ZxbiJ9.mB-OU397U41SuQqHsLGsQw';

  static const String urlTemplate =
      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=$mapbox_access_token';

  static const String mapBoxStyleDarkId = 'mapbox/dark-v11';
  static const String mapBoxStyleOutdoorId = 'mapbox/outdoor-v12';
  static const String mapBoxStyleStreetId = 'mapbox/streets-v12';
  static const String mapBoxStyleNightId = 'mapbox/navigation-night-v1';

  static const myLocation = LatLng(32.52911316957457, -116.99172383034119);
}

// const mapbox_access_token =
//     'pk.eyJ1IjoicGl0bWFjIiwiYSI6ImNsY3BpeWxuczJhOTEzbnBlaW5vcnNwNzMifQ.ncTzM4bW-jpq-hUFutnR1g';

// final myPosition = LatLng(32.52996, -116.98650);
