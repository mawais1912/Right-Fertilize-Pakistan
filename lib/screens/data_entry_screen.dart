import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';

class DataEntryScreen extends StatefulWidget {
  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text Controllers
  final _villageController = TextEditingController();
  final _farmerController = TextEditingController();
  final _newVarietyController = TextEditingController();
  final _omController = TextEditingController();
  final _avPController = TextEditingController();
  final _avKController = TextEditingController();
  final _znController = TextEditingController();
  final _cuController = TextEditingController();
  final _feController = TextEditingController();
  final _mnController = TextEditingController();
  final _bController = TextEditingController();
  final _fertilizerNController = TextEditingController();
  final _fertilizerPController = TextEditingController();
  final _fertilizerKController = TextEditingController();
  final _timeController = TextEditingController();
  final _yieldController = TextEditingController();

  // Dropdown Lists
  List<String> districts = [
    'Attock اٹک', 'Faisalabad فیصل آباد', 'Lahore لاہور', 'Multan ملتان', 'Bahawal Nagar بہاول نگر',
    'Bahawalpur بہاولپور', 'Bhakkarبھکر', 'Chakwal چکوال', 'D.G.Khan ڈیرہ غازی خان', 'Gujranwala گوجرانوالہ',
    'Gujrat گجرات', 'Hafizabad حافظ آباد', 'Jhang جھنگ', 'Jhelum  جہلم', 'Kasur قصور', 'Khaniwal خانیوال',
    'Khushab  خوشاب', 'Layyah لیہ', 'M.B.Din  منڈی بہاؤالدین', 'Mianwali میانوالی', 'Muzaffar Garh مظفر گڑھ',
    'Narowal  نارووال', 'Okara   اوکاڑہ', 'Pak Pattan  پاک پتن', 'R.Y.Khan رحیم یارخان', 'Rajan Pur راجن پور',
    'Rawalpindi راولپنڈی', 'Sahiwal ساہیوال', 'Sargodha سرگودھا', 'Sheikhupura شیخوپورہ', 'Sialkot سیالکوٹ',
    'T.T.Singh ٹوبہ ٹیک سنگھ', 'Vehari   وہاڑی'
  ];

  List<String> categories = [
    'Basmati rice باسمتی چاول', 'Wheat گندم', 'Cotton کپاس', 'BT Cotton بی ٹی کاٹن', 'Cabbage گوبھی', 'Canola',
    'Carrot  گاجر', 'Chillies', 'Course rice کورس چاول', 'Garlic  لہسن', 'Gram', 'Groundnut مونگفلی', 'Lentil   دال',
    'Maiz Hybrid مکئی ہائبرڈ', 'Maize O.P.V', 'Mash', 'Non BT Cotton غیر بی ٹی کاٹن', 'Onion', 'Peas', 'Potato آلو',
    'Raya رایا', 'Sugarcane گنا', 'Sunflower سورجمھی', 'Tomato  ٹماٹر'
  ];

  List<String> crops = ['Basmati rice باسمتی چاول', 'Wheat گندم', 'Cotton کپاس', 'BT Cotton بی ٹی کاٹن', 'Cabbage گوبھی', 'Canola',
    'Carrot  گاجر', 'Chillies', 'Course rice کورس چاول', 'Garlic  لہسن', 'Gram', 'Groundnut مونگفلی', 'Lentil   دال',
    'Maiz Hybrid مکئی ہائبرڈ', 'Maize O.P.V', 'Mash', 'Non BT Cotton غیر بی ٹی کاٹن', 'Onion', 'Peas', 'Potato آلو',
    'Raya رایا', 'Sugarcane گنا', 'Sunflower سورجمھی', 'Tomato  ٹماٹر'];
  List<String> varieties = ['Add New Variety', 'Basmati', 'B-2002', 'B-515', 'B-2000', 'B-385', 'B-Super', 'New York', 'Kasur', 'Kainat'];

  String? selectedDistrict;
  String? selectedCategory;
  String? selectedCrop;
  String? selectedVariety;

