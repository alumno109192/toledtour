import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

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
  late LatLng _destinoLatLng;
  late final WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setDestinoLatLng();
    _initializeWebViewController();
    _getUserLocation();
  }

  void _initializeWebViewController() {
    final lat = _destinoLatLng.latitude;
    final lng = _destinoLatLng.longitude;
    final directionsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (url) => setState(() => _isLoading = true),
          onPageFinished: (url) => setState(() => _isLoading = false),
        ))
        ..loadRequest(Uri.parse(directionsUrl));
    } else {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (url) => setState(() => _isLoading = true),
          onPageFinished: (url) => setState(() => _isLoading = false),
        ))
        ..loadRequest(Uri.parse(directionsUrl));
    }

    if (_webViewController.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (_webViewController.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
  }

  void _setDestinoLatLng() {
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
      _destinoLatLng = const LatLng(39.8628, -4.0273);
    }
  }

  Future<void> _getUserLocation() async {
    final hasPermission = await _location.requestPermission();
    if (hasPermission == PermissionStatus.granted) {
      final loc = await _location.getLocation();
      setState(() => _currentLocation = loc);
    }
  }

  void _openWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Ruta a ${widget.title}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Stack(
            children: [
              WebViewWidget(controller: _webViewController),
              if (_isLoading) const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
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
          ElevatedButton.icon(
            icon: const Icon(Icons.directions),
            label: const Text('Ver ruta en la app'),
            onPressed: _openWebView,
          ),
          const SizedBox(height: 16),
          const Text(
            'Usa el mapa interactivo para ver las indicaciones de navegación',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
