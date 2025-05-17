import 'package:flutter/material.dart';
import 'destino.dart';

class CulturalTourismPage extends StatelessWidget {
  const CulturalTourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    final culturalSites = [
      {
        'name': 'Mezquita del Cristo de la Luz',
        'description': 'Una de las mezquitas mejor conservadas de la ciudad.',
        'icon': Icons.account_balance,
        'address': 'Calle Cristo de la Luz, 22, 45003 Toledo',
        'schedule': '10:00 - 18:00',
        'price': '3€ (consultar descuentos y horarios actualizados)',
        'extraInfo':
            'Declarada Bien de Interés Cultural\nVisitas guiadas disponibles\nCercana a la Puerta del Sol',
      },
      {
        'name': 'Museo de Santa Cruz',
        'description': 'Museo con arte y arqueología de Toledo.',
        'icon': Icons.museum,
        'address': 'Calle Miguel de Cervantes, 3, 45001 Toledo',
        'schedule':
            'Martes a sábado: 10:00 - 18:30\nDomingos y festivos: 9:00 - 15:00',
        'price': 'Entrada general: 5€',
        'extraInfo': 'Museo ubicado en un antiguo hospital renacentista.',
      },
      {
        'name': 'Sinagoga de Santa María la Blanca',
        'description': 'Antigua sinagoga convertida en iglesia.',
        'icon': Icons.account_balance_wallet,
        'address': 'Calle de los Reyes Católicos, 4, 45002 Toledo',
        'schedule': '10:00 - 18:45',
        'price': '3€',
        'extraInfo': 'Ejemplo de arquitectura mudéjar.',
      },
      {
        'name': 'Museo del Greco',
        'description': 'Museo dedicado al pintor El Greco.',
        'icon': Icons.brush,
        'address': 'Paseo del Tránsito, s/n, 45002 Toledo',
        'schedule':
            'Martes a sábado: 9:30 - 18:30\nDomingos y festivos: 10:00 - 15:00',
        'price': '3€',
        'extraInfo': 'Colección de obras y objetos del pintor.',
      },
      {
        'name': 'Mezquita de las Tornerías',
        'description': 'Pequeña mezquita del siglo XI.',
        'icon': Icons.account_balance,
        'address': 'Calle Tornerías, 10, 45001 Toledo',
        'schedule': 'Consultar horarios',
        'price': 'Consultar',
        'extraInfo': 'Ejemplo de arquitectura islámica en Toledo.',
      },
      {
        'name': 'Museo Sefardí',
        'description': 'Museo sobre la historia judía en Toledo.',
        'icon': Icons.history_edu,
        'address': 'Calle Samuel Levi, s/n, 45002 Toledo',
        'schedule':
            'Martes a sábado: 9:30 - 18:30\nDomingos y festivos: 10:00 - 15:00',
        'price': '3€',
        'extraInfo': 'Ubicado en la Sinagoga del Tránsito.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Turismo Cultural: Mezquitas y Museos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: culturalSites.length,
        itemBuilder: (context, index) {
          final site = culturalSites[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                site['icon'] as IconData,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                site['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(site['description'] as String),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DestinoPage(
                          title: site['name'] as String,
                          description: site['description'] as String,
                          icon: site['icon'] as IconData,
                          address: site['address'] as String,
                          schedule: site['schedule'] as String,
                          price: site['price'] as String,
                          extraInfo: site['extraInfo'] as String,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
