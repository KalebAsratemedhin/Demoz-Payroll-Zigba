import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Company\nProfile',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFF1ECEC),
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF579AFC),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Company Name',
                    style: GoogleFonts.lexend(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'HR Manager',
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoSection('Company Email', 'xxx@gmail.com', Icons.mail_outline),
            const SizedBox(height: 24),
            _buildInfoSection('Phone Number', '+9312135', Icons.phone_outlined),
            const SizedBox(height: 24),
            _buildInfoSection('Company Address', 'Somewhere', Icons.location_on_outlined),
            const SizedBox(height: 24),
            _buildInfoSection('Number of Employees', '20', Icons.groups_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF262422),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFF1ECEC),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.grey[600],
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                value,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
