import 'package:flutter/material.dart';

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
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver Example"),
              background: Image.asset("assets/images/sunny.png"),
            ),
            backgroundColor: Colors.deepOrangeAccent,
          )
        ],
      ),
    );
  }
}
