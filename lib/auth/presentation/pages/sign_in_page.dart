import 'package:flutter/material.dart';
import 'package:sec_2_5/auth/presentation/pages/forgot_password.dart';
import 'package:sec_2_5/auth/presentation/pages/sign_up_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../data/repository/show_error.dart';
import '../../data/repository/supabace.dart';
import '../widgets/text_field.dart';

class Sign_in_Page extends StatefulWidget {
  const Sign_in_Page({super.key});

  @override
  State<Sign_in_Page> createState() => _Sign_in_PageState();
}

class _Sign_in_PageState extends State<Sign_in_Page> {
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  bool password_is_obscure = true;
  bool button = false;
  bool check = false;
  void is_Valid(){
    setState(() {
      button = email_controller.text.isNotEmpty && password_controller.text.isNotEmpty;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 131,),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8,),
              Text(
                "Fill in your email and password to continue",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 15,),
              Custom_Field(label: "Email Address", hint: "***********@mail.com", controller: email_controller, onchange: (new_Text){is_Valid();}),
              SizedBox(height: 24,),
              Custom_Field(label: "Password", hint: "**********", controller: password_controller, onchange: (new_Text){is_Valid();}, is_obscure: password_is_obscure, on_tap_suffix: (){setState(() {
                password_is_obscure = !password_is_obscure;
              });},),
              SizedBox(height: 17,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 1,),
                  Expanded(child: Row(
                    children: [
                      SizedBox(
                        height: 14,
                        width: 14,
                        child: Checkbox(
                            value: check,
                            side: BorderSide(width: 1),
                            activeColor: Color.fromARGB(255, 0, 108, 236),
                            onChanged: (bool? val){
                                check = val!;

                            }),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text("Remember password", style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w500),),
                    ],
                  )),
                  InkWell(
                    child: Text("Forgot Password?", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Color.fromARGB(255, 5, 96, 250)
                    )),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_password_Page()));
                    },
                  )
                ],
              ),
              SizedBox(height: 187,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                    onPressed: (button)? () async{
                      signIn(
                          email: email_controller.text,
                          password: password_controller.text,
                          onResponse: (AuthResponse response){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                          onError: (String e){showError(context, e);});
                    }:null,
                    child: Text(
                      "Log in",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up_Page()));
                    },
                    child: Text("Sign Up", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color.fromARGB(255, 5, 96, 250)),),
                  ),
                ],
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("or log in using", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
                      SizedBox(height: 8,),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset("assets/google.png"),
                      )
                    ],
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
