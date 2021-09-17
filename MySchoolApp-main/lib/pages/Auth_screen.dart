import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_school_app/components/Login.dart';
import 'package:my_school_app/components/Register.dart';
import 'package:my_school_app/helpers/colors.dart';
import 'package:my_school_app/helpers/custom_shared_preferences.dart';
import 'package:my_school_app/pages/teacher/enter_homework.dart';
import 'package:my_school_app/pages/teacher/teacher_home.dart';

import 'student/student_view.dart';

class Auth_screen extends StatefulWidget {
  const Auth_screen({Key? key}) : super(key: key);

  @override
  _Auth_screenState createState() => _Auth_screenState();
}

class _Auth_screenState extends State<Auth_screen>
    with SingleTickerProviderStateMixin {
  bool _isShowRegister = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);
    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }
  _navigateToTeacher() async {
    await CustomSharedPreferences.saveUserOnBoarding(true);
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => TeacherHome(),
      ),
          (route) => false,
    );
  }
  _navigateToStudent() async {
    await CustomSharedPreferences.saveUserOnBoarding(true);
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => StudentView(),
      ),
          (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    setUpAnimation();
  }



  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void updateView() {
    setState(() {
      _isShowRegister = !_isShowRegister;
    });
    _isShowRegister
        ? _animationController.forward()
        : _animationController.reverse();
  }

  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                AnimatedPositioned(
                  left: _isShowRegister ? -_size.width * 0.76 : 0,
                  width: _size.width * 0.88,
                  height: _size.height,
                  duration: defaultDuration,
                  child:
                      Container(color: bg, child: LoginForm()),
                ),
                AnimatedPositioned(
                    duration: defaultDuration,
                    left: _isShowRegister
                        ? _size.width * 0.12
                        : _size.width * 0.88,
                    height: _size.height,
                    width: _size.width * 0.88,
                    child: Container(
                      child: RegisterForm(),
                      color: button,
                    )),
                AnimatedPositioned(
                    duration: defaultDuration,
                    right: _isShowRegister
                        ? -_size.width * 0.06
                        : _size.width * 0.06,
                    left: 0,
                    top: _size.height * 0.1,
                    child: CircleAvatar(
                      backgroundColor: !_isShowRegister?texting:bg,
                      radius: 25,
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _isShowRegister
                            ? Image(
                                image: AssetImage("assets/L.png"),
                                color: button)
                            : Image(
                                image: AssetImage("assets/L.png"),
                                color: bg),
                      ),
                    )),
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: _isShowRegister
                        ? _size.height / 2 - 80
                        : _size.height * 0.3,
                    left: _isShowRegister ? 0 : _size.width * 0.44 - 80,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: _isShowRegister ? texting : bg,
                        fontSize: _isShowRegister ? 20 : 32,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            if (_isShowRegister) {
                              updateView();
                            } else {
                              if(status == "teacher") {
                                _navigateToTeacher();
                              }
                              if(status == "student"){
                                _navigateToStudent();
                              }
                              if(status == ""){
                                final snackBar = SnackBar(
                                    content: Text('Fill all required fields'));

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }

                              }


                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.35),

                            decoration: BoxDecoration(
                                color: !_isShowRegister ? button: null,
                                borderRadius: BorderRadius.circular(35),
                               ),
                            width: 160,
                            child: Text(
                              "LOGIN",
                            ),
                          ),
                        ),
                      ),
                    )),
                AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: !_isShowRegister
                        ? _size.height / 2 - 80
                        : _size.height * 0.3,
                    right: _isShowRegister ? _size.width * 0.44 - 80 : 0,
                    child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: _isShowRegister ? texting : Colors.black,
                        fontSize: !_isShowRegister ? 20 : 32,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            if (_isShowRegister) {
                              //signUp
                            } else {
                              updateView();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.35),
                            // color: red,
                            decoration: BoxDecoration(
                              color: _isShowRegister ? bg: null,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            width: 160,
                            child: Text(
                              "SIGNUP",
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            );
          }),
    );
  }
}
