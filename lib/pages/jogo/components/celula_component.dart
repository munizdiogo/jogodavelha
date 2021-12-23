import 'package:flutter/material.dart';

class CelularComponent extends StatefulWidget {
  final String id;
  final String marcador;
  final Color colorMarcador;
  const CelularComponent({
    Key? key,
    required this.id,
    required this.marcador,
    required this.colorMarcador,
  }) : super(key: key);

  @override
  State<CelularComponent> createState() => _CelularComponentState();
}

class _CelularComponentState extends State<CelularComponent> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = isSelected ? isSelected : !isSelected;
        });
        print(widget.id);
      },
      child: Container(
        child: isSelected
            ? Center(
                child: Text(
                  widget.marcador,
                  style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: widget.colorMarcador),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(),
        height: 100,
        width: 100,
        margin: EdgeInsets.all(5),
      ),
    );
  }
}
