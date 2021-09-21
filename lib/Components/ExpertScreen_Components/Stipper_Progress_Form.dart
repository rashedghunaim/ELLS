import 'package:flutter/material.dart';
import 'package:graduation/Dummy_Data/Fake_Respositery.dart';
import 'Stipper_Progress_Title.dart';

class StipperForm extends StatefulWidget {
  final List<Widget> sections;
  final List<StipperTitle> title;
  PFormController controller;
  Color activeColor, disabledColor;
  final double leftExpantionLefting;
  final Color activeIconColor;
  final Color notActiveIconColor;
  final Color activeDividerColor;
  final Color notActiveDivivderColor;
  StipperForm(
      {this.sections,
      this.title,
      this.controller,
      this.leftExpantionLefting,
      this.activeDividerColor,
      this.activeIconColor,
      this.notActiveDivivderColor,
      this.notActiveIconColor,
      this.activeColor = Colors.green,
      this.disabledColor = Colors.grey});
  @override
  _StipperFormState createState() => _StipperFormState();
}

class _StipperFormState extends State<StipperForm>
    with TickerProviderStateMixin {
  List<Map<String, String>> formHeaders = [
    {'title': 'Expert Application ', 'subtitle': 'series of questions '},
    {
      'title': 'Rating Application',
      'subtitle': 'Approve or Reject the idea'
    },
    {'title': 'Expert FeedBack ', 'subtitle': 'your personal point of view'},
    {
      'title': 'Managment FeedBack',
      'subtitle': 'giving constructive suggestions'
    },
    {
      'title': 'Revise and Resubmit',
      'subtitle': 'revisions are not substantial '
    }
  ];
  final iconsData = FakeRepository.iconsData;
  List<AnimationController> _controllers;
  List<Animation<double>> _animations;
  List<Animation<double>> _animationsOpavity;
  List<bool> activeColor;
  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      widget.sections.length,
      (index) => AnimationController(
          vsync: this, duration: Duration(milliseconds: 200), lowerBound: .1),
    );

    _animations = _controllers
        .map((_controller) =>
            Tween<double>(begin: .05, end: 1).animate(_controller))
        .toList();

    _animationsOpavity = _controllers
        .map((_controller) =>
            Tween<double>(begin: 0, end: 1).animate(_controller))
        .toList();

    activeColor = List.generate(widget.sections.length, (index) => false);

    if (widget.controller != null) {
      widget.controller.addListener(() {
        controlColor(widget.controller.currentSection);
      });
    }
  }

  controlColor(int index) {
    for (var i = 0; i < activeColor.length; i++) {
      if (index == i) {
        if (_controllers[index].isCompleted)
          _controllers[index].reverse();
        else
          _controllers[index].animateTo(1);
      } else {
        if (_controllers[i].isCompleted) _controllers[i].reverse();
      }
    }
    for (var i = 0; i <= index; i++) {
      activeColor[i] = true;
    }
    for (var i = index + 1; i < activeColor.length; i++) {
      activeColor[i] = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _controllers.forEach((c) {
      c.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.sections.map(
          (e) {
            int index = widget.sections.indexOf(e);
            return Stack(
              children: [
                if (index != widget.sections.length - 1)
                  Padding(
                    padding: EdgeInsets.only(left: 250),
                    child: Container(
                      margin: EdgeInsets.only(left: 2, top: 60),
                      child: SizeTransition(
                        sizeFactor: _animations[index],
                        child: Container(
                          margin: EdgeInsets.only(left: 0.0, right: 20),
                          height: 600,
                          width: 0.9,
                          color: activeColor[index]
                              ? widget.activeDividerColor
                              : widget.notActiveDivivderColor,
                        ),
                      ),
                    ),
                  ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 13),
                          child: Container(
                            width: 200,
                            child: InkWell(
                              onTap: () {
                                for (var i = 0;
                                    i < widget.sections.length;
                                    i++) {
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
                              child: Left(
                                title: formHeaders[index]['title'],
                                subtitle: formHeaders[index]['subtitle'],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            controlColor(index);
                          },
                          child: Container(
                            child: Icon(
                              iconsData[index].icon,
                              size: 25,
                              color: activeColor[index]
                                  ? widget.activeIconColor
                                  : widget.notActiveIconColor,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              border: Border.all(
                                  color: activeColor[index]
                                      ? widget.activeIconColor
                                      : widget.notActiveIconColor,
                                  width: 0.7),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        widget.title[index].copyWith(
                            activeColor: activeColor[index]
                                ? Colors.blue
                                : Colors.transparent),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: widget.leftExpantionLefting,
                        ),
                        Expanded(
                          child: FadeTransition(
                            opacity: _animationsOpavity[index],
                            child: SizeTransition(
                              sizeFactor: _animations[index],
                              child: e,
                            ),
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

class PFormController extends ChangeNotifier {
  PFormController(this.length);
  int _section = -1;
  int length;

  nextSection() {
    if (_section < length - 1) _section++;
    notifyListeners();
  }

  get currentSection => _section;
  set jumpToNextSection(int s) {
    _section = s;
    notifyListeners();
  }

  prefSection() {
    if (_section > 0) _section--;
    notifyListeners();
  }
}

class Left extends StatelessWidget {
  final String title, subtitle;
  Left({this.subtitle, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
