import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_services.dart';
import 'package:flutter_application_1/api_1/login.dart';
import 'package:flutter_application_1/storage/session.dart';
import 'package:flutter_application_1/views/login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginuser(context) async {
    var apiservices = Apiservices();
    try {
      ///show progress

      var response = await apiservices.loginUser(
          emailController.text.trim(), passwordController.text.trim());
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
    return LoginView(this);
  }
}

class Dialog extends StatelessWidget {
  const Dialog({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