  void _submitData() async {
    if (_formKey.currentState!.validate()) {
      if (_farmerController.text.trim().isEmpty || _yieldController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Farmer name or yield is required')),
        );
        return;
      }

      try {
        await FirebaseFirestore.instance.collection('data_entries').add({
          'district': selectedDistrict ?? '',
          'village': _villageController.text.trim(),
          'category': selectedCategory ?? '',
          'crop': selectedCrop ?? '',
          'variety': selectedVariety ?? '',
          'new_variety': _newVarietyController.text.trim(),
          'farmer': _farmerController.text.trim(),
          'soil_analysis': {
            'om': _omController.text.trim(),
            'av_p': _avPController.text.trim(),
            'av_k': _avKController.text.trim(),
            'zn': _znController.text.trim(),
            'cu': _cuController.text.trim(),
            'fe': _feController.text.trim(),
            'mn': _mnController.text.trim(),
            'b': _bController.text.trim(),
          },
          'fertilizer_doses': {
            'n': _fertilizerNController.text.trim(),
            'p2o5': _fertilizerPController.text.trim(),
            'k2o': _fertilizerKController.text.trim(),
            'time_of_fertilizer': _timeController.text.trim(),
          },
          'yield': _yieldController.text.trim(),
          'timestamp': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully!')),
        );

        _formKey.currentState!.reset();
        setState(() {
          selectedDistrict = null;
          selectedCategory = null;
          selectedCrop = null;
          selectedVariety = null;
        });

        // Clear all text fields
        _villageController.clear();
        _farmerController.clear();
        _newVarietyController.clear();
        _omController.clear();
        _avPController.clear();
        _avKController.clear();
        _znController.clear();
        _cuController.clear();
        _feController.clear();
        _mnController.clear();
        _bController.clear();
        _fertilizerNController.clear();
        _fertilizerPController.clear();
        _fertilizerKController.clear();
        _timeController.clear();
        _yieldController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save data: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DATA ENTRY / ڈیٹا انٹری', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[700])),
                  SizedBox(height: 10),
                  Text('Please enter the following information about your crops.', style: TextStyle(fontSize: 16, color: Colors.black87)),
                  Divider(thickness: 1, height: 30),

                  // District & Village
                  _buildRow([
                    _buildDropdown('District', districts, (value) {
                      setState(() => selectedDistrict = value);
                    }),
                    _buildTextField('New Village', _villageController, disabled: selectedDistrict != null),
                  ]),

                  SizedBox(height: 20),

                  // Category & Crop
                  _buildRow([
                    _buildDropdown('Category', categories, (value) {
                      setState(() {
                        selectedCategory = value;
                        selectedCrop = value != null ? value.split(' ')[0] : null;
                      });
                    }),
                    _buildDropdown('Crop', crops, (_) {}),
                  ]),

                  SizedBox(height: 20),

                  // Variety & New Variety
                  _buildRow([
                    _buildDropdown('Variety', varieties, (value) {
                      setState(() => selectedVariety = value);
                    }),
                    _buildTextField('New Variety', _newVarietyController, disabled: selectedVariety != null),
                  ]),

                  SizedBox(height: 20),
                  _buildTextField('Farmer', _farmerController),
                  SizedBox(height: 30),

                  Text('Soil Analysis / مٹی کا تجزیہ ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[700])),
                  Divider(thickness: 1, height: 20),
                  _buildRow([
                    _buildTextField('O.M (%)', _omController),
                    _buildTextField('Av.P (ppm)', _avPController),
                    _buildTextField('Av.K (ppm)', _avKController),
                  ]),
                  SizedBox(height: 20),
                  _buildRow([
                    _buildTextField('Zn (ppm)', _znController),
                    _buildTextField('Cu (ppm)', _cuController),
                    _buildTextField('Fe (ppm)', _feController),
                    _buildTextField('Mn (ppm)', _mnController),
                    _buildTextField('B (ppm)', _bController),
                  ]),
                  SizedBox(height: 30),

                  Text('Fertilizer Doses / کھاد کی خوراک ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[700])),
                  Divider(thickness: 1, height: 20),
                  _buildRow([
                    _buildTextField('N (kg)', _fertilizerNController),
                    _buildTextField('P2O5 (kg)', _fertilizerPController),
                    _buildTextField('K2O (kg)', _fertilizerKController),
                    _buildTextField('Time of Fert.', _timeController),
                    _buildTextField('Yield (mds/A)', _yieldController),
                  ]),
                  SizedBox(height: 30),

                  Center(
                    child: ElevatedButton(
                      onPressed: _submitData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> fields) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: fields,
    );
  }

  Widget _buildDropdown(String label, List<String> items, ValueChanged<String?> onChanged) {
    String? value;
    if (label == 'District') value = selectedDistrict;
    else if (label == 'Category') value = selectedCategory;
    else if (label == 'Crop') value = selectedCrop;
    else if (label == 'Variety') value = selectedVariety;

    return SizedBox(
      width: 200,
      child: DropdownButtonFormField<String>(
        value: items.contains(value) ? value : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
        isExpanded: true,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool disabled = false}) {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: controller,
        enabled: !disabled,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
      ),
    );
  }
}
