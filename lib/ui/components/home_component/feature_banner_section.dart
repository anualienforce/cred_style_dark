import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors.dart';
import '../../../data/models/event_model.dart';
import '../common/dot_indicator.dart';

class EventCarousel extends StatefulWidget {
  final List<EventModel> events;
  final double height;
  final Function(EventModel)? onEventTap;
  final Duration autoScrollDuration;
  final bool enableAutoScroll;
  final bool pauseOnTouch;
  final double viewportFraction;

  const EventCarousel({
    super.key,
    required this.events,
    this.height = 400,
    this.onEventTap,
    this.autoScrollDuration = const Duration(seconds: 4),
    this.enableAutoScroll = true,
    this.pauseOnTouch = true,
    this.viewportFraction = 0.8,
  });

  @override
  State<EventCarousel> createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;
  late AnimationController _dotAnimationController;
  late Animation<double> _dotAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: 0,
    );

    _dotAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _dotAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _dotAnimationController,
      curve: Curves.easeInOut,
    ));

    if (widget.enableAutoScroll) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    if (!widget.enableAutoScroll || widget.events.length <= 1) return;

    _autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % widget.events.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    _dotAnimationController.reset();
    _dotAnimationController.forward();

    if (widget.enableAutoScroll) {
      _startAutoScroll();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer?.cancel();
    _dotAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.events.isEmpty) {
      return SizedBox(height: widget.height);
    }

    Widget pageView = SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          final event = widget.events[index];
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = (_pageController.page ?? 0.0) - index;
                value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
              }
              return Transform.scale(scale: value, child: child);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.card,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(event.bannerUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            event.title,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            event.title,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => widget.onEventTap?.call(event),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    return Column(
      children: [
        if (widget.pauseOnTouch)
          GestureDetector(
            onPanDown: (_) => _stopAutoScroll(),
            onPanCancel: () => _startAutoScroll(),
            onPanEnd: (_) => _startAutoScroll(),
            child: pageView,
          )
        else
          pageView,
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _dotAnimation,
          builder: (context, child) {
            return AnimatedDotIndicator(
              currentIndex: _currentIndex,
              itemCount: widget.events.length,
              activeColor: AppColors.primary,
              inactiveColor: Colors.white.withOpacity(0.4),
              animationValue: _dotAnimation.value,
            );
          },
        ),
      ],
    );
  }
}