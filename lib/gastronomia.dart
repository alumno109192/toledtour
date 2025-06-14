import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GastronomiaPage extends StatelessWidget {
  const GastronomiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantes = [
      {
        'nombre': 'Restaurante Adolfo',
        'descripcion': 'Cocina tradicional toledana con toques modernos.',
        'direccion': 'Calle Hombre de Palo, 7, 45001 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'La Orza',
        'descripcion':
            'Restaurante acogedor con cocina castellana y carta de vinos.',
        'direccion': 'Calle Descalzos, 5, 45002 Toledo',
        'icon': Icons.restaurant_menu,
      },
      {
        'nombre': 'Restaurante Alfileritos 24',
        'descripcion': 'Cocina de autor en un edificio histórico.',
        'direccion': 'Calle Alfileritos, 24, 45003 Toledo',
        'icon': Icons.dining,
      },
      {
        'nombre': 'Restaurante Venta de Aires',
        'descripcion': 'El restaurante más antiguo de Castilla-La Mancha.',
        'direccion': 'Calle de Toledo, 31, 45005 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'Restaurante La Ermita',
        'descripcion': 'Cocina tradicional con vistas panorámicas.',
        'direccion': 'Carretera de la Ermita, s/n, 45004 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'Restaurante La Clandestina de las Tendillas',
        'descripcion': 'Cocina creativa y ambiente moderno.',
        'direccion': 'Calle Tendillas, 3, 45002 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'Restaurante Locum',
        'descripcion': 'Cocina de autor en casa histórica.',
        'direccion': 'Calle Locum, 6, 45001 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'Restaurante La Fábrica de Harinas',
        'descripcion': 'Cocina mediterránea en hotel boutique.',
        'direccion': 'Calle Real del Arrabal, 1, 45003 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'Restaurante El Albero',
        'descripcion': 'Cocina manchega y carnes a la brasa.',
        'direccion': 'Calle Ronda Buenavista, 27, 45005 Toledo',
        'icon': Icons.restaurant,
      },
      {
        'nombre': 'Restaurante La Cave',
        'descripcion': 'Cocina internacional y tapas.',
        'direccion': 'Callejón de los Gatos, 1, 45001 Toledo',
        'icon': Icons.restaurant,
      },
    ];

    final bares = [
      {
        'nombre': 'La Abadía',
        'descripcion':
            'Taberna típica con platos manchegos y cervezas artesanas.',
        'direccion': 'Plaza de San Nicolás, 3, 45001 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Taberna El Botero',
        'descripcion': 'Tapas creativas y cócteles en un ambiente moderno.',
        'direccion': 'Calle de la Ciudad, 5, 45002 Toledo',
        'icon': Icons.local_drink,
      },
      {
        'nombre': 'Cervecería El Trébol',
        'descripcion': 'Famosa por sus carcamusas y cervezas propias.',
        'direccion': 'Calle de Santa Fe, 1, 45001 Toledo',
        'icon': Icons.sports_bar,
      },
      {
        'nombre': 'La Malquerida',
        'descripcion': 'Bar de tapas y raciones en el casco histórico.',
        'direccion': 'Calle Santa Leocadia, 6, 45002 Toledo',
        'icon': Icons.fastfood,
      },
      {
        'nombre': 'Bar Ludeña',
        'descripcion': 'Tradicional, famoso por sus carcamusas.',
        'direccion': 'Plaza de la Magdalena, 10, 45001 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Bar Skala',
        'descripcion': 'Tapas y ambiente local.',
        'direccion': 'Calle de la Sillería, 13, 45001 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Bar El Pez',
        'descripcion': 'Tapas y copas en ambiente alternativo.',
        'direccion': 'Callejón de Menores, 6, 45001 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Bar El Foro',
        'descripcion': 'Tapas variadas y terraza.',
        'direccion': 'Calle Cardenal Cisneros, 12, 45001 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Bar El Rincón de Juan',
        'descripcion': 'Tapas y vinos.',
        'direccion': 'Calle de la Merced, 6, 45002 Toledo',
        'icon': Icons.local_bar,
      },
      {
        'nombre': 'Bar La Tabernita',
        'descripcion': 'Tapas y ambiente acogedor.',
        'direccion': 'Calle de la Plata, 8, 45001 Toledo',
        'icon': Icons.local_bar,
      },
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bares y Restaurantes de Toledo'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Restaurantes', icon: Icon(Icons.restaurant)),
              Tab(text: 'Bares', icon: Icon(Icons.local_bar)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(restaurantes, context),
            _buildList(bares, context),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Map<String, Object>> lugares, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lugares.length,
      itemBuilder: (context, index) {
        final lugar = lugares[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 3,
          child: ListTile(
            leading: Icon(
              lugar['icon'] as IconData,
              size: 36,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              lugar['nombre'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${lugar['descripcion']}\n${lugar['direccion']}'),
            isThreeLine: true,
            onTap: () => _showLugarDialog(context, lugar),
          ),
        );
      },
    );
  }

  void _showLugarDialog(BuildContext context, Map<String, Object> lugar) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(lugar['nombre'] as String),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lugar['descripcion'] as String),
              const SizedBox(height: 8),
              Text(lugar['direccion'] as String),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.directions),
                label: const Text('Cómo llegar'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await _navigateToLugar(context, lugar['direccion'] as String);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _navigateToLugar(
      BuildContext context, String destinoDireccion) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showErrorDialog(
            context,
            'Permiso de ubicación denegado',
            'Para usar la navegación necesitas conceder el permiso de ubicación en los ajustes del dispositivo.',
          );
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        _showErrorDialog(
          context,
          'Permiso de ubicación denegado permanentemente',
          'Debes habilitar el permiso de ubicación desde los ajustes del dispositivo para usar esta función.',
        );
        return;
      }
      Position position = await Geolocator.getCurrentPosition();
      final origen = "${position.latitude},${position.longitude}";
      final destino = Uri.encodeComponent(destinoDireccion);
      final url =
          "https://www.google.com/maps/dir/?api=1&origin=$origen&destination=$destino&travelmode=driving";
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      _showErrorDialog(
        context,
        'Error de localización',
        'No se pudo obtener tu ubicación actual. Intenta de nuevo o revisa los permisos.',
      );
    }
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    // Usar navigatorKey global si es necesario, aquí se asume contexto disponible
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
