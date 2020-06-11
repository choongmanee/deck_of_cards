import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0, bottom: 48.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue.withOpacity(0.1),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('\u2660'),
                  Text('\u2660'),
//                  Text('\u2660'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
