import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_app/src/extensions/extensions.dart';
import '../../../common_widgets/common_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  /// Title Animation Work
  /// It should take 0.5 second to animate and show

  late final AnimationController _titleAnimationController =
      AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> _titleAnimation = CurvedAnimation(
    parent: _titleAnimationController,
    curve: Curves.fastOutSlowIn,
  );

  animateTitle() async {
    await _titleAnimationController.forward();
  }

  /// Profile Picture Animation Work
  /// It should take 1 second to animate and show
  bool profileAvatarOpacity = false;
  double _profileSize = 20.0;

  updateProfilePictureVisibility() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        profileAvatarOpacity = true;
        _profileSize = 40;
      });
    });
  }

  /// Person Name Animation Work
  /// It should take 1.5 second to animate and show

  bool personNameVisibility = false;
  late AnimationController _personNameAnimationController;
  late Animation<Offset> _offsetPersonNameAnimation;

  animateUserNameText() {
    _personNameAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _offsetPersonNameAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _personNameAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        personNameVisibility = true;
      });
    });

    // Start the animation
    _personNameAnimationController.forward();
  }

  /// Greeting text Animation Work
  /// It should take 2 second to animate and show
  bool greetingsVisibility = false;
  late AnimationController _greetingsTextAnimationController;
  late Animation<Offset> _offsetGreetingsTextAnimation;

  animateGreetingsText() {
    _greetingsTextAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _offsetGreetingsTextAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _greetingsTextAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(seconds: 2), () {
      setState(() {
        greetingsVisibility = true;
      });
    });

    // Start the animation
    _greetingsTextAnimationController.forward();
  }

  /// Buy Card Animation Work
  /// It should take 2.5 second to animate and show

  bool buyCardVisibility = false;

  late final Animation<double> _buyAnimation;

  updateBuyCardVisibility() {
    _buyAnimation = CurvedAnimation(
      parent: _titleAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        buyCardVisibility = true;
      });
    });
  }

  /// RENT Card Animation Work
  /// It should take 3 second to animate and show
  bool rentCardVisibility = false;

  late final Animation<double> _rentAnimation;

  updateRentCardVisibility() {
    _rentAnimation = CurvedAnimation(
      parent: _titleAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    Timer(const Duration(seconds: 3), () {
      setState(() {
        rentCardVisibility = true;
      });
    });
  }

  /// Property First Card Animation Work
  /// It should take 3.5 second to animate and show
  bool firstPropertyCardVisibility = false;
  late AnimationController _firstCardAnimationController;
  late Animation<Offset> _firstCardAnimation;

  animateFirstPropertyCard() {
    _firstCardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _firstCardAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _firstCardAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(milliseconds: 3500), () {
      setState(() {
        firstPropertyCardVisibility = true;
      });
    });

    _firstCardAnimationController.forward();
  }

  /// Property Second Card Animation Work
  /// It should take 4 second to animate and show
  bool secondPropertyCardVisibility = false;
  late AnimationController _secondCardAnimationController;
  late Animation<Offset> _secondCardAnimation;

  animateSecondPropertyCard() {
    _secondCardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    _secondCardAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _secondCardAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        secondPropertyCardVisibility = true;
      });
    });

    _secondCardAnimationController.forward();
  }

  /// Property Third Card Animation Work
  /// It should take 4.5 second to animate and show
  bool thirdPropertyCardVisibility = false;
  late AnimationController _thirdCardAnimationController;
  late Animation<Offset> _thirdCardAnimation;

  animateThirdPropertyCard() {
    _thirdCardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _thirdCardAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _thirdCardAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(milliseconds: 4500), () {
      setState(() {
        thirdPropertyCardVisibility = true;
      });
    });

    _thirdCardAnimationController.forward();
  }

  /// Property Fourth Card Animation Work
  /// It should take 5 second to animate and show
  bool fourthPropertyCardVisibility = false;
  late AnimationController _fourthCardAnimationController;
  late Animation<Offset> _fourthCardAnimation;

  animateFourthPropertyCard() {
    _fourthCardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    );

    _fourthCardAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fourthCardAnimationController,
      curve: Curves.easeOut,
    ));

    Timer(const Duration(seconds: 5), () {
      setState(() {
        fourthPropertyCardVisibility = true;
      });
    });

    _fourthCardAnimationController.forward();
  }

  @override
  void initState() {
    super.initState();
    animateTitle();
    updateProfilePictureVisibility();
    animateUserNameText();
    animateGreetingsText();
    updateBuyCardVisibility();
    updateRentCardVisibility();
    animateFirstPropertyCard();
    animateSecondPropertyCard();
    animateThirdPropertyCard();
    animateFourthPropertyCard();
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    _personNameAnimationController.dispose();
    _greetingsTextAnimationController.dispose();
    _firstCardAnimationController.dispose();
    _secondCardAnimationController.dispose();
    _thirdCardAnimationController.dispose();
    _fourthCardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f9e9d6"),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#f9e9d6"),
        title: SizeTransition(
          sizeFactor: _titleAnimation,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/location_pin.svg",
                    height: 15,
                    width: 15,
                    color: HexColor("#a79882"),
                  ),
                  4.width,
                  CommonTextWidget(
                    text: 'Saint Petersburg',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: HexColor("#a79882"),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Visibility(
            visible: profileAvatarOpacity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              width: _profileSize,
              height: _profileSize,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/profile.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          22.width,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: ListView(
          children: [
            Visibility(
              visible: personNameVisibility,
              child: SlideTransition(
                position: _offsetPersonNameAnimation,
                child: CommonTextWidget(
                  text: 'Hi, Marina',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  textColor: HexColor("#a79882"),
                ),
              ),
            ),
            2.height,
            Visibility(
              visible: greetingsVisibility,
              child: SlideTransition(
                position: _offsetGreetingsTextAnimation,
                child: CommonTextWidget(
                  text: "let's select your \nperfect place",
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  textColor: HexColor("#232220"),
                ),
              ),
            ),
            16.height,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: buyCardVisibility,
                    child: ScaleTransition(
                      scale: _buyAnimation,
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor('#FFA500'),
                        ),
                        child: Column(
                          children: [
                            20.height,
                            CommonTextWidget(
                              text: "BUY",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: HexColor("#FFFFFF"),
                            ),
                            28.height,
                            TweenAnimationBuilder<int>(
                              tween: IntTween(
                                begin: 0,
                                end: 1034,
                              ),
                              duration: const Duration(seconds: 1),
                              builder: (context, value, child) {
                                return CommonTextWidget(
                                  text: value.toString(),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  textColor: HexColor("#FFFFFF"),
                                );
                              },
                            ),
                            4.height,
                            CommonTextWidget(
                              text: "offers",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: HexColor("#FFFFFF"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                8.width,
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: rentCardVisibility,
                    child: ScaleTransition(
                      scale: _rentAnimation,
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Column(
                          children: [
                            20.height,
                            CommonTextWidget(
                              text: "RENT",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: HexColor("#A5975E"),
                            ),
                            28.height,
                            TweenAnimationBuilder<int>(
                              tween: IntTween(
                                begin: 0,
                                end: 2212,
                              ),
                              duration: const Duration(seconds: 1),
                              builder: (context, value, child) {
                                return CommonTextWidget(
                                  text: value.toString(),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  textColor: HexColor("#A5975E"),
                                );
                              },
                            ),
                            4.height,
                            CommonTextWidget(
                              text: "offers",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              textColor: HexColor("#A5975E"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            16.height,
            Visibility(
              visible: firstPropertyCardVisibility,
              child: SlideTransition(
                position: _firstCardAnimation,
                child: const PropertyCard(
                  imageUrl: "assets/image1.jpg",
                  address: 'Gladkova St., 25',
                  height: 200,
                ),
              ),
            ),
            16.height,

            SizedBox(
              height: 400,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Visibility(
                      visible: secondPropertyCardVisibility,
                      child: SlideTransition(
                        position: _secondCardAnimation,
                        child: const PropertyCard(
                          imageUrl: "assets/image2.jpg",
                          address: 'Trefoleva St., 43',
                          height: 400,

                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Visibility(
                          visible: thirdPropertyCardVisibility,
                          child: SlideTransition(
                            position: _thirdCardAnimation,
                            child: const PropertyCard(
                              imageUrl: "assets/image3.jpg",
                              address: 'Islamabad F10',
                              height: 190,

                            ),
                          ),
                        ),
                        Visibility(
                          visible: fourthPropertyCardVisibility,
                          child: SlideTransition(
                            position: _fourthCardAnimation,
                            child: const PropertyCard(
                              imageUrl: "assets/image4.jpg",
                              address: 'Islamabad',
                              height: 190,

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String address;
  final double height;


  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.address,
    required this.height,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1F1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              height: height,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 4,
              left: 4,
              bottom: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: HexColor("#d7c4b4"),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    2.width,
                    CommonTextWidget(
                      text: address,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textColor: HexColor("#000000"),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        backgroundColor: HexColor("#fbf5eb"),
                        child: Icon(
                          Icons.navigate_next,
                          color: HexColor("#a99d90"),
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
