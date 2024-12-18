import 'dart:convert';
import 'package:dot_decoder/tire_company.dart';
import 'package:flutter/services.dart' show rootBundle;

class PlantCodes {
  static List<Map<String, dynamic>> _plantCodes = [];

  /// Lade die Plant Codes aus der JSON-Datei
  static Future<void> loadPlantCodes() async {
    final jsonString = await rootBundle.loadString('assets/dot_plant_codes.json');
    _plantCodes = List<Map<String, dynamic>>.from(json.decode(jsonString));
  }

  /// Suche nach Plant Code und unterscheide zwischen alt (2-stellig) und neu (3-stellig)
  static TireCompany? getPlantInfo(String code) {
    if ( code.length != 2 && code.length != 3) return null;

    final isNewCode = code.length == 3;

    final entry = _plantCodes.firstWhere(
      (e) => isNewCode ? e['newCode'] == code : e['oldCode'] == code,
      orElse: () => {},
    );

    if (entry.isNotEmpty) {
      return TireCompany(
        manufacturer: entry['manufacturer'],
        city: entry['city'],
        country: entry['country'],
        code: code
      );
    }
    return null;
  }
}