import 'package:flutter/material.dart';
import 'package:bar_graph_app/animations/sliver_header.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({super.key});

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //* 스크롤에 따라 높이가 달라지거나 다른 위젯 위에 표시되도록 할 수 있습니다.
          SliverAppBar(
            pinned: true, //* 앱바가 사라지지 않고 최소의 크기로 pinned
            expandedHeight: 150.0, //* 최대높이
            flexibleSpace: FlexibleSpaceBar(
              //* 유연하게 조절되는 공간
              title: Text("Sliver Example"),
              background: Image.asset("assets/images/sunny.png"),
            ),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          SliverPersistentHeader(
            delegate: HeaderDelegate(
                minHeight: 50,
                maxHeight: 150,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        "list 숫자",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  )),
                )),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              customCard(text: "1"),
              customCard(text: "2"),
              customCard(text: "3"),
              customCard(text: "4"),
            ]),
          ),
          SliverPersistentHeader(
            delegate: HeaderDelegate(
                minHeight: 50,
                maxHeight: 150,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        "grid 숫자",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  )),
                )),
            pinned: true,
          ),
          SliverGrid(
            delegate: SliverChildListDelegate([
              customCard(text: "5"),
              customCard(text: "6"),
              customCard(text: "7"),
              customCard(text: "8"),
            ]),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ],
      ),
    );
  }
}

class customCard extends StatelessWidget {
  final String text;
  const customCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 120,
        height: 120,
        child: Center(child: Text(text, style: TextStyle(fontSize: 40))),
      ),
    );
  }
}
