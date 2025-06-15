import 'package:flutter/material.dart';
import 'package:toledotour/l10n/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'icon_utils.dart';
import 'ad_banner_widget.dart';
import 'interstitial_ad_helper.dart';

class NaturalezaPage extends StatelessWidget {
  NaturalezaPage({super.key});
  final InterstitialAdHelper _adHelper = InterstitialAdHelper()..loadAd();

  @override
  Widget build(BuildContext context) {
    final rutas = [
      {
        'nombre': 'Ruta del Valle',
        'descripcionKey': 'ruta_valle_desc',
        'distancia': '5 km',
        'dificultad': 'Fácil',
        'icon': 'landscape',
        'reservaUrl': 'https://turismo.toledo.es/',
      },
      {
        'nombre': 'Ruta de las Barrancas de Burujón',
        'descripcionKey': 'ruta_barrancas_desc',
        'distancia': '6 km',
        'dificultad': 'Media',
        'icon': 'terrain',
        'reservaUrl': 'https://turismo.toledo.es/',
      },
      {
        'nombre': 'Ruta Senda Ecológica del Tajo',
        'descripcionKey': 'ruta_senda_ecologica_desc',
        'distancia': '8 km',
        'dificultad': 'Fácil',
        'icon': 'nature',
        'reservaUrl': 'https://turismo.toledo.es/',
      },
      {
        'nombre': 'Ruta de los Cigarrales',
        'descripcionKey': 'ruta_cigarrales_desc',
        'distancia': '7 km',
        'dificultad': 'Media',
        'icon': 'forest',
        'reservaUrl': 'https://turismo.toledo.es/',
      },
      {
        'nombre': 'Ruta de la Piedra del Rey Moro',
        'descripcionKey': 'ruta_piedra_rey_moro_desc',
        'distancia': '4 km',
        'dificultad': 'Fácil',
        'icon': 'hiking',
        'reservaUrl': 'https://turismo.toledo.es/',
      },
      {
        'nombre': 'Ruta Montes de Toledo',
        'descripcionKey': 'ruta_montes_toledo_desc',
        'distancia': '12 km',
        'dificultad': 'Alta',
        'icon': 'directions_walk',
        'reservaUrl': 'https://turismo.toledo.es/',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(tr(context, 'nature')),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (var ruta in rutas)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  getIconData(ruta['icon'] as String),
                  size: 36,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  ruta['nombre'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tr(context, ruta['descripcionKey'] as String)}\nDistancia: ${ruta['distancia']} | Dificultad: ${ruta['dificultad']}',
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        final url = ruta['reservaUrl'] as String;
                        if (url.isNotEmpty) {
                          _abrirEnlace(context, url);
                        }
                      },
                      child: Text(
                        tr(context, 'reserva'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                isThreeLine: true,
              ),
            ),
        ],
      ),
      bottomNavigationBar: const AdBannerWidget(),
    );
  }

  void _abrirEnlace(BuildContext context, String url) {
    _adHelper.showAd(onAdClosed: () async {
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
