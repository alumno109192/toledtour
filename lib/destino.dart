import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DestinoPage extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final String address;
  final String schedule;
  final String price;
  final String extraInfo;

  const DestinoPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.address,
    required this.schedule,
    required this.price,
    required this.extraInfo,
  });

  @override
  State<DestinoPage> createState() => _DestinoPageState();
}

class _DestinoPageState extends State<DestinoPage> {
  LocationData? _currentLocation;
  final Location _location = Location();

  // Ejemplo: Coordenadas de la Mezquita del Cristo de la Luz
  // Puedes adaptar esto para cada destino si tienes las coordenadas.
  late LatLng _destinoLatLng;

  @override
  void initState() {
    super.initState();
    _setDestinoLatLng();
    _getUserLocation();
  }

  void _setDestinoLatLng() {
    // Puedes mejorar esto con un mapa de coordenadas por destino.
    if (widget.title == 'Mezquita del Cristo de la Luz') {
      _destinoLatLng = const LatLng(39.8622, -4.0246);
    } else if (widget.title == 'Museo de Santa Cruz') {
      _destinoLatLng = const LatLng(39.8587, -4.0226);
    } else if (widget.title == 'Sinagoga de Santa María la Blanca') {
      _destinoLatLng = const LatLng(39.8557, -4.0272);
    } else if (widget.title == 'Museo del Greco') {
      _destinoLatLng = const LatLng(39.8552, -4.0292);
    } else if (widget.title == 'Mezquita de las Tornerías') {
      _destinoLatLng = const LatLng(39.8595, -4.0229);
    } else if (widget.title == 'Museo Sefardí') {
      _destinoLatLng = const LatLng(39.8551, -4.0297);
    } else {
      // Coordenadas por defecto (Toledo centro)
      _destinoLatLng = const LatLng(39.8628, -4.0273);
    }
  }

  Future<void> _getUserLocation() async {
    final hasPermission = await _location.requestPermission();
    if (hasPermission == PermissionStatus.granted) {
      final loc = await _location.getLocation();
      setState(() {
        _currentLocation = loc;
      });
    }
  }

  Set<Marker> _buildMarkers() {
    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('destino'),
        position: _destinoLatLng,
        infoWindow: InfoWindow(title: widget.title),
      ),
    };
    if (_currentLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('usuario'),
          position: LatLng(
            _currentLocation!.latitude!,
            _currentLocation!.longitude!,
          ),
          infoWindow: const InfoWindow(title: 'Tu ubicación'),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
        ),
      );
    }
    return markers;
  }

  Set<Polyline> _buildPolylines() {
    if (_currentLocation == null) return {};
    return {
      Polyline(
        polylineId: const PolylineId('ruta'),
        color: Colors.blue,
        width: 5,
        points: [
          LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          _destinoLatLng,
        ],
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Icon(
            widget.icon,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(widget.description, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          Text(
            'Dirección: ${widget.address}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Horario: ${widget.schedule}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text('Precio: ${widget.price}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
          Text(widget.extraInfo, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          SizedBox(
            height: 350,
            child:
                _currentLocation == null
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          _currentLocation!.latitude!,
                          _currentLocation!.longitude!,
                        ),
                        zoom: 15,
                      ),
                      markers: _buildMarkers(),
                      polylines: _buildPolylines(),
                      onMapCreated: (controller) {},
                      myLocationButtonEnabled: true,
                    ),
          ),
          const SizedBox(height: 16),
          const Text(
            'En el mapa puedes ver tu ubicación, la ubicación del destino y la ruta más corta entre ambos puntos.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
