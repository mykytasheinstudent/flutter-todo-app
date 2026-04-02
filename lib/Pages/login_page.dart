import 'package:flutter/material.dart';
import 'package:todo_app/Pages/dashboard_page.dart';
import 'package:todo_app/Pages/register_page.dart';
import '../Components/text_field.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberUser = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    Widget content = Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212427),
                  )
                )
              ),
              CustomTextField(
                labelText: "Enter Username",
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 25,),
              CustomTextField(
                labelText: "Enter Password",
                isObscure: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: rememberUser == true,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberUser = value ?? false;
                      });
                    },
                  ),
                  const Text("Remember me", style: TextStyle(color:  Color(0xFF212427), fontFamily: "Montserrat", fontSize: 16),),
                ],
              ),
              const SizedBox(height: 50,),
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
                  "Login",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ),
              isMobile
                ? const Spacer()
                : const SizedBox(height: 50,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.8),
                    child: Text(
                      "Or login with",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: const Color(0xFF212427),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:IconButton(
                      onPressed: (){}, 
                      icon: Image.asset("assets/images/logo_facebook.png")
                    )
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:IconButton(
                      onPressed: (){}, 
                      icon: Image.asset("assets/images/logo_google.png")
                    )
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child:IconButton(
                      onPressed: (){}, 
                      icon: Image.asset("assets/images/logo_x.png")
                    )
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.8),
                    child: Text(
                      "Don't have an account?",
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
                          builder: (context) => const RegisterPage()), 
                        (Route<dynamic> route) => false
                      );
                    },
                    child: Text(
                      "Create One",
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
        Expanded(
          child: Align(
            child: Image.asset(
              'assets/images/login_v2.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        )
          
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