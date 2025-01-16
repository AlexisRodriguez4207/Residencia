import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:residencia_v2/.env/app_constants.dart';
import 'package:residencia_v2/Screen/Modules/MapsData/marker_data.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  List<MarkerData> _markerData = [];
  List<Marker> _markers = [];

  LatLng? _selectedPosition;
  LatLng? _myLocation;
  LatLng? _draggedPosition;
  bool _isDragging = false;
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResult = [];
  bool _isSearching = false;

  //Obtener Ubicación Actual
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Los Servicios de Ubicación estan Desabilitados");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
            "Los Permisos de Ubicación estan fueron Rechazados");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Los Permisos de Ubicación estan fueron Rechazados Permanentemente");
    }

    return await Geolocator.getCurrentPosition();
  }

  // Mostrar la Ubicación Actual
  void _showCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      LatLng currentLatLng = LatLng(position.latitude, position.latitude);
      _mapController.move(currentLatLng, 15.0);

      setState(() {
        _myLocation = currentLatLng;
      });
    } catch (e) {
      print(e);
    }
  }

  //Agregar Marcadores donde nosotros queremos
  void _addMarker(LatLng position, String title, String description) {
    setState(() {
      final markerData = MarkerData(
          myPosition: position, title: title, description: description);
      _markerData.add(markerData);
      _markers.add(Marker(
        point: position,
        width: 80,
        height: 80,
        child: GestureDetector(
          onTap: () => _showMarkerInfo(markerData),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.location_on,
                color: Colors.redAccent,
                size: 40,
              )
            ],
          ),
        ),
      ));
    });
  }

  // Mostrar marcador Dialog
  void _showMarkerDialog(BuildContext context, LatLng position) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Agregar Marcador'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: 'Titulo'),
                  ),
                  TextField(
                    controller: descController,
                    decoration: InputDecoration(labelText: 'Descripción'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _addMarker(
                        position, titleController.text, descController.text);
                    Navigator.pop(context);
                  },
                  child: Text('Guardar'),
                )
              ],
            ));
  }

  // mostrar Información del marcador
  void _showMarkerInfo(MarkerData markerData) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          markerData.title,
          style: TextStyle(color: colors.primary),
        ),
        content: Text(
          markerData.description,
          style: TextStyle(color: colors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
    );
  }

  // Mostrar Información de Lugares
  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResult = [];
      });
      return;
    }

    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5';

    final response = await http.get(Uri.parse(url));

    final data = json.decode(response.body);

    if (data.isNotEmpty) {
      setState(() {
        _searchResult = data;
      });
    } else {
      setState(() {
        _searchResult = data;
      });
    }
  }

  // Seleccionar una Ubicación especifica
  void _moveToLocation(double lat, double lon) {
    LatLng location = LatLng(lat, lon);
    _mapController.move(location, 15.0);
    setState(() {
      _selectedPosition = location;
      _searchResult = [];
      // _isSearching = false;
      _searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _searchPlaces(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Mapa',
          style: TextStyle(color: colors.primary),
        ),
      ),
      body: Stack(children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            // initialCenter: AppConstants.myLocation,
            minZoom: 5,
            maxZoom: 18,
            initialZoom: 13,
            onTap: (tapPosition, latlng) {
              setState(() {
                _selectedPosition = latlng;
                _draggedPosition = _selectedPosition;
              });
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              fallbackUrl: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

              // urlTemplate: AppConstants.urlTemplate,
              // fallbackUrl: AppConstants.urlTemplate,
              additionalOptions: const {
                'id': AppConstants.mapBoxStyleOutdoorId,
              },
            ),
            MarkerLayer(markers: _markers),
            if (_isDragging && _draggedPosition != null)
              MarkerLayer(markers: [
                Marker(
                  point: _draggedPosition!,
                  width: 80,
                  height: 80,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.indigo,
                    size: 40,
                  ),
                )
              ]),
            if (_myLocation != null)
              MarkerLayer(markers: [
                Marker(
                  point: _myLocation!,
                  width: 80,
                  height: 80,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.green,
                    size: 40,
                  ),
                )
              ])
          ],
        ),
        // Buscar un widget
        Positioned(
          top: 40,
          left: 15,
          right: 15,
          child: Column(
            children: [
              SizedBox(
                height: 55,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: "Busca un lugar",
                      filled: true,
                      fillColor: colors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _isSearching
                          ? IconButton(
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _isSearching = false;
                                  _searchResult = [];
                                });
                              },
                              icon: Icon(Icons.clear))
                          : null),
                  onTap: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
              ),
              if (_isSearching && _searchResult.isNotEmpty)
                Container(
                  color: colors.surface,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchResult.length,
                    itemBuilder: (context, index) {
                      final place = _searchResult[index];
                      return ListTile(
                        title: Text(
                          place['display_name'],
                        ),
                        onTap: () {
                          final lat = double.parse(place['lat']);
                          final lon = double.parse(place['lon']);

                          _moveToLocation(lat, lon);
                        },
                      );
                    },
                  ),
                )
            ],
          ),
        ),
        //Boton para agregar ubicación
        _isDragging == false
            ? Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isDragging = true;
                    });
                  },
                  child: Icon(Icons.add_location),
                ),
              )
            : Positioned(
                bottom: 20,
                left: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isDragging = false;
                    });
                  },
                  child: Icon(Icons.wrong_location),
                ),
              ),
        Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.indigo,
                  onPressed: _showCurrentLocation,
                  child: Icon(Icons.location_searching_rounded),
                ),
                if (_isDragging)
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FloatingActionButton(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      onPressed: () {
                        if (_draggedPosition != null) {
                          _showMarkerDialog(context, _draggedPosition!);
                        }
                        setState(() {
                          _isDragging = false;
                          _draggedPosition = null;
                        });
                      },
                      child: Icon(Icons.check),
                    ),
                  ),
              ],
            ))
      ]),
    );
  }
}
