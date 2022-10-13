import 'package:flutter/material.dart';
import 'package:bar_graph_app/screens/screen_bar_graph.dart';
import "package:bar_graph_app/animations/saturnLoading.dart";
import "dart:async";
import "dart:math";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  Future<Timer> moveScreen() async {
    onDoneLoading() async {
      Navigator.of(context).pushNamed("/bar_graph");
    }

    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        Tween<double>(begin: 0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();
    moveScreen();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/circle.png',
                      width: 100,
                      height: 100,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/sunny.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Transform.rotate(
                        angle: _animation!.value,
                        //* Transfrom.rotate의 origin: 회전의 기준점 설정하기
                        origin: Offset(35, 35),
                        child: Image.asset(
                          'assets/images/saturn.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
