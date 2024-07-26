import 'package:flutter/material.dart';
import 'package:chat/component/rounded_buttons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen()';

  const WelcomeScreen({super.key});

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
      duration: const Duration(seconds: 1),
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
      appBar: AppBar(
        backgroundColor: animation.value,
        title: const Center(
          child: Text(
            'FlashChat',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      backgroundColor: animation.value,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 1,
                    child: SizedBox(
                      height: 60,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  AnimatedTextKit(
                    onTap: () {},
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 500),
                        'Flash Chat',
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                  text: 'Login',
                  boxColor: const Color(0xFF40C4FF),
                  nextPage: ('login')),
              RoundedButton(
                text: 'Register',
                boxColor: Colors.blueAccent,
                nextPage: ('registration'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
