import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';

class StrepperDemo2 extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Color(MyColors.drakBlue),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PForm(
                //   pages: [
                //     Text('Page 1 '),
                //     Text('Page 2 '),
                //     Text('Page 3 '),
                //     Text('Page 3 '),
                //   ],
                //   title: [
                //     PTitle(),
                //     PTitle(),
                //     PTitle(),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PForm extends StatefulWidget {
  final List<Widget> pages;
  final List<PTitle> title;
  PForm({this.pages, this.title});
  @override
  _PFormState createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin {
  final iconsData = FakeRepository.iconsData;
  int indexx = 0;
  List<AnimationController> _controllers;
  List<Animation<double>> _animations;
  List<Animation<double>> _animationsOpavity;
  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
        widget.pages.length,
        (index) => AnimationController(
            vsync: this, duration: Duration(milliseconds: 200), lowerBound: 0));

    _animations = _controllers
        .map((_controller) =>
            Tween<double>(begin: .1, end: 1).animate(_controller))
        .toList();

    _animationsOpavity = _controllers
        .map((_controller) =>
            Tween<double>(begin: 0, end: 1).animate(_controller))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.pages.map(
          (e) {
            int index = widget.pages.indexOf(e);
            return Stack(
              children: [
                if (index != widget.pages.length - 1)
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Container(
                      margin: EdgeInsets.only(left: 2, top: 37),
                      child: SizeTransition(
                        sizeFactor: _animations[index],
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 20),
                            height: 300,
                            width: 3,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            for (var i = 0; i < widget.pages.length; i++) {
                              if (index == i) {
                                if (_controllers[index].isCompleted)
                                  _controllers[index].reverse();
                                else
                                  _controllers[index].animateTo(1);
                              } else {
                                if (_controllers[i].isCompleted)
                                  _controllers[i].reverse();
                              }
                              setState(() {});
                            }
                          },
                          child: Container(
                              height: 50, width: 50, color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            for (var i = 0; i < widget.pages.length; i++) {
                              if (index == i) {
                                if (_controllers[index].isCompleted)
                                  _controllers[index].reverse();
                                else
                                  _controllers[index].animateTo(1);
                              } else {
                                if (_controllers[i].isCompleted)
                                  _controllers[i].reverse();
                              }
                              setState(() {});
                            }
                          },
                          child: Container(
                            child: Icon(iconsData[index].icon),
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //هون الشغل
                      children: [
                        SizedBox(
                          width: 500,
                        ),
                        Expanded(
                          child: FadeTransition(
                            opacity: _animationsOpavity[index],
                            child: e,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}

class PTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
