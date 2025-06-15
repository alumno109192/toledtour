import 'package:toledotour/l10n/strings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:toledotour/main.dart';
import 'icon_utils.dart';
import 'ad_banner_widget.dart';
import 'interstitial_ad_helper.dart';

class GastronomiaPage extends StatelessWidget {
  GastronomiaPage({super.key});
  final InterstitialAdHelper _adHelper = InterstitialAdHelper()..loadAd();

  @override
  Widget build(BuildContext context) {
    final restaurantes = [
      {
        'nombre': 'Restaurante Adolfo',
        'descripcionKey': 'rest_adolfo_desc',
        'direccion': 'Calle Hombre de Palo, 7, 45001 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'La Orza',
        'descripcionKey': 'rest_laorza_desc',
        'direccion': 'Calle Descalzos, 5, 45002 Toledo',
        'icon': 'restaurant_menu',
      },
      {
        'nombre': 'Restaurante Alfileritos 24',
        'descripcionKey': 'rest_alfileritos_desc',
        'direccion': 'Calle Alfileritos, 24, 45003 Toledo',
        'icon': 'dining',
      },
      {
        'nombre': 'Restaurante Venta de Aires',
        'descripcionKey': 'rest_ventaaires_desc',
        'direccion': 'Calle de Toledo, 31, 45005 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'Restaurante La Ermita',
        'descripcionKey': 'rest_ermita_desc',
        'direccion': 'Carretera de la Ermita, s/n, 45004 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'Restaurante La Clandestina de las Tendillas',
        'descripcionKey': 'rest_clandestina_desc',
        'direccion': 'Calle Tendillas, 3, 45002 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'Restaurante Locum',
        'descripcionKey': 'rest_locum_desc',
        'direccion': 'Calle Locum, 6, 45001 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'Restaurante La Fábrica de Harinas',
        'descripcionKey': 'rest_fabrica_desc',
        'direccion': 'Calle Real del Arrabal, 1, 45003 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'Restaurante El Albero',
        'descripcionKey': 'rest_albero_desc',
        'direccion': 'Calle Ronda Buenavista, 27, 45005 Toledo',
        'icon': 'restaurant',
      },
      {
        'nombre': 'Restaurante La Cave',
        'descripcionKey': 'rest_cave_desc',
        'direccion': 'Callejón de los Gatos, 1, 45001 Toledo',
        'icon': 'restaurant',
      },
    ];

    final bares = [
      {
        'nombre': 'La Abadía',
        'descripcionKey': 'bar_abadia_desc',
        'direccion': 'Plaza de San Nicolás, 3, 45001 Toledo',
        'icon': 'local_bar',
      },
      {
        'nombre': 'Taberna El Botero',
        'descripcionKey': 'bar_botero_desc',
        'direccion': 'Calle de la Ciudad, 5, 45002 Toledo',
        'icon': 'local_drink',
      },
      {
        'nombre': 'Cervecería El Trébol',
        'descripcionKey': 'bar_trebol_desc',
        'direccion': 'Calle de Santa Fe, 1, 45001 Toledo',
        'icon': 'sports_bar',
      },
      {
        'nombre': 'La Malquerida',
        'descripcionKey': 'bar_malquerida_desc',
        'direccion': 'Calle Santa Leocadia, 6, 45002 Toledo',
        'icon': 'fastfood',
      },
      {
        'nombre': 'Bar Ludeña',
        'descripcionKey': 'bar_ludena_desc',
        'direccion': 'Plaza de la Magdalena, 10, 45001 Toledo',
        'icon': 'local_bar',
      },
      {
        'nombre': 'Bar Skala',
        'descripcionKey': 'bar_skala_desc',
        'direccion': 'Calle de la Sillería, 13, 45001 Toledo',
        'icon': 'local_bar',
      },
      {
        'nombre': 'Bar El Pez',
        'descripcionKey': 'bar_elpez_desc',
        'direccion': 'Callejón de Menores, 6, 45001 Toledo',
        'icon': 'local_bar',
      },
      {
        'nombre': 'Bar El Foro',
        'descripcionKey': 'bar_elforo_desc',
        'direccion': 'Calle Cardenal Cisneros, 12, 45001 Toledo',
        'icon': 'local_bar',
      },
      {
        'nombre': 'Bar El Rincón de Juan',
        'descripcionKey': 'bar_rinconjuan_desc',
        'direccion': 'Calle de la Merced, 6, 45002 Toledo',
        'icon': 'local_bar',
      },
      {
        'nombre': 'Bar La Tabernita',
        'descripcionKey': 'bar_tabernita_desc',
        'direccion': 'Calle de la Plata, 8, 45001 Toledo',
        'icon': 'local_bar',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, 'gastronomy')),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildList(restaurantes, context),
          _buildList(bares, context),
        ],
      ),
      bottomNavigationBar: const AdBannerWidget(),
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
              getIconData(lugar['icon'] as String),
              size: 36,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              lugar['nombre'] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                '${tr(context, lugar['descripcionKey'] as String)}\n${lugar['direccion'] as String}'),
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
          title: Row(
            children: [
              Icon(getIconData(lugar['icon'] as String),
                  color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(lugar['nombre'] as String),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr(context, lugar['descripcionKey'] as String)),
              const SizedBox(height: 8),
              Text(lugar['direccion'] as String),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.directions),
                label: Text(tr(context, 'how_to_get')),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await _navigateToLugar(lugar['direccion'] as String, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _navigateToLugar(String destinoDireccion,
      [BuildContext? context]) async {
    final ctx = context ?? navigatorKey.currentContext!;
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
            tr(ctx, 'permission_denied'),
            tr(ctx, 'location_needed'),
            ctx,
          );
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        _showErrorDialog(
          tr(ctx, 'permission_denied'),
          tr(ctx, 'permission_denied_permanently'),
          ctx,
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
        tr(ctx, 'navigation_error'),
        tr(ctx, 'error'),
        ctx,
      );
    }
  }

  void _showErrorDialog(String title, String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(tr(context, 'close')),
          ),
        ],
      ),
    );
  }

  void _abrirGoogleMaps(BuildContext context, String direccion) {
    _adHelper.showAd(onAdClosed: () async {
      final url = Uri.encodeFull(
          'https://www.google.com/maps/search/?api=1&query=$direccion');
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(tr(context, 'error_opening_maps'))),
        );
      }
    });
  }
}
