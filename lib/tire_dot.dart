import 'package:dot_decoder/tire_company.dart';

class TireDot {
  final String plantCode;         // Plant Code (2-3 Buchstaben)
  final String sizeCode;          // Size Code (2 Ziffern)
  final String? manufacturingCode; // Optional (alphanumerisch, bis zu 4 Zeichen)
  final int weekCode;             // Woche (01-52)
  final int yearCode;             // Jahr (z.B. 2020)
  final bool isNewCode;           // Ist der Plant Code neu?
  final TireCompany? company;         // Herstellerinformationen (optional)

  TireDot({
    required this.plantCode,
    required this.sizeCode,
    this.manufacturingCode,
    required this.weekCode,
    required this.yearCode,
    required this.isNewCode,
    this.company,
  });

  @override
  String toString() {
    return '''
Tire DOT Details:
Plant Code: $plantCode (${isNewCode ? 'Neu' : 'Alt'})
Size Code: $sizeCode
Manufacturing Code: ${manufacturingCode ?? 'N/A'}
Week: $weekCode
Year: $yearCode
Company: ${company?.toString() ?? 'Keine Informationen'}
''';
  }
}