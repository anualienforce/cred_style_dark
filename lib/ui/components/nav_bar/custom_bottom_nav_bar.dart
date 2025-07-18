import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(50),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(0, Icons.music_note_outlined),
                _buildNavItem(1, Icons.library_music_outlined),
                _buildNavItem(3, Icons.cloud_download_outlined),
                _buildNavItem(4, Icons.menu_outlined),
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
class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Music'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Recently Played'),
          _buildMusicCard('Song Title 1', 'Artist Name', Icons.music_note),
          _buildMusicCard('Song Title 2', 'Artist Name', Icons.music_note),
          _buildMusicCard('Song Title 3', 'Artist Name', Icons.music_note),
          const SizedBox(height: 24),
          _buildSectionHeader('Trending'),
          _buildMusicCard('Popular Song 1', 'Popular Artist', Icons.trending_up),
          _buildMusicCard('Popular Song 2', 'Popular Artist', Icons.trending_up),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMusicCard(String title, String artist, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  artist,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.play_circle_fill,
            color: AppColors.primary,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLibraryItem('Playlists', Icons.playlist_play, '25 playlists'),
          _buildLibraryItem('Favorites', Icons.favorite, '142 songs'),
          _buildLibraryItem('Downloaded', Icons.download, '67 songs'),
          _buildLibraryItem('Recently Added', Icons.access_time, '23 songs'),
          _buildLibraryItem('Albums', Icons.album, '89 albums'),
          _buildLibraryItem('Artists', Icons.person, '45 artists'),
        ],
      ),
    );
  }

  Widget _buildLibraryItem(String title, IconData icon, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }
}

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Now Playing'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Album Art
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(
                Icons.music_note,
                color: AppColors.primary,
                size: 100,
              ),
            ),
            const SizedBox(height: 40),
            // Song Info
            const Text(
              'Song Title',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Artist Name',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            // Progress Bar
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.3,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shuffle, color: AppColors.textSecondary, size: 28),
                Icon(Icons.skip_previous, color: AppColors.textPrimary, size: 32),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.pause, color: AppColors.background, size: 32),
                ),
                Icon(Icons.skip_next, color: AppColors.textPrimary, size: 32),
                Icon(Icons.repeat, color: AppColors.textSecondary, size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CloudScreen extends StatelessWidget {
  const CloudScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Cloud'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCloudSection('Storage', '2.3 GB used of 5 GB'),
          _buildCloudItem('Sync Music', 'Auto-sync enabled', Icons.sync, true),
          _buildCloudItem('Backup Playlists', 'Last backup: 2 hours ago', Icons.backup, true),
          _buildCloudItem('Download Quality', 'High (320 kbps)', Icons.high_quality, false),
          _buildCloudItem('Offline Mode', 'Download for offline listening', Icons.offline_bolt, false),
        ],
      ),
    );
  }

  Widget _buildCloudSection(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.46,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloudItem(String title, String subtitle, IconData icon, bool isEnabled) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) {},
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuSection('Account'),
          _buildMenuItem('Profile', Icons.person, () {}),
          _buildMenuItem('Subscription', Icons.star, () {}),
          _buildMenuItem('Purchase History', Icons.receipt, () {}),

          _buildMenuSection('Preferences'),
          _buildMenuItem('Settings', Icons.settings, () {}),
          _buildMenuItem('Audio Quality', Icons.audiotrack, () {}),
          _buildMenuItem('Notifications', Icons.notifications, () {}),

          _buildMenuSection('Support'),
          _buildMenuItem('Help Center', Icons.help, () {}),
          _buildMenuItem('Contact Us', Icons.contact_support, () {}),
          _buildMenuItem('Rate App', Icons.rate_review, () {}),

          _buildMenuSection('Legal'),
          _buildMenuItem('Privacy Policy', Icons.privacy_tip, () {}),
          _buildMenuItem('Terms of Service', Icons.description, () {}),
          _buildMenuItem('About', Icons.info, () {}),
        ],
      ),
    );
  }

  Widget _buildMenuSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        tileColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Icon(icon, color: AppColors.textSecondary),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.textSecondary,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
