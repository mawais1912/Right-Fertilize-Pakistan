import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/base_screen.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _designationController = TextEditingController();
  final _companyController = TextEditingController();
  final _cityController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mobileController = TextEditingController();
  final _commentsController = TextEditingController();

  String? _heardAboutUs;

  // List of dropdown options
  List<String> heardOptions = ['From Phone', 'From Website'];

  // Function to handle feedback form submission
  void _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;
      final designation = _designationController.text;
      final company = _companyController.text;
      final city = _cityController.text;
      final email = _emailController.text;
      final phone = _phoneController.text;
      final mobile = _mobileController.text;
      final comments = _commentsController.text;
      final heard = _heardAboutUs;

      try {
        await FirebaseFirestore.instance.collection('feedbacks').add({
          'first_name': firstName,
          'last_name': lastName,
          'designation': designation,
          'company': company,
          'city': city,
          'email': email,
          'phone': phone,
          'mobile': mobile,
          'heard_about_us': heard,
          'comments': comments,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Clear form fields after submission
        _firstNameController.clear();
        _lastNameController.clear();
        _designationController.clear();
        _companyController.clear();
        _cityController.clear();
        _emailController.clear();
        _phoneController.clear();
        _mobileController.clear();
        _commentsController.clear();
        setState(() => _heardAboutUs = null);

        // Show success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Thank you for your feedback!'),
            content: Text('Your feedback has been successfully submitted.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit feedback: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Assign form key here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Please Give Us your Feedback',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please enter the following information to send us any question, comment, or suggestion.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),

                  _buildRow([
                    _buildTextField('First Name', _firstNameController, 'Please enter your first name'),
                    _buildTextField('Last Name', _lastNameController, 'Please enter your last name'),
                  ]),
                  SizedBox(height: 20),

                  _buildRow([
                    _buildTextField('Designation', _designationController, 'Please enter your designation'),
                    _buildTextField('Company', _companyController, 'Please enter your company name'),
                  ]),
                  SizedBox(height: 20),

                  _buildRow([
                    _buildTextField('City', _cityController, 'Please enter your city'),
                    _buildTextField('Email', _emailController, 'Please enter a valid email address'),
                  ]),
                  SizedBox(height: 20),

                  _buildRow([
                    _buildTextField('Phone', _phoneController, 'Please enter your phone number'),
                    _buildTextField('Mobile', _mobileController, 'Please enter your mobile number'),
                  ]),
                  SizedBox(height: 20),

                  _buildRow([
                    _buildDropdown('How did you hear about us?', heardOptions,
                            (value) => setState(() => _heardAboutUs = value)),
                    _buildTextField('Comments', _commentsController, 'Please enter your comments', maxLines: 5),
                  ]),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _submitFeedback,
                    child: Text('Submit Feedback'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      textStyle: TextStyle(fontSize: 16),
                      backgroundColor: Colors.green[700], // You can adjust this color
                      foregroundColor: Colors.white, // This sets text color
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: fields,
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String validationMessage,
      {int maxLines = 1}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(labelText: label, border:  const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validationMessage;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, ValueChanged<String?> onChanged) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: DropdownButtonFormField<String>(
          hint: Text(label),
          isExpanded: true,
          value: _heardAboutUs,
          items: items.map((item) => DropdownMenuItem<String>(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Please select an option';
            }
            return null;
          },
        ),
      ),
    );
  }
}
