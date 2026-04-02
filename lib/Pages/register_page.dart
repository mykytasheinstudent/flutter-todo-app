import 'package:flutter/material.dart';
import 'package:todo_app/Pages/login_page.dart';
import 'package:todo_app/pages/dashboard_page.dart';
import '../Components/text_field.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool termsAccepted = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    Widget content = Row(
      children: [
        //picture Expanded
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              child: Image.asset(
                'assets/images/register.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        //inputs comlumn
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Text(
                  //S.of(context).welcomeLogin,
                  "Sign Up",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212427),
                  )
                )
              ),
              CustomTextField(
                labelText: "Enter First Name",
                prefixIcon: Icons.person_add_alt,
              ),
              const SizedBox(height: 25,),
              CustomTextField(
                labelText: "Enter Last Name",
                prefixIcon: Icons.person_add_alt_outlined,
              ),
              const SizedBox(height: 25,),
              CustomTextField(
                labelText: "Enter Username",
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 25,),
              CustomTextField(
                labelText: "Enter Email",
                prefixIcon: Icons.mail_outline,
              ),
              const SizedBox(height: 25,),
              CustomTextField(
                labelText: "Enter Password",
                isObscure: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 25,),
              CustomTextField(
                labelText: "Confirm Password",
                isObscure: true,
                prefixIcon: Icons.lock_outline,
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: termsAccepted == true,
                    onChanged: (bool? value) {
                      setState(() {
                        termsAccepted = value ?? false;
                      });
                    },
                  ),
                  const Text("I agree to all terms", style: TextStyle(color:  Color(0xFF212427), fontFamily: "Montserrat", fontSize: 16),),
                ],
              ),
              const SizedBox(height: 25,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const DashboardPage()), 
                    (Route<dynamic> route) => false
                  );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9090),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  minimumSize: const Size(120, 60)
                ),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.8),
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: const Color(0xFF212427),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const LoginPage()), 
                        (Route<dynamic> route) => false
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: const Color(0xFF008BD9),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

          
      ],
    );
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          color: const Color(0xFFFF6767),
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 1236),
            // padding: const EdgeInsets.all(50.0),
            padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: isMobile
            ? content
            : SingleChildScrollView(
              child: content
            ),
          ),
        ),
      ),
    );
  }
}