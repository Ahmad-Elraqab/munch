import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:provider/provider.dart';

class ShowDialog extends StatelessWidget {
  Provider provider;
  _showDialog(BuildContext context, Provider p) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => {},
                      child: RaisedButtonCom(
                        borderColor: "00FFFFFF",
                        color: "00FFFFFF",
                        fontSize: 14,
                        borderWidth: 0,
                        radius: 0,
                        padding: 16,
                        textColor: "FFFFFF",
                        title: "Makkah",
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: HexColor("F26882"),
          actions: [],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _showDialog(context, provider = null);
  }
}
