import 'package:flutter/material.dart';
class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/e.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.shop_sharp,
                      color: Colors.brown,
                      size: 50.0,
                    ),
                    Text(
                      'VICTORIAN HOME',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                          color: Colors.brown,
                          fontSize: 30
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
