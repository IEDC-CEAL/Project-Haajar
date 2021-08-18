import 'package:flutter/material.dart';
import '../ui_painters/background_painter.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(animation: _animationController!.view),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _animationController!.forward(from: 0);
              },
              child: Text("Animate"),
            ),
          ),
        ],
      ),
    );
  }
}
