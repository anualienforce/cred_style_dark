

import '../models/event_model.dart';

final List<EventModel> featuredEvents = [
  EventModel(
    id: 'evt1',
    title: 'Sufi Night - Nizami Brothers',
    bannerUrl: 'https://yourcdn.com/images/sufi_night_banner.jpg',
    location: 'Delhi, India',
    dateTime: DateTime(2025, 7, 30, 20, 00),
    category: 'Music',
    description: 'Experience the magic of Sufi vibes by Nizami Brothers with decor, traditional outfits and drinks.',
    price: 499.0,
    isFeatured: true,
  ),
  EventModel(
    id: 'evt2',
    title: 'Stand-up Night - Gaurav Gupta',
    bannerUrl: 'https://yourcdn.com/images/gaurav_gupta_banner.jpg',
    location: 'Mumbai, India',
    dateTime: DateTime(2025, 8, 2, 19, 30),
    category: 'Comedy',
    description: 'Get ready to laugh hard at Gaurav Gupta’s witty punchlines in this energetic comedy night.',
    price: 699.0,
  ),
  EventModel(
    id: 'evt3',
    title: 'Comedy Night with Parvinder Singh',
    bannerUrl: 'https://yourcdn.com/images/parvinder_banner.jpg',
    location: 'Chandigarh, India',
    dateTime: DateTime(2025, 8, 15, 18, 00),
    category: 'Comedy',
    description: 'Join the hilarious Parvinder Singh for a night of non-stop laughter and fun.',
    price: 599.0,
  ),
];
