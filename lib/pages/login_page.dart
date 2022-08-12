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
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedBtn = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        changedBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 12),
            Image.asset(
              "assets/images/welcome.png",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mobile Number can't be empty";
                      } else if (value.length < 10) {
                        return "Mobile Number should have 10 digits atleast";
                      }
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return "Passwprd  should have 6 digits atleast";
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Material(
                      //shape: BoxShape.circle
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(changedBtn ? 40 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
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
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
