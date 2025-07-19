import 'package:dark_cred/ui/components/common/section_title_row.dart';
import 'package:dark_cred/ui/components/header/home_header.dart';
import 'package:dark_cred/ui/components/home_component/artists_section.dart';
import 'package:dark_cred/ui/components/home_component/featured_category_section.dart';
import 'package:dark_cred/ui/components/nav_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../data/dummy_data/event_data.dart';
import '../components/home_component/feature_banner_section.dart';
import '../components/home_component/upcoming_events_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    HomeScreen(),
    LibraryScreen(),
    PlayerScreen(),
    CloudScreen(),
    MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(userName: 'Mayur Vihar',
          location: 'Lucknow, India'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionTitleRow(title: 'Featured Events'),
            EventCarousel(
              events: featuredEvents,
              height: 500,
            ),
            SectionTitleRow(title: 'Featured Category'),
            FeaturedCategorySection(),
            SectionTitleRow(title: 'Upcoming Events'),
            UpcomingEventsSection(),
            SectionTitleRow(title: 'Artists on Tixoo'),
            ArtistsSection()
          ],
        ),
      ),
    );
  }
}
