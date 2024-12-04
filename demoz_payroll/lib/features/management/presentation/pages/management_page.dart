import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              onPressed: () {},
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dataTableTheme: DataTableThemeData(
                        headingTextStyle: GoogleFonts.lexend(
                          fontWeight: FontWeight.w500,
                        ),
                        dataTextStyle: GoogleFonts.lexend(),
                      ),
                    ),
                    child: Table(
                      border: TableBorder(
                        horizontalInside: BorderSide(color: Colors.grey[200]!),
                      ),
                      defaultColumnWidth: const FixedColumnWidth(150),
                      columnWidths: const {
                        0: FixedColumnWidth(200),
                        1: FixedColumnWidth(150),
                        2: FixedColumnWidth(150),
                        3: FixedColumnWidth(150),
                      },
                      children: [
                        TableRow(
                          children: [
                            _buildHeaderCell('Employees', true),
                            _buildHeaderCell('Net Salary', false),
                            _buildHeaderCell('Taxable\nEarnings', true),
                            _buildHeaderCell('Income\nTax', false),
                          ],
                        ),
                        ...List.generate(
                          8,
                          (index) => TableRow(
                            children: [
                              _buildCell(
                                  ['Abrham Weldu', 'Bisrat Alemu', 'Birhane Girma', 'Alemu Molla'][index % 4],
                                  true),
                              _buildCell(
                                  [15000, 25000, 15000, 15000][index % 4].toString(),
                                  false),
                              _buildCell(
                                  [2000, 3000, 2000, 2000][index % 4].toString(),
                                  true),
                              _buildCell(
                                  [5000, 7000, 5000, 5000][index % 4].toString(),
                                  false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF579AFC),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, bool isColored) {
    return Container(
      color: isColored ? const Color(0xFFE5F6FF) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: const BoxConstraints(minHeight: 50),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.lexend(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCell(String text, bool isColored) {
    return Container(
      color: isColored ? const Color(0xFFE5F6FF) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      constraints: const BoxConstraints(minHeight: 50),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.lexend(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
