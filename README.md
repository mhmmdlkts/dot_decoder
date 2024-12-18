# Tire Index Parser

A **Dart and Flutter package** for parsing and validating **DOT codes**, **Load Indices**, and **Speed Indices** for tires. This package helps extract information like manufacturer details, load capacity, and maximum speed from tire specifications.

## Features

- **DOT Code Parsing**:
    - Extract manufacturer details from DOT codes.
    - Validate production date (week and year) in DOT codes.

- **Load Index**:
    - Validate load index values.
    - Convert load capacity to **lbs** or **kg**.

- **Speed Index**:
    - Validate speed index values.
    - Get maximum speed in **km/h** or **mph**.

## Getting started

### Prerequisites
- Dart SDK `>=2.18.0 <4.0.0`
- Flutter SDK (if used in a Flutter application).

### Installation
Add this package to your `pubspec.yaml`:

dependencies:
  tire_index_parser: ^1.0.0

## Usage

### DOT Code Parsing
import 'package:tire_index_parser/tire_index_parser.dart';

void main() {
String dotCode = "DOT 1VR 100WNM 3724";
var tireInfo = DotParser.parse(dotCode);

if (tireInfo != null) {
print("Plant Code: ${tireInfo.plantCode}");
print("Week: ${tireInfo.weekCode}");
print("Year: ${tireInfo.yearCode}");
print("Manufacturer: ${tireInfo.company?.manufacturer ?? "Unknown"}");
} else {
print("Invalid DOT Code");
}
}

**Output:**
Plant Code: 1VR
Week: 37
Year: 2024
Manufacturer: Bridgestone

### Load Index
int loadIndex = 50;
int lbs = IndexService.parseLoadIndexLbs(loadIndex);
int kg = IndexService.lbsToKg(lbs);

print("Load Index $loadIndex: $lbs lbs (${kg} kg)");

**Output:**
Load Index 50: 419 lbs (190 kg)

### Speed Index
String speedIndex = "H";
int kmh = IndexService.getSpeedInKmH(speedIndex);
int mph = IndexService.kmhToMph(kmh);

print("Speed Index $speedIndex: $kmh km/h (${mph} mph)");

**Output:**
Speed Index H: 210 km/h (130 mph)

## Additional information

### Reporting Issues or Suggestions
- Submit issues or feature requests through the GitHub repository.

### Contributions
- Fork the repository and create pull requests for new features or bug fixes.