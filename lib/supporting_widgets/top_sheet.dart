import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopSheetBody extends StatelessWidget {
  const TopSheetBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Card(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () => Navigator.of(context).pop('item1'),
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () => Navigator.of(context).pop('item2'),
                ),
                ListTile(
                  title: Text('Item 3'),
                  onTap: () => Navigator.of(context).pop('item3'),
                ),
                ListTile(
                  title: Text('Item 4'),
                  onTap: () => Navigator.of(context).pop('item4'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
