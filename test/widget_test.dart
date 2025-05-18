import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toledotour/main.dart';
import 'package:toledotour/turismo_cultural.dart';

void main() {
  testWidgets('Verificar navegación entre opciones de turismo',
      (WidgetTester tester) async {
    // Construye la app
    await tester.pumpWidget(const MyApp());

    // Verifica que la AppBar tenga el título correcto
    expect(find.text('Opciones de Turismo en Toledo'), findsOneWidget);

    // Verifica que se muestren las 4 tarjetas de opciones
    expect(find.byType(Card), findsNWidgets(4));

    // Verifica los títulos de las tarjetas
    expect(find.text('Turismo Cultural'), findsOneWidget);
    expect(find.text('Turismo Gastronómico'), findsOneWidget);
    expect(find.text('Turismo de Naturaleza'), findsOneWidget);
    expect(find.text('Turismo Nocturno'), findsOneWidget);

    // Simula un tap en la tarjeta de Turismo Cultural
    await tester.tap(find.text('Turismo Cultural'));
    await tester.pumpAndSettle(); // Espera a que complete la navegación

    // Verifica que se haya navegado a la página correcta
    expect(find.byType(CulturalTourismPage), findsOneWidget);
  });
}
