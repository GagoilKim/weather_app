import 'package:flutter/material.dart';
import 'list.dart';

class ClothePage extends StatelessWidget {
  Clothe clothe;

  ClothePage(this.clothe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.clothe.name),
      ),
      body: new Column(
        children: <Widget>[Text(this.clothe.name)],
      ),
    );
  }
}
