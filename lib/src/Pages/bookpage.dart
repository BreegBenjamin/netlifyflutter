import 'package:flutter/material.dart';
import 'package:paris_app_web/src/Widgets/books.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _bookBody(),
      ),
    );
  }

  Widget _bookBody() {
    return Column(
      children: [
        _bookHeader(),
        Books(),
      ],
    );
  }

  Widget _bookHeader() {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                child: Text("EC"),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Ernesto Cajar",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "arial",
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ],
          ),
          Icon(
            Icons.menu_outlined,
            color: Colors.black45,
            size: 30,
          )
        ],
      ),
    );
  }
}
