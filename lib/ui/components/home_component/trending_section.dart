import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors.dart';
import '../../../data/models/trending_model.dart';
import '../common/dot_indicator.dart';

class TrendingSection extends StatefulWidget {
  final List<TrendingModel> trending;
  final double height;
  final Function(TrendingModel)? onEventTap;
  final Duration autoScrollDuration;
  final bool enableAutoScroll;
  final bool pauseOnTouch;
  final double viewportFraction;

  const TrendingSection({
    super.key,
    required this.trending,
    this.height = 200, // Adjusted for a more typical banner height
    this.onEventTap,
    this.autoScrollDuration = const Duration(seconds: 4),
    this.enableAutoScroll = true,
    this.pauseOnTouch = true,
    this.viewportFraction = 0.9,
  });

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection>
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
    if (!widget.enableAutoScroll || widget.trending.length <= 1) return;

    _autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % widget.trending.length;
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
    if (widget.trending.isEmpty) {
      return SizedBox(height: widget.height);
    }

    Widget pageView = SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: widget.trending.length,
        itemBuilder: (context, index) {
          final event = widget.trending[index];
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        event.hAssets,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.card,
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
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
                          onTap: () => widget.onEventTap?.call(event),
                        ),
                      ),
                    ),
                  ],
                ),
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
              itemCount: widget.trending.length,
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