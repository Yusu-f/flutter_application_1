import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/views/stateless_view.dart';

class LoginView extends StatelessView<LoginScreen, LoginController>{
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

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
                controller: controller.emailController,
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
                controller: controller.passwordController,
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
                  onPressed: () => controller.loginuser(context),
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