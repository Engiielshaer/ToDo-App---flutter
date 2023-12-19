import 'package:flutter/material.dart';
class Access extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/e.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/a.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      Text(
                        'Access anywhere',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.brown
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'learn gkjjhjg jyhty kjuhy jhyrtrew kuit hftd',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.brown,
                      size: 30,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.brown
                          ),
                          color: Colors.transparent
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.brown,
                        size: 40,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
