import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/api/api_service.dart';
import 'package:project_app/model/login_model.dart';
import 'package:project_app/screens/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  late Future<Login> apiLogin;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // apiLogin =
    //     getLogin(emailController.toString(), passwordController.toString());
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget buildImage() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image_top_login.png'),
              fit: BoxFit.fill)),
    );
  }

  Widget buildUser() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Email hoặc số điện thoại",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget buildPassword() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordController,
        style: const TextStyle(fontSize: 20),
        obscureText: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Mật khẩu",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget buildPasswordRetype() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordController,
        style: const TextStyle(fontSize: 20),
        obscureText: true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Nhập lại mật khẩu",
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }

  Widget buildBtnSignup() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
        primary: Colors.green,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        "Đăng ký",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16),
      ),
      onPressed: () => {print("succes")},
    );
  }

  Widget buildTextOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Expanded(
            child: Divider(
          indent: 10.0,
          endIndent: 10.0,
          thickness: 1,
          color: Colors.grey,
        )),
        TextButton(
            child: const Text(
              "Trở lại",
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }),
        const Expanded(
            child: Divider(
          indent: 10.0,
          endIndent: 10.0,
          thickness: 1,
          color: Colors.grey,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildImage(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          buildUser(),
                          buildPassword(),
                          buildPasswordRetype()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildBtnSignup(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextOr(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
