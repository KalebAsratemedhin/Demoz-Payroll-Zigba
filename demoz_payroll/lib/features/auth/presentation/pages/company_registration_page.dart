import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyRegistrationPage extends StatelessWidget {
  const CompanyRegistrationPage({super.key});

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
                  const TextSpan(text: 'Register your company\nto '),
                  TextSpan(
                    text: 'Demoz Payroll',
                    style: GoogleFonts.lexend(
                      color: const Color(0xFF579AFC),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Register your company to continue',
              style: GoogleFonts.lexend(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 32),
            _buildTextField('Company name'),
            const SizedBox(height: 16),
            _buildTextField('Address of the company'),
            const SizedBox(height: 16),
            _buildTextField('Phone Number'),
            const SizedBox(height: 16),
            _buildTextField('Tin Number'),
            const SizedBox(height: 16),
            _buildTextField('Number of employees'),
            const SizedBox(height: 16),
            _buildTextField('Company bank'),
            const SizedBox(height: 16),
            _buildTextField('Bank account number'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEFF0),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Submit for approval',
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
      ),
    );
  }
}
