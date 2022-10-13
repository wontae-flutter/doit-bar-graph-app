import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bar_graph_app/providers/provider_people.dart';
import 'package:bar_graph_app/screens/screen_cake.dart';

class BarGraphScreen extends StatefulWidget {
  const BarGraphScreen({super.key});

  @override
  State<BarGraphScreen> createState() => _BarGraphScreenState();
}

class _BarGraphScreenState extends State<BarGraphScreen> {
  double _opacity = 0;
  int current = 0;
  //* 색상 변경할 수 있는
  Color weightColor = Colors.blue;
  void _changeWeightColor(double weight) {
    if (weight < 40) {
      weightColor = Colors.blueAccent;
    } else if (weight < 60) {
      weightColor = Colors.indigo;
    } else if (weight < 80) {
      weightColor = Colors.orange;
    } else {
      weightColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    PeopleProvider peopleProvider = Provider.of<PeopleProvider>(context);
    return FutureBuilder(
      future: peopleProvider.fetchPeople(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Animation Example"),
          ),
          body: peopleProvider.peoples.length != 0
              ? Container(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: _opacity,
                        duration: Duration(seconds: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 100,
                                child: Text(
                                    '이름 : ${peopleProvider.peoples[current].name}')),
                            AnimatedContainer(
                              duration: Duration(seconds: 2),
                              curve: Curves.bounceIn,
                              color: Colors.amber,
                              child: Text(
                                '키 \n ${peopleProvider.peoples[current].height}',
                                textAlign: TextAlign.center,
                              ),
                              width: 50,
                              height: peopleProvider.peoples[current].height,
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInCubic,
                              color: weightColor,
                              child: Text(
                                '몸무게 \n ${peopleProvider.peoples[current].weight}',
                                textAlign: TextAlign.center,
                              ),
                              width: 50,
                              height: peopleProvider.peoples[current].weight,
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 2),
                              curve: Curves.linear,
                              color: Colors.pinkAccent,
                              child: Text(
                                'bmi ${peopleProvider.peoples[current].bmi.toString().substring(0, 2)}',
                                textAlign: TextAlign.center,
                              ),
                              width: 50,
                              height: peopleProvider.peoples[current].bmi,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (current <
                                      peopleProvider.peoples.length - 1) {
                                    current++;
                                  }
                                  _changeWeightColor(
                                      peopleProvider.peoples[current].weight);
                                });
                              },
                              child: Text('다음')),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (current > 0) {
                                    current--;
                                  }
                                  _changeWeightColor(
                                      peopleProvider.peoples[current].weight);
                                });
                              },
                              child: Text('이전')),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _opacity == 1 ? _opacity = 0 : _opacity = 1;
                                });
                              },
                              child: Text('사라지기')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("/cake");
                              },
                              child: SizedBox(
                                width: 200,
                                child: Row(children: [
                                  //* tag를 통해 다른 Hero 위젯과 연결할 수 있다
                                  Hero(tag: "detail", child: Icon(Icons.cake))
                                ]),
                              )),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/sliver");
                            },
                            child: Text("Sliver"),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
