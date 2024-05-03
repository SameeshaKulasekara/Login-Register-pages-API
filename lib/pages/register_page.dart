import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/constant/image_urls.dart';
import 'package:login/constant/routes.dart';
import 'dart:convert';
import 'package:login/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController userRoleController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> _register() async {
    String url = 'http://3.142.126.252:90/api/Auth/register';
    Map<String, String> body = {
      'UserName': usernameController.text,
      'Password': passwordController.text,
      'Email': emailController.text,
      'DateOfBirth': dobController.text,
      'Address': addressController.text,
      'District': districtController.text,
      'City': cityController.text,
      'UserRole': userRoleController.text,
      'PhoneNumber': phoneNumberController.text,
      'Name': nameController.text,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Register successful',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Color.fromARGB(255, 6, 135, 96),
        ),
      );
      print(data);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
            .pushNamedAndRemoveUntil(loginRoute, (route) => false);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                    registerScreenImg,
                    width: double.infinity, 
                    height: 250, 
                    fit: BoxFit.cover, 
              ),
              const SizedBox(height: 20.0),             
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  // labelText: 'Username'
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
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  // labelText: 'Email'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  // labelText: 'Date of Birth (YYYY-MM-DD)'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter Date of Birth (YYYY-MM-DD)',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  // labelText: 'Address'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter Address',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: districtController,
                decoration: const InputDecoration(
                  // labelText: 'District'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter District',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  // labelText: 'City'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter City',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: userRoleController,
                decoration: const InputDecoration(
                  // labelText: 'User Role'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter User Role',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  // labelText: 'Phone Number'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  // labelText: 'Name'
                  border:UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
                  hintText: 'Enter Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              // ElevatedButton(
              //   onPressed: _register,
              //   child: const Text(
              //     'Register'
              //   ),
              // ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 6, 135, 96),
                  borderRadius: BorderRadius.circular(10)),
                  child: MaterialButton(
                    onPressed: _register,
                    child: const Text(
                      'Register',
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
                        'Already have an Account?',
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 48, 131, 82),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  )
                )
            ],
          ),
        ),
      ),
    );
  }
}
