import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_services.dart';
import 'package:flutter_application_1/api_1/login.dart';
import 'package:flutter_application_1/storage/session.dart';

class ApiPage1 extends StatelessWidget {
  ApiPage1({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginuser(context) async {
    var apiservices = Apiservices();
    try {
      ///show progress

      var response = await apiservices.loginUser(
          emailController.text.trim(), passwordController.text);

      //hide progress

      if (response.status!) {
        ///save token
        var session = SessionManager();
        await session.saveToken(response.token!);

        /// take the user to the next page
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(token: response.token!),
            ));
      } else {
        showDialogMessage(response.message!, context);
      }
    } catch (e) {
      ///hide progress

      showDialogMessage(e.toString(), context);
    }
  }

  showDialogMessage(message, context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD1D5DB),
                      ),
                    ),
                    label: Text("Email"),
                    fillColor: Color(0xfff2f2f2),
                    filled: true),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD1D5DB),
                      ),
                    ),
                    label: Text("Password"),
                    fillColor: Color(0xfff2f2f2),
                    filled: true),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (on) {},
                    side: const BorderSide(color: Color(0xffE1261C)),
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              MaterialButton(
                  height: 54,
                  minWidth: double.infinity,
                  onPressed: () => loginuser(context),
                  color: const Color(0xffE1261C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // padding: const EdgeInsets.all(16),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Color(0xffE8342B)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
