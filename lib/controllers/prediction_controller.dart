// lib/controllers/prediction_controller.dart
import '../models/crop_data.dart';

class PredictionController {
  String? selectedDistrict;
  String? selectedCrop;

  /// 🔹 Returns the CropRange for the selected district & crop
  CropRange? getSelectedRange() {
    if (selectedDistrict != null && selectedCrop != null) {
      return cropData[selectedDistrict!]?[selectedCrop!];
    }
    return null;
  }

  /// 🔹 Get all available districts
  List<String> getDistricts() => cropData.keys.toList();

  /// 🔹 Get crops available in a specific district
  List<String> getCropsForDistrict(String district) {
    return cropData[district]?.keys.toList() ?? [];
  }

  /// 🔹 Validate Organic Matter Input
  String? validateOrganicMatter(String? value) {
    final range = getSelectedRange();
    final val = double.tryParse(value ?? '');
    if (range == null || val == null) return 'Enter valid number';
    if (val < range.organicMatterMin || val > range.organicMatterMax) {
      return 'Must be between ${range.organicMatterMin} - ${range.organicMatterMax}';
    }
    return null;
  }

  /// 🔹 Validate Phosphorus Input
  String? validatePhosphorus(String? value) {
    final range = getSelectedRange();
    final val = double.tryParse(value ?? '');
    if (range == null || val == null) return 'Enter valid number';
    if (val < range.phosphorusMin || val > range.phosphorusMax) {
      return 'Must be between ${range.phosphorusMin} - ${range.phosphorusMax}';
    }
    return null;
  }

  /// 🔹 Validate Yield Input
  String? validateYield(String? value) {
    final range = getSelectedRange();
    final val = double.tryParse(value ?? '');
    if (range == null || val == null) return 'Enter valid number';
    if (val < range.yieldMin || val > range.yieldMax) {
      return 'Must be between ${range.yieldMin} - ${range.yieldMax}';
    }
    return null;
  }

  /// 🔹 (Optional Future Use)
  /// This can be called to submit prediction data to backend (SQL Server API)
  Map<String, dynamic> buildPredictionPayload({
    required double organicMatter,
    required double phosphorus,
    required double yieldValue,
  }) {
    return {
      'district': selectedDistrict,
      'crop': selectedCrop,
      'organicMatter': organicMatter,
      'phosphorus': phosphorus,
      'yieldValue': yieldValue,
    };
  }
}
