import 'package:flutter/material.dart';
import 'package:flashchat/component/rounded_buttons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen()';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

late AnimationController controller;
late Animation animation;

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller.forward();
    animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);
    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 1,
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  onTap: () {},
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 500),
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                text: 'Login',
                boxColor: Color(0xFF40C4FF),
                nextPage: ('login')),
            RoundedButton(
                text: 'Register',
                boxColor: Colors.blueAccent,
                nextPage: ('registration')),
          ],
        ),
      ),
    );
  }
}
