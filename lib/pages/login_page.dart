import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/constant/image_urls.dart';
import 'package:login/constant/routes.dart';
import 'dart:convert';
import 'package:login/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic>? loginData;

  Future<void> _login() async {
    String url = 'http://3.142.126.252:90/api/Auth/login';
    Map<String, String> body = {
      'UserName': usernameController.text,
      'Password': passwordController.text,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        loginData = data;
      });
      print('Login success: $data');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login successful',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        // ),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 6, 135, 96),
        ),
      );
    } else {
      print('Error: ${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error message'),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 233, 30, 30),
        ),
      );
      // print('Error message: ${response.body}');
    }
  }

   void _navigateToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
            .pushNamedAndRemoveUntil(registerRoute, (route) => false);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView ( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                      signInScreenImg,
                      width: 250, 
                      height: 300, 
                      fit: BoxFit.cover, 
                  ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  // labelText: 'Username',
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  // labelText: 'Password'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                ),
              ),
              const SizedBox(height: 35.0),
              // ElevatedButton(
              //   onPressed: _login,
              //   child: const Text(
              //     'Login',
              //   ),
              // ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 6, 135, 96),
                  borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: _login,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    ),
                  ),
              ),
              const SizedBox(height: 20.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an Account?",
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 48, 131, 82),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                )
              ),
              const SizedBox(height: 10.0),
              if (loginData != null)
                LoginSuccessDetails(loginData: loginData!),
            ],
          ),
        )
      ),
    );
  }
}

class LoginSuccessDetails extends StatelessWidget {
  final Map<String, dynamic> loginData;

  const LoginSuccessDetails({super.key, required this.loginData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Login Details: '),
        Text('Token: ${loginData['token']}'),
        Text('User ID: ${loginData['appUser']['id']}'),
        Text('Username: ${loginData['appUser']['userName']}'),
      ],
    );
  }
}