import 'package:flutter/material.dart';

class ServerErrorWidget extends StatefulWidget {
  @override
  _ServerErrorWidgetState createState() => _ServerErrorWidgetState();
}

class _ServerErrorWidgetState extends State<ServerErrorWidget> {
  String data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.network(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.tenor.co%2Fimages%2F1cb68f3bfa9f135f714735623452fd7c%2Fraw&f=1&nofb=1",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "It's me, not you :( (Really)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please Try Again Later",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                data = data;
              });
            },
            child: Text(
              "Click to Reload",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
