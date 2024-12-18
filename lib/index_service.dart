class IndexService {
  /// Gibt die Tragfähigkeit in Pfund (lbs) für den angegebenen Load Index zurück.
  /// Gibt -1 zurück, wenn der Load Index ungültig ist.
  static int parseLoadIndexLbs(int loadIndex) {
    if (loadIndex < 0 || loadIndex >= _loadIndexToLbs.length) {
      return -1; // Ungültiger Load Index
    }
    return _loadIndexToLbs[loadIndex];
  }

  /// Wandelt lbs in kg um (ohne Nachkommastellen).
  static int lbsToKg(int lbs) {
    return (lbs / 2.20462).floor(); // Division und Abrunden
  }

  /// Gibt die maximale Geschwindigkeit in km/h für den gegebenen Speed Index zurück.
  /// Gibt -1 zurück, wenn der Speed Index ungültig ist.
  static int getSpeedInKmH(String speedIndex) {
    return _speedIndexToKmH[speedIndex.toUpperCase()] ?? -1;
  }

  /// Wandelt km/h in mph um (ohne Nachkommastellen).
  static int kmhToMph(int kmh) {
    return (kmh / 1.60934).floor(); // Division und Abrunden
  }

  /// Prüft, ob ein Speed Index gültig ist.
  static bool isValidSpeedIndex(String speedIndex) {
    return _speedIndexToKmH.containsKey(speedIndex.toUpperCase());
  }

  /// Prüft, ob ein Load Index gültig ist.
  static bool isValidLoadIndex(int loadIndex) {
    return parseLoadIndexLbs(loadIndex) != -1;
  }

  /// Gibt eine Map aller unterstützten Speed Indices mit ihren Geschwindigkeiten zurück.
  static Map<String, int> getAllSpeedIndices() {
    return Map.from(_speedIndexToKmH);
  }

  /// Gibt eine Map aller unterstützten Load Indices mit Tragfähigkeiten zurück.
  static Map<int, int> getAllLoadIndices() {
    return Map.fromIterables(
      List.generate(_loadIndexToLbs.length, (i) => i), // Indizes (0 bis 150)
      _loadIndexToLbs, // Tragfähigkeiten
    );
  }

  // Tabelle mit Tragfähigkeiten in lbs (0 bis 150)
  static const List<int> _loadIndexToLbs = [
    99, 102, 105, 107, 110, 114, 117, 120, 123, 128, // 0–9
    132, 136, 139, 143, 148, 152, 157, 161, 165, 171, // 10–19
    176, 182, 187, 193, 198, 204, 209, 215, 220, 227, // 20–29
    234, 240, 247, 254, 260, 267, 276, 282, 291, 300, // 30–39
    309, 320, 331, 342, 353, 364, 375, 386, 397, 408, // 40–49
    419, 430, 441, 454, 467, 481, 494, 507, 520, 536, // 50–59
    551, 567, 584, 600, 617, 639, 639, 677, 694, 716, // 60–69
    739, 761, 783, 805, 827, 852, 882, 908, 937, 963, // 70–79
    992, 1019, 1047, 1074, 1102, 1135, 1168, 1201, 1235, 1279, // 80–89
    1323, 1356, 1389, 1433, 1477, 1521, 1565, 1609, 1653, 1709, // 90–99
    1764, 1819, 1874, 1929, 1984, 2039, 2094, 2149, 2205, 2271, // 100–109
    2337, 2403, 2469, 2535, 2601, 2679, 2756, 2833, 2910, 2998, // 110–119
    3086, 3197, 3307, 3417, 3527, 3638, 3748, 3858, 3968, 4079, // 120–129
    4189, 4289, 4409, 4541, 4674, 4806, 4938, 5071, 5203, 5357, // 130–139
    5512, 5677, 5842, 6008, 6173, 6393, 6614, 6779, 6844, 7165, // 140–149
    7385, // 150
  ];

  // Tabelle mit Speed Indices und Geschwindigkeiten in km/h
  static const Map<String, int> _speedIndexToKmH = {
    "A1": 5,
    "A2": 10,
    "A3": 15,
    "A4": 20,
    "A5": 25,
    "A6": 30,
    "A8": 40,
    "B": 50,
    "C": 60,
    "D": 65,
    "E": 70,
    "F": 80,
    "G": 90,
    "J": 100,
    "K": 110,
    "L": 120,
    "M": 130,
    "N": 140,
    "P": 150,
    "Q": 160,
    "R": 170,
    "S": 180,
    "T": 190,
    "U": 200,
    "H": 210,
    "V": 240,
    "W": 270,
    "Y": 300,
  };
}