import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../common_widgets/common_widgets.dart';
import '../../features.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_state.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  bool bottomNavBarVisibility = false;
  late AnimationController _bottomNavAnimationController;
  late Animation<Offset> _bottomNavBarAnimation;

  animateBottomNavigationBarView() {
    _bottomNavAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _bottomNavBarAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _bottomNavAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(milliseconds: 5500), () {
      setState(() {
        bottomNavBarVisibility = true;
      });
    });

    _bottomNavAnimationController.forward();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const SearchPage(),
    const Text('Message Screen'),
    const HomePage(),
    const Text('Likes Screen'),
    const Text('Profile Screen'),
  ];

  @override
  void initState() {
    FlutterNativeSplash.remove();
    animateBottomNavigationBarView();
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          int selectedIndex = 2; // Default to the home screen
          if (state is DashboardSuccess) {
            selectedIndex = state.selectedIndex;
          }
          return _widgetOptions.elementAt(selectedIndex);
        },
      ),
      bottomNavigationBar: Visibility(
        visible: bottomNavBarVisibility,
        child: SlideTransition(
          position: _bottomNavBarAnimation,
          child: const BottomNavBarWidget(),
        ),
      ),
    );
  }
}
