import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({Key key, this.initialText, this.search})
      : super(key: key);
  final Function search;

  final initialText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 4,
          right: 4,
          child: Card(
            child: TextFormField(
              autocorrect: false,
              initialValue: initialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              onChanged: (tx) {
                search(tx);
              },
              onFieldSubmitted: (tx) {
                Navigator.of(context).pop(tx);
              },
            ),
          ),
        )
      ],
    );
  }
}