import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _animation;
  Animation<Offset> _slideAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1,end: 0.6).animate(_controller);
    _animation = Tween<double>(begin: 0.5,end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0),end: Offset(0, 0)).animate(_controller);
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  static var veh = [
    'INTRODUCTION',
    'WHY BOOKPOLY',
    'OUR TEAM',
    'BROCHURE',
    'VISION',
    'ALUMNI PORTAL'
  ];
  final drop = DropdownButton<String>(
    items: veh.map((String dropDownStringItem) {
      return DropdownMenuItem<String>(value: dropDownStringItem
          , child: Text(dropDownStringItem));
    }).toList(),
    onChanged: (String val) {},
    isExpanded: false,
    hint: Text('ABOUT US',
      style: TextStyle(color: Colors.black, fontSize: 20.0),),
  );
 static var courses = ['GATE', 'GRE', 'IAS'];
  final d = DropdownButton<String>(
    items: courses.map((String dropDownStringItem) {
      return DropdownMenuItem<String>(value: dropDownStringItem
          , child: Text(dropDownStringItem));
    }).toList(),
    onChanged: (String val) {},
    isExpanded: false,
    hint: Text('COURSES',
      style: TextStyle(color: Colors.black, fontSize: 20.0),),
  );
 static var res = [''];
  final e = DropdownButton<String>(items: res.map((String dropDownStringItem) {
    return DropdownMenuItem<String>(value: dropDownStringItem
        , child: Text(dropDownStringItem));
  }).toList(),
    onChanged: (String val) {},
    isExpanded: false,
    hint: Text('RESOURCES',
      style: TextStyle(color: Colors.black, fontSize: 20.0),),
  );


  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[drop,
                    SizedBox(height: 10.0,),
                    d,
                    SizedBox(height: 10.0,),
                    e]
              )
          ),
        ),
      ),
    );
  }

  Widget dashboard(context)
  {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 :0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          child: Container(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 48),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(child: Icon(Icons.menu), onTap: ()
                      {
                        setState(() {
                          if(isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();
                          isCollapsed = !isCollapsed;
                        });
                      },),
                    Text('Bookopoly',
                    style: TextStyle(fontSize: 24),),
                    InkWell(child: Icon(Icons.add_shopping_cart),),
                    InkWell(child: Icon(Icons.account_circle),),
                  ],
                ),
                SizedBox(height: 50,),
                Container(
                  height: 200,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.redAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.blueAccent,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.greenAccent,
                        width: 100,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


