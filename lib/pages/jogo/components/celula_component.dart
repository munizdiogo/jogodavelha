import 'package:flutter/material.dart';
import 'package:jogodavelha/controllers/player_model.dart';

class CelularComponent extends StatefulWidget {
  final String id;
  final String marcador;
  final Color colorMarcador;
  final PlayerModel playerModel;
  const CelularComponent({
    Key? key,
    required this.id,
    required this.marcador,
    required this.colorMarcador,
    required this.playerModel,
  }) : super(key: key);

  @override
  State<CelularComponent> createState() => _CelularComponentState();
}

class _CelularComponentState extends State<CelularComponent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    void showMarcador() {
      setState(() {
        isSelected = isSelected ? isSelected : !isSelected;
      });
    }

    return InkWell(
      onTap: () {
        showMarcador();

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
        margin: const EdgeInsets.all(5),
      ),
    );
  }
}
