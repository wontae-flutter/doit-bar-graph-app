import 'package:flutter/material.dart';
import 'dart:math';

class CakeScreen extends StatefulWidget {
  const CakeScreen({super.key});

  @override
  State<CakeScreen> createState() => _CakeScreenState();
}

class _CakeScreenState extends State<CakeScreen>
    with SingleTickerProviderStateMixin {
  //* 애니메이션컨트롤러를 사용하기 위해서는 꼭 SingleTickerProviderStateMixin를 추가로 상속해야 한다
  AnimationController? _animationController;
  //* 60fps에 맞춰 1초에 60번 새로운 값을 생성합니다
  Animation? _rotateAnimation;
  Animation? _scaleAnimation;
  Animation? _transAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this, //* vsync: 애니메이션을 표현할 대상
    );
    //* 기본적인 범위는 0.0~1.0인데, 이를 커스터마이즈하고싶으면 Tween객체를 사용할 수 있다
    _rotateAnimation =
        Tween<double>(begin: 0, end: pi * 10).animate(_animationController!);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0).animate(_animationController!);
    _transAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(200, 200))
        .animate(_animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Example2"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _rotateAnimation!,
              builder: (context, widget) {
                return Transform.translate(
                  offset: _transAnimation!.value,
                  child: Transform.rotate(
                      angle: _rotateAnimation!.value,
                      child: Transform.scale(
                        scale: _scaleAnimation!.value,
                        child: widget,
                      )),
                );
              },
              child: Hero(
                  tag: 'detail',
                  child: Icon(
                    Icons.cake,
                    size: 300,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                _animationController!.forward();
              },
              child: Text('로테이션 시작하기'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
