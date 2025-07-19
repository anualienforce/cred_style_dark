import 'package:dark_cred/data/dummy_data/artist_data.dart';
import 'package:dark_cred/data/dummy_data/category_data.dart';
import 'package:dark_cred/data/dummy_data/trending_data.dart';
import 'package:dark_cred/ui/components/common/section_title_row.dart';
import 'package:dark_cred/ui/components/header/home_header.dart';
import 'package:dark_cred/ui/components/home_component/artists_section.dart';
import 'package:dark_cred/ui/components/home_component/featured_category_section.dart';
import 'package:dark_cred/ui/components/home_component/trending_section.dart';
import 'package:dark_cred/ui/components/nav_bar/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../data/dummy_data/event_data.dart';
import '../components/home_component/feature_banner_section.dart';
import '../components/home_component/popular_events_section.dart';
import '../components/home_component/upcoming_events_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(userName: 'Mayur Vihar',
          location: 'Lucknow, India'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            SectionTitleRow(title: 'Featured Events'),
            EventCarousel(
              events: featuredEvents,
              height: 500,
            ),
            SectionTitleRow(title: 'Featured Category'),
            FeaturedCategorySection(categories: eventCategories,),
            SectionTitleRow(title: 'Upcoming Events'),
            UpcomingEventsSection(events: featuredEvents,),
            SectionTitleRow(title: 'Artists on Tixoo'),
            ArtistsSection(artists: artists,),
            SectionTitleRow(title: 'Trending'),
            TrendingSection(trending: trending, height: 250),
            SectionTitleRow(title: 'Popular Events'),
            PopularEventsSection(events: featuredEvents,),
          ],
        ),
      ),
    );
  }
}
