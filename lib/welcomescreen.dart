import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
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
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/w.png'),
                      maxRadius: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'WELCOME',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.brown
                            ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            onPressed: (){},
                            child: Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                    color: Colors.brown,
                                    width: 2.0
                                )
                            ),

                            onPressed: (){},
                            child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 25
                              ),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Skip For Now',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
