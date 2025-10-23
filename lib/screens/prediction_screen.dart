import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../controllers/prediction_controller.dart';

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final _formKey = GlobalKey<FormState>();
  final PredictionController _controller = PredictionController();

  final _organicMatterController = TextEditingController();
  final _phosphorusController = TextEditingController();
  final _yieldController = TextEditingController();

  void _submitPrediction() {
    if (_formKey.currentState!.validate()) {
      // ✅ Build payload for backend API (SQL Server)
      final payload = _controller.buildPredictionPayload(
        organicMatter: double.parse(_organicMatterController.text),
        phosphorus: double.parse(_phosphorusController.text),
        yieldValue: double.parse(_yieldController.text),
      );

      // ✅ (Later) Send payload to backend API via HTTP POST

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Prediction submitted successfully!')),
      );

      // ✅ Clear inputs after submission
      _organicMatterController.clear();
      _phosphorusController.clear();
      _yieldController.clear();
    }
  }

  @override
  void dispose() {
    _organicMatterController.dispose();
    _phosphorusController.dispose();
    _yieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final range = _controller.getSelectedRange();

    return BaseScreen(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PREDICTION',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                'Please select your district and crop, then enter the parameters below.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 25),

              // 🌾 District Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
                items: _controller.getDistricts().map((district) {
                  return DropdownMenuItem(
                      value: district, child: Text(district));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _controller.selectedDistrict = value;
                    _controller.selectedCrop = null;
                    _organicMatterController.clear();
                    _phosphorusController.clear();
                    _yieldController.clear();
                  });
                },
                value: _controller.selectedDistrict,
                validator: (val) =>
                val == null ? 'Please select a district' : null,
              ),
              SizedBox(height: 20),

              // 🌱 Crop Dropdown
              if (_controller.selectedDistrict != null)
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Crop',
                    border: OutlineInputBorder(),
                  ),
                  items: _controller
                      .getCropsForDistrict(_controller.selectedDistrict!)
                      .map((crop) =>
                      DropdownMenuItem(value: crop, child: Text(crop)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _controller.selectedCrop = value;
                      _organicMatterController.clear();
                      _phosphorusController.clear();
                      _yieldController.clear();
                    });
                  },
                  value: _controller.selectedCrop,
                  validator: (val) => val == null ? 'Please select a crop' : null,
                ),

              SizedBox(height: 25),

              // 🌾 Input Fields
              if (_controller.selectedCrop != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildValidatedField(
                      label: 'Organic Matter (%)',
                      controller: _organicMatterController,
                      validator: _controller.validateOrganicMatter,
                      hint: range != null
                          ? 'Range: ${range.organicMatterMin} - ${range.organicMatterMax}'
                          : null,
                    ),
                    SizedBox(height: 20),
                    _buildValidatedField(
                      label: 'Available Phosphorus (ppm)',
                      controller: _phosphorusController,
                      validator: _controller.validatePhosphorus,
                      hint: range != null
                          ? 'Range: ${range.phosphorusMin} - ${range.phosphorusMax}'
                          : null,
                    ),
                    SizedBox(height: 20),
                    _buildValidatedField(
                      label: 'Yield (mds/A)',
                      controller: _yieldController,
                      validator: _controller.validateYield,
                      hint: range != null
                          ? 'Range: ${range.yieldMin} - ${range.yieldMax}'
                          : null,
                    ),
                  ],
                ),

              SizedBox(height: 30),

              // 🔘 Submit Button
              ElevatedButton(
                onPressed: _submitPrediction,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Custom field builder with range hint
  Widget _buildValidatedField({
    required String label,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    String? hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: validator,
    );
  }
}
