import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:BookMate/screens/home_screen/home_screen.dart';
import 'package:BookMate/screens/signup/register.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  static const routeName = "login";
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());
    final user = userCredential.user;
    print(user?.uid);
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/icons/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Container(),
            // Container(
            //   padding: EdgeInsets.only(left: 35, top: 130),
            //   child: Text(
            //     'Welcome\nBack',
            //     style: TextStyle(color: Colors.white, fontSize: 33),
            //   ),
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height - 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 35, top: 5),
                      child: Text(
                        'Get\nStarted',
                        style: TextStyle(color: Colors.black, fontSize: 33),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, top: 50),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 230, 176, 37))),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: login,
                              ),
                              // CircleAvatar(
                              //   radius: 30,
                              //   backgroundColor: Color(0xff4c505b),
                              //   child: IconButton(
                              //       color: Colors.white,
                              //       onPressed: () {},
                              //       icon: Icon(
                              //         Icons.arrow_forward,
                              //       )),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      MyRegister.routeName);
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
