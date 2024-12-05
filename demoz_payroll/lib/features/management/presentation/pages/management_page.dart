import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_employee_page.dart';
import '../../../profile/presentation/pages/company_profile_page.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Management',
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.upload_file, color: Colors.grey, size: 16),
                  label: Text(
                    'Upload CSV',
                    style: GoogleFonts.lexend(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddEmployeePage(),
                  ),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white, size: 16),
              label: Text(
                'Add Employee',
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16C098),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Taxable\nEarnings',
                              style: GoogleFonts.lexend(
                                fontSize: 13,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Income\nTax',
                              style: GoogleFonts.lexend(
                                fontSize: 13,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Pension\nTax',
                              style: GoogleFonts.lexend(
                                fontSize: 13,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Gross\nPay',
                              style: GoogleFonts.lexend(
                                fontSize: 13,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Actions',
                              style: GoogleFonts.lexend(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF2B2B2B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Table Rows
                    ...List.generate(
                      5,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: index.isEven ? const Color(0xFFF8FBFF) : Colors.white,
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${2000 + (index == 1 ? 1000 : 0)}',
                                style: GoogleFonts.lexend(
                                  fontSize: 13,
                                  color: const Color(0xFF2B2B2B),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${5000 + (index == 1 ? 2000 : 0)}',
                                style: GoogleFonts.lexend(
                                  fontSize: 13,
                                  color: const Color(0xFF2B2B2B),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${5000 + (index == 1 ? 2000 : 0)}',
                                style: GoogleFonts.lexend(
                                  fontSize: 13,
                                  color: const Color(0xFF2B2B2B),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${20000 + (index == 1 ? 10000 : 0)}',
                                style: GoogleFonts.lexend(
                                  fontSize: 13,
                                  color: const Color(0xFF2B2B2B),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF3DD598),
                                    minimumSize: const Size(60, 28),
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: Text(
                                    'Pay',
                                    style: GoogleFonts.lexend(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
