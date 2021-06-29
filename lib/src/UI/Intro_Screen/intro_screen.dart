import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:shield/src/UI/Signup_Screen/Signup_Screen.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

// ------------------ Custom config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
          maxLineTitle: 2,
          styleTitle: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono'),
          description: "hola",
          styleDescription: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway'),
          marginDescription:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/img1.jpg"),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
          backgroundColor: Colors.white),
    );
    slides.add(
      new Slide(
          maxLineTitle: 2,
          styleTitle: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono'),
          description: "hello",
          styleDescription: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway'),
          marginDescription:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/img2.jpg"),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
          backgroundColor: Colors.white),
    );
    slides.add(
      new Slide(
          maxLineTitle: 2,
          styleTitle: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono'),
          description: "bonjour",
          styleDescription: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Raleway'),
          marginDescription:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/img3.jpg"),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
          backgroundColor: Colors.white),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.orange[700],
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.orange[700],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.orange[700],
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
      overlayColor: MaterialStateProperty.all<Color>(Colors.yellow),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Colors.yellowAccent,
      colorActiveDot: Colors.orange,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
