import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../management/presentation/pages/management_page.dart';
import '../../../profile/presentation/pages/company_profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ManagementPage(),
    const CompanyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 24,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          top: 12,
          bottom: MediaQuery.of(context).padding.bottom + 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'assets/icons/home.svg', 'Home'),
            _buildNavItem(1, 'assets/icons/management.svg', 'Management'),
            _buildNavItem(2, 'assets/icons/profile.svg', 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 2,
              width: 32,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF3085FE) : Colors.transparent,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            SvgPicture.asset(
              iconPath,
              height: 26,
              colorFilter: ColorFilter.mode(
                isSelected ? const Color(0xFF3085FE) : const Color(0xFF949494),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.lexend(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? const Color(0xFF3085FE) : const Color(0xFF949494),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
