import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'sign_up_page.dart';
import 'sign_in_page.dart';
import 'authentication_page_background_painter.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

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
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff00416A), Color(0xffE4E5E6)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: CustomPaint(
                painter: AuthenticationPageBackgroundPainter(
                    animation: _animationController.view),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: ValueListenableBuilder<bool>(
                  valueListenable: showSignInPage,
                  builder: (context, value, child) {
                    return PageTransitionSwitcher(
                      duration: Duration(milliseconds: 800),
                      reverse: !value,
                      transitionBuilder: (Widget child,
                          Animation<double> primaryAnimation,
                          Animation<double> secondaryAnimation) {
                        return SharedAxisTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          fillColor: Colors.transparent,
                          child: child,
                        );
                      },
                      child: value
                          ? SignInPage(
                              onSignUpClicked: () {
                                showSignInPage.value = false;
                                _animationController.forward();
                              },
                            )
                          : SignUpPage(
                              onSignInPressed: () {
                                showSignInPage.value = true;
                                _animationController.reverse();
                              },
                            ),
                    );
                  }, //builder Close
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
