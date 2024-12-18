import 'package:dot_decoder/tire_company.dart';

import 'plant_codes.dart';

class DotParser {
  static final RegExp dotPattern = RegExp(
    r'^DOT\s([A-Z0-9]{2,3}).*?(\d{4})$',
    caseSensitive: false,
  );

  /// DOT-Code parsen: Gibt Plant Code und Datum zurück
  static TireDot? parse(String dotCode) {
    final match = dotPattern.firstMatch(dotCode);

    if (match != null) {
      final plantCode = match.group(1)!;   // Hersteller Code (2-3 Zeichen)
      final dateCode = match.group(2)!;    // WWYY (4 Ziffern)

      // Week Code und Year Code extrahieren
      int? weekCode = int.tryParse(dateCode.substring(0, 2));
      int? yearCode = int.tryParse(dateCode.substring(2, 4));

      if (yearCode != null) {
        yearCode += 2000;
      }

      // Validierung: Produktionswoche muss zwischen 1 und 52 liegen
      if (weekCode != null && (weekCode < 1 || weekCode > 52)) {
        return null; // Ungültiger Week Code
      }

      // Herstellerinformationen abrufen
      final company = PlantCodes.getPlantInfo(plantCode);

      // TireDot-Objekt erstellen
      return TireDot(
        dotCode: dotCode,
        plantCode: plantCode,
        weekCode: weekCode,
        yearCode: yearCode,
        company: company,
      );
    }
    return null; // Ungültiges Format
  }
}

class TireDot {
  final String dotCode;
  final String plantCode;
  final int? weekCode;
  final int? yearCode;
  final TireCompany? company;

  TireDot({
    required this.dotCode,
    required this.plantCode,
    required this.weekCode,
    required this.yearCode,
    this.company,
  });
}