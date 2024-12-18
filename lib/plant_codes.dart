import 'package:dot_decoder/dot_plant_codes.dart';
import 'package:dot_decoder/tire_company.dart';

class PlantCodes {

  /// Suche nach Plant Code und unterscheide zwischen alt (2-stellig) und neu (3-stellig)
  static TireCompany? getPlantInfo(String code) {
    if ( code.length != 2 && code.length != 3) return null;

    final isNewCode = code.length == 3;

    final entry = plantCodes.firstWhere(
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