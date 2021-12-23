import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_model.dart';

class SquareComponent extends StatefulWidget {
  final String id;
  final String tag;
  final Color colorTag;
  final PlayerModel playerModel;
  const SquareComponent({
    Key? key,
    required this.id,
    required this.tag,
    required this.colorTag,
    required this.playerModel,
  }) : super(key: key);

  @override
  State<SquareComponent> createState() => _SquareComponentState();
}

class _SquareComponentState extends State<SquareComponent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    void showTag() {
      setState(() {
        isSelected = isSelected ? isSelected : !isSelected;
      });
    }

    return InkWell(
      onTap: () {
        showTag();

        print(widget.id);
      },
      child: Container(
        child: isSelected
            ? Center(
                child: Text(
                  widget.tag,
                  style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: widget.colorTag),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(),
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(5),
      ),
    );
  }
}
