import 'dart:math' show pi;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isUpcoming = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.lexend(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildStatsCard(
                  'Number of\nEmployees',
                  '20',
                  Colors.blue[100]!,
                  Colors.blue,
                )),
                const SizedBox(width: 8),
                Expanded(child: _buildStatsCard(
                  'Income Tax\npaid',
                  '2000',
                  Colors.green[50]!,
                  Colors.green,
                )),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildStatsCard(
                  'Pension Tax\nPaid',
                  '4',
                  Colors.blue[50]!,
                  Colors.blue,
                )),
                const SizedBox(width: 8),
                Expanded(child: _buildStatsCard(
                  'Employees\nPerformance',
                  '95 %',
                  Colors.red[50]!,
                  Colors.red,
                )),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0x0DACAFB5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isUpcoming = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: isUpcoming ? const Color(0xFF3085FE) : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Upcoming',
                        style: GoogleFonts.lexend(
                          fontSize: 16,
                          color: isUpcoming ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isUpcoming = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: !isUpcoming ? const Color(0xFF3085FE) : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Past',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            color: !isUpcoming ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (isUpcoming) Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0D000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.lexend(
                              fontSize: 14,
                              color: const Color(0xFF949494),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Aug 28, 2024 - Sep 5, 2024',
                            style: GoogleFonts.lexend(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEED),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'pay now',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            color: const Color(0xFFFF6B6B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color(0xFFEEEEF0),
                    thickness: 1,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Income Tax',
                            style: GoogleFonts.lexend(
                              fontSize: 14,
                              color: const Color(0xFF949494),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '4000',
                                style: GoogleFonts.lexend(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'etb',
                                style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  color: const Color(0xFF949494),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 48),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pension Tax',
                            style: GoogleFonts.lexend(
                              fontSize: 14,
                              color: const Color(0xFF949494),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '5000',
                                style: GoogleFonts.lexend(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'etb',
                                style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  color: const Color(0xFF949494),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'August',
                            style: GoogleFonts.lexend(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF6B6B),
                            ),
                          ),
                          Text(
                            'Tax on due',
                            style: GoogleFonts.lexend(
                              fontSize: 16,
                              color: const Color(0xFFFF6B6B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Color(0xFFEEEEF0),
              thickness: 1,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0D000000),
                          blurRadius: 24,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Composition',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 90,
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: CustomPaint(
                                  painter: DonutChartPainter(
                                    values: const [35, 65],
                                    colors: const [Color(0xFF5932EA), Color(0xFF16C098)],
                                    strokeWidth: 12,
                                    largerSectionStrokeWidth: 12,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x1A000000),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.male, size: 14, color: Color(0xFF5932EA)),
                                      const SizedBox(width: 4),
                                      Text(
                                        '35%',
                                        style: GoogleFonts.lexend(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF5932EA),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 20,
                                bottom: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x1A000000),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.female, size: 14, color: Color(0xFF16C098)),
                                      const SizedBox(width: 4),
                                      Text(
                                        '65%',
                                        style: GoogleFonts.lexend(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF16C098),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Center(
                          child: Text(
                            '856 employee total',
                            style: GoogleFonts.lexend(
                              fontSize: 10,
                              color: const Color(0xFF949494),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0D000000),
                          blurRadius: 24,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tax Summary',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '9,349',
                              style: GoogleFonts.lexend(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF262422),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'etb',
                              style: GoogleFonts.lexend(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              color: Color(0xFF00BA88),
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '49.98%',
                              style: GoogleFonts.lexend(
                                color: const Color(0xFF00BA88),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(String title, String value, Color bgColor, Color? textColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.15),
        border: Border.all(
          color: bgColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lexend(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.lexend(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaxItem(String title, String amount, String currency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lexend(
            fontSize: 14,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              amount,
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              currency,
              style: GoogleFonts.lexend(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

double radians(double degrees) => degrees * pi / 180;

class DonutChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double strokeWidth;
  final double largerSectionStrokeWidth;

  DonutChartPainter({
    required this.values,
    required this.colors,
    required this.strokeWidth,
    required this.largerSectionStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    double startAngle = -pi / 2;
    final total = values.reduce((a, b) => a + b);

    // Draw sections
    for (int i = 0; i < values.length; i++) {
      paint.color = colors[i];
      final sweepAngle = (values[i] / total) * 2 * pi;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
