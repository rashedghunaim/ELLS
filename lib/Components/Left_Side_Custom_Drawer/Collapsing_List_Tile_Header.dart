

import 'package:flutter/material.dart';
import 'package:graduation/Custom_Config/Theme.dart';

class CollapsingListTileHeader extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTap;

  CollapsingListTileHeader(
      {@required this.title,
      @required this.icon,
      @required this.animationController,
      this.isSelected = false,
      this.onTap,});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTileHeader> {
  Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 200, end: 70).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 20, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        //padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        padding: EdgeInsets.only(top: 20),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color:
                  widget.isSelected ? MyColors.selectedColor : Colors.white30,
              size: 30.0,
            ),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= 190)
                ? Text(
                    widget.title,
                    style: widget.isSelected
                        ? MyTextStyles.listTitleSelectedTextStyle
                        : MyTextStyles.listTitleDefaultTextStyle,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
