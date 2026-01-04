import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class StatsCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> summaryCards;
  final List<Color>? colorsGradients;
  const StatsCarousel({
    Key? key,
    required this.summaryCards,
    this.colorsGradients,
  }) : super(key: key);

  @override
  State<StatsCarousel> createState() => _StatsCarouselState();
}

class _StatsCarouselState extends State<StatsCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoSlideTimer;

  List<Map<String, dynamic>> _summaryCards = [
    {
      "title": "Total Events",
      "count": '240',
      "subtext": "All-time Event organised",
      "chartData": [3, 5, 8, 6, 9, 10, 12],
    },
    {
      "title": "Active Events",
      "count": '6',
      "subtext": "Currently in progress",
      "chartData": [2, 4, 3, 5, 6, 4, 7],
    },
    {
      "title": "Upcoming Events",
      "count": '225',
      "subtext": "Events Still Anticipated",
      "chartData": [4, 5, 7, 8, 9, 10, 11],
    },
    {
      "title": "Past Events",
      "count": '9',
      "subtext": "Orders cancelled by client or vendor",
      "chartData": [1, 2, 1, 2, 1, 1, 2],
    },
    {
      "title": "Revenue Generated",
      "count": "₦350,000",
      "subtext": "Orders cancelled by client or vendor",
      "chartData": [1, 2, 1, 2, 1, 1, 2],
    },
  ];

  @override
  void initState() {
    super.initState();
    _summaryCards = widget.summaryCards ?? _summaryCards;
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _summaryCards.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoSlideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xFF1C86FF), Color(0xFF4FA3FF), Color(0xFF8EC9FF)],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Positioned(
          //   top: -100,
          //   right: -60,
          //   child: Opacity(
          //     opacity: 0.6,
          //     child: Image.asset(
          //       'assets/images/card_bg.png',
          //       width: 242.15,
          //       height: 207.38,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.summaryCards.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      final item = widget.summaryCards[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["name"],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${item["count"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_summaryCards.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 16 : 6,
                      height: 3,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? ColorsConstant.blueBorder
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
