import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/api/api_service.dart';
import 'package:http/http.dart';
import 'package:project_app/model/login_model.dart';
import 'package:project_app/screens/Signup/signup_screen.dart';
import 'package:project_app/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();
  // var _isloading = false;
  TextEditingController emailController =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordController =
      TextEditingController(text: "cityslicka");
  // void login(String email, password) async {
  //   try {
  //     Response response = await post(Uri.parse('https://reqres.in/api/login'),
  //         body: {'email': email, 'password': password});

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Login successfully');
  //     } else {
  //       print('failed');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  Future<void> loginUsers() async {
    // if (_formKey.currentState!.validate()) {
    //   //show snackbar to indicate loading
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: const Text('Processing Data'),
    //     backgroundColor: Colors.green.shade300,
    //   ));

    dynamic res = await _apiClient.getLogin(
      emailController.text,
      passwordController.text,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    String jsonsDataString = res.toString();
    final jsonData = jsonDecode(jsonsDataString);
    if (jsonData['token'] != null) {
      String accessToken = jsonData['token'];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(accesstoken: accessToken)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Tài khoản hoặc mật khẩu không đúng'),
        backgroundColor: Colors.red.shade300,
      ));
    }
    // }
  }

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
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
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

  Widget buildBtnLogin() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
          primary: const Color.fromARGB(255, 209, 5, 5),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(
          "Đăng nhập",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: loginUsers
        // if (_formKey.currentState!.validate()) {
        //   var email = emailController.text;
        //   var password = passwordController.text;
        //   setState(() {
        //     print("object");
        //   });
        //   var rsp = await Login(email, password);
        //   print(rsp);
        // }

        // getLogin(emailController.text.toString(),
        //     passwordController.text.toString());

        );
  }

  Widget buildILoginFBGG() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          icon: const FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
            size: 40,
          ),
          onPressed: () {
            print("Pressed");
          }),
      IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          icon: Image.asset('assets/images/google.png'),
          iconSize: 40,
          onPressed: () {
            print("Pressed");
          }),
    ]);
  }

  Widget buildForgotPassword() {
    return const Text(
      "Quên mật khẩu?",
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget buildTextOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Expanded(
            child: Divider(
          indent: 10.0,
          endIndent: 10.0,
          thickness: 1,
          color: Colors.grey,
        )),
        Text(
          "Hoặc",
          style: TextStyle(color: Colors.grey),
        ),
        Expanded(
            child: Divider(
          indent: 10.0,
          endIndent: 10.0,
          thickness: 1,
          color: Colors.grey,
        )),
      ],
    );
  }

  Widget buildSignUp() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        "Đăng ký tài khoản",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
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
                        children: <Widget>[buildUser(), buildPassword()],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildBtnLogin(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildILoginFBGG(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextOr(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildSignUp(),
                    const SizedBox(
                      height: 15,
                    ),
                    buildForgotPassword(),
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
