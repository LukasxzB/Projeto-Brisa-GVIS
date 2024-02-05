import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormBodyBloc {
  static final _instance = LoginFormBodyBloc._constructor();
  factory LoginFormBodyBloc() => _instance;
  LoginFormBodyBloc._constructor();

  final _pageControllerStream = BehaviorSubject<PageController>.seeded(
    PageController(initialPage: 0),
  );

  Stream<PageController> get pageControllerStream =>
      _pageControllerStream.stream;

  PageController get pageControllerValue => _pageControllerStream.value;

  void nextPage() {
    _pageControllerStream.value.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }
}
