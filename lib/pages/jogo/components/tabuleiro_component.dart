import 'package:flutter/material.dart';
import 'package:jogodavelha/pages/jogo/components/celula_component.dart';

class TabuleiroComponent extends StatefulWidget {
  const TabuleiroComponent({Key? key}) : super(key: key);

  @override
  _TabuleiroComponentState createState() => _TabuleiroComponentState();
}

class _TabuleiroComponentState extends State<TabuleiroComponent> {
  @override
  Widget build(BuildContext context) {
    var colorLine = Theme.of(context).primaryColorLight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CelularComponent(
              id: 'a1',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
            Container(height: 110, width: 4, color: colorLine),
            CelularComponent(
              id: 'a2',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
            Container(height: 110, width: 4, color: colorLine),
            CelularComponent(
              id: 'a3',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
          ],
        ),
        Container(height: 4, width: 340, color: colorLine),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CelularComponent(
              id: 'b1',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
            Container(height: 110, width: 4, color: colorLine),
            CelularComponent(
              id: 'b2',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
            Container(height: 110, width: 4, color: colorLine),
            CelularComponent(
              id: 'b3',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
          ],
        ),
        Container(height: 4, width: 340, color: colorLine),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CelularComponent(
              id: 'c1',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
            Container(height: 110, width: 4, color: colorLine),
            CelularComponent(
              id: 'c2',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
            Container(height: 110, width: 4, color: colorLine),
            CelularComponent(
              id: 'c3',
              marcador: 'X',
              colorMarcador: Colors.lightBlue,
            ),
          ],
        ),
      ],
    );
  }
}
