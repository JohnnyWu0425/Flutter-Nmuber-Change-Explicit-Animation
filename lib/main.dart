import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
  showSemanticsDebugger: false,
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> numAnimation;
  String buttonStr = "Count Up";
  Animation<double> sizeAnimation;
  Animation<double> containerSizeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    controller.addListener((){
      setState(() {

      });
    });

    numAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.linear,
        ),
      )
    );
    sizeAnimation = Tween(begin: 25.0, end: 50.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.linear,
        )
      )
    );
    containerSizeAnimation = Tween(begin: 200.0, end: 250.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.bounceIn,
        ),
      )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double number = numAnimation.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Number Animation",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              width: containerSizeAnimation.value,
              height: containerSizeAnimation.value,
              color: Colors.deepOrange[100],
              child: Center(
                child: Text(
                  "${number.round()}%",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sizeAnimation.value,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            RaisedButton(
              child: Text(
                "$buttonStr",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              padding: EdgeInsets.all(13.0),
              color: Colors.blue[300],
              elevation: 10.0,
              onPressed: (){
                setState(() {
                  if(buttonStr == "Count Up")
                    controller.forward();
                  else
                    controller.reverse();

                  buttonStr = (buttonStr=="Count Up")? ("Count Down"):("Count Up");
                });

              },
            ),
          ],
        ),
      ),
    );
  }
}
