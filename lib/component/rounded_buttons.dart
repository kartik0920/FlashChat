import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  RoundedButton({super.key, this.text, this.boxColor, this.nextPage});

  String? text;
  Color? boxColor;
  String? nextPage;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  late Color color1;
  late String text1;
  late String nextpage1;

  @override
  void initState() {
    super.initState();
    getUpdate();
  }

  void getUpdate() {
    color1 = (widget.boxColor)!;
    text1 = (widget.text)!;
    nextpage1 = (widget.nextPage)!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color1,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, '/$nextpage1');
            });
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text1,
          ),
        ),
      ),
    );
  }
}
