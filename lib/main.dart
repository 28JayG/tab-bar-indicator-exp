import 'package:flutter/material.dart';
import 'guru_icons.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme:
          new ThemeData(primarySwatch: Colors.blue, tabBarTheme: TabBarTheme()),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            height: 300.0,
          ),
          Center(
            child: TabBar(
              controller: TabController(
                length: 5,
                vsync: this,
                initialIndex: 1,
              ),
              tabs: [
                Icon(
                  GuruIcons.heart_filled,
                  size: 60.0,
                ),
                Icon(
                  GuruIcons.category_culinary,
                  size: 60.0,
                ),
                Icon(
                  GuruIcons.category_arts,
                  size: 60.0,
                ),
                Icon(
                  GuruIcons.category_sports,
                  size: 60.0,
                ),
                Icon(
                  GuruIcons.category_science,
                  size: 60.0,
                ),
              ],
              indicator: CustomTabIndicator(),
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              labelPadding: EdgeInsets.all(10.0).copyWith(bottom: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint();

    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black;
    paint.strokeWidth = 3.0;

    final path = Path();

    //This will move the starting point to the indicator starting point + 25.0
    path.moveTo(offset.dx + configuration.size.width * 0.25,
        configuration.size.height / 1.1);

    var arcEndPoint = Offset(
        offset.dx + configuration.size.width - configuration.size.width * 0.25,
        configuration.size.height / 1.1);

    //This will draw a path an arc
    path.arcToPoint(arcEndPoint,
        radius: Radius.circular(configuration.size.height / 2), largeArc: true);

    path.lineTo(configuration.size.width / 2 + offset.dx,
        configuration.size.height * 1.2);
    //Will take the point to the start point,
    path.close();

    canvas.drawPath(path, paint);
  }
}
