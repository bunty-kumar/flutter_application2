import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application2/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 12),
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            "Welcome $name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(height: 12),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  // Only numbers can be entered
                  decoration: InputDecoration(
                      hintText: "Enter Mobile", labelText: "Mobile"),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () async {
                    setState(() {
                      changedBtn = true;
                    });

                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: 40,
                    width: changedBtn ? 40 : 150,
                    alignment: Alignment.center,
                    child: changedBtn
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        //shape: BoxShape.circle
                        borderRadius:
                            BorderRadius.circular(changedBtn ? 40 : 8)),
                  ),
                )

                // ElevatedButton(
                //   child: Text("Login"),
                //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
                //   },
                // )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
