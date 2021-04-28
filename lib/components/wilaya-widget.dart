import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WilayaWidget extends StatelessWidget {
  final void Function() onDeletIconPressed;
  final void Function(String newWilaya) onChooseWilaya;
  final Key key;
  final String wilaya;
  final List<String> wilayat;

  WilayaWidget(
      {@required this.onDeletIconPressed,
      this.onChooseWilaya,
      this.key,
      this.wilaya,
      this.wilayat});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < 58; i++) {
      items.add(DropdownMenuItem(
        value: wilayat[i],
        child: Text((i + 1).toString() + " - " + wilayat[i]),
      ));
    }
    return ListTile(
      key: key,
      leading: wilaya == null ? null : Icon(Icons.reorder),
      trailing: wilaya == null
          ? null
          : IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDeletIconPressed,
            ),
      title: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: items,
          value: wilaya,
          hint: Icon(Icons.add),
          iconSize: 0,
          onChanged: onChooseWilaya,
        ),
      ),
    );
  }
}
