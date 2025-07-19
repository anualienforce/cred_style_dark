import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/home_screen.dart';

class AppColors {
  static const Color background = Color(0xFF000000);
  static const Color card = Color(0xFF1A1A1A);
  static const Color primary = Color(0xFF77FF1B); // Neon mint
  static const Color secondary = Color(0xFF323232);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color accent = Color(0xFF4ECCA3); // Subtle vibrant green
  static const Color danger = Color(0xFFFF4D4D); // Red for errors or highlights
}

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,

        child: Center(
          child: Container(
            width: 250,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(50),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(0, Icons.home_outlined),
                _buildNavItem(1, Icons.event_note_outlined),
                _buildNavItem(2, Icons.tv_outlined),
                _buildNavItem(3, Icons.favorite_outline),
              ],
            ),
          ),
        ),
    );

  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected?CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 25,
              child: Icon(
                icon,
                color: AppColors.background,
                size: 24,
              ),
            ):Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
        size: 24,
      ),
          ],
        ),
      ),
    );
  }

}

// Individual Screen Widgets
class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Text(
              'Event',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
      ),
    );
  }
}

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Text(
              'Favourites',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: AppColors.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
      ),
    );
  }

}

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'Television',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ),
    );
  }
}
