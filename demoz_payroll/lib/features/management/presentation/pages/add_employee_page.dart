import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  String _selectedPaymentType = 'per month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'Add Employee',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.lexend(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(text: 'Add New '),
                  TextSpan(
                    text: 'Employee',
                    style: GoogleFonts.lexend(
                      color: const Color(0xFF579AFC),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Here you can add your new employee and start\ncalculating his tax and salary',
              style: GoogleFonts.lexend(
                color: Colors.grey[600],
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            _buildTextField('Employee name'),
            const SizedBox(height: 16),
            _buildTextField('Email address'),
            const SizedBox(height: 16),
            _buildTextField('Phone number'),
            const SizedBox(height: 16),
            _buildTextField('Tin number'),
            const SizedBox(height: 16),
            _buildTextField('Gross salary'),
            const SizedBox(height: 16),
            _buildTextField('Taxable earnings'),
            const SizedBox(height: 16),
            _buildTextField('Starting date of salary'),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildPaymentTypeButton('per month'),
                const SizedBox(width: 12),
                _buildPaymentTypeButton('per Contract'),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add employee',
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      style: GoogleFonts.lexend(),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: GoogleFonts.lexend(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF579AFC)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildPaymentTypeButton(String type) {
    final isSelected = _selectedPaymentType == type;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedPaymentType = type;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF579AFC),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          type,
          style: GoogleFonts.lexend(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
