import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnBoardingProvider extends ChangeNotifier {
  final ChangeNotifierProviderRef ref;
  late TickerProvider vsync;
  late AnimationController _controller;
  late Animation _animation;
  late Animation _secondAnimation;
  late Animation _lastAnimation;
  int _currentPageIndex = 0;

  PageController pageController = PageController(initialPage: 0);
  int get currentPageIndex => _currentPageIndex;

  void changePageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  OnBoardingProvider(this.ref);
  void handler(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ));

      _secondAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.fastOutSlowIn),
      ))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {}
        });
      _lastAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      ));
      //_controller.forward();
    }

    // _controller.forward();
  }

  void init(TickerProvider tickerProvider) {
    vsync = tickerProvider;
    //notifyListeners();
    _controller =
        AnimationController(vsync: vsync, duration: const Duration(seconds: 2));

    _animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addStatusListener(handler);

    _secondAnimation = Tween(begin: -3.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.fastOutSlowIn)));
    _lastAnimation = Tween(begin: -3.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn)));

    notifyListeners();
  }

  void startAnimation() {
    _controller.forward();
  }

  Animation get animation => _animation;

  Animation get secondAnimation => _secondAnimation;

  Animation get lastAnimation => _lastAnimation;
  AnimationController get controller => _controller;
}

final onBoardingProvider = ChangeNotifierProvider<OnBoardingProvider>(
    (ref) => OnBoardingProvider(ref));
