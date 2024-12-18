import 'package:dot_decoder/dot_decoder.dart';
import 'package:dot_decoder/plant_codes.dart';



import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Bindings initialisieren
  await PlantCodes.loadPlantCodes();         // JSON-Daten laden

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void main() async {
    await PlantCodes.loadPlantCodes();

    final dotNumber1 = "DOT 1VR 100WNM 3724";
    final dotNumber2 = "DOT ABC 4567";
    final dotNumber3 = "DOT XYZ 9919"; // Ungültiger Week Code

    final tire1 = DotParser.parse(dotNumber1);
    final tire2 = DotParser.parse(dotNumber2);
    final tire3 = DotParser.parse(dotNumber3);

    print(tire1?.toString() ?? "Ungültiger DOT-Code: $dotNumber1");
    print(tire2?.toString() ?? "Ungültiger DOT-Code: $dotNumber2");
    print(tire3?.toString() ?? "Ungültiger DOT-Code: $dotNumber3");
  }

  @override
  Widget build(BuildContext context) {
    main();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DOT Decoder')),
        body: Center(
          child: Text('Daten geladen!'),
        ),
      ),
    );
  }
}