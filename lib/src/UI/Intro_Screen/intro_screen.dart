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
          description:
              "Here Is Team Shield To Protect Women From Harrasment And Abuse ",
          styleDescription: TextStyle(
              color: Colors.black, fontSize: 30.0, fontFamily: 'RobotoMono'),
          marginDescription:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/warrior.png"),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
          backgroundColor: Colors.white),
    );

    slides.add(
      new Slide(
          description:
              "AI integration increases the accuracy to analyse and eliminate fake alerts with several type of triggers",
          styleDescription: TextStyle(
              color: Colors.black, fontSize: 30.0, fontFamily: 'RobotoMono'),
          marginDescription:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/ai.jpg"),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
          backgroundColor: Colors.white),
    );
    slides.add(
      new Slide(
          description:
              "Alerts are sent to emergency contacts and police authorities along with the system location",
          styleDescription: TextStyle(
              color: Colors.black, fontSize: 30.0, fontFamily: 'RobotoMono'),
          marginDescription: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/virtual-assistant.png"),
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
          backgroundColor: Colors.white),
    );
    slides.add(
      new Slide(
          description:
              "Special features for digital / phone call abuse can be reported and the suspected caller IDs after analysis will be sent to required authority",
          styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
          marginDescription:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
          centerWidget: Image.asset("assets/social.png"),
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
      size: 35,
      color: Colors.orange[700],
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      size: 35,
      color: Colors.orange[700],
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.lightBlue.shade200),
      overlayColor: MaterialStateProperty.all<Color>(Colors.lightBlue.shade200),
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
      colorDot: Colors.lightBlue,
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
