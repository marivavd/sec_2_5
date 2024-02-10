import 'package:flutter/material.dart';
import 'package:sec_2_5/auth/data/repository/show_error.dart';
import 'package:sec_2_5/auth/data/repository/supabace.dart';
import 'package:sec_2_5/auth/presentation/pages/otf.dart';
import 'package:sec_2_5/auth/presentation/pages/sign_in_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widgets/text_field.dart';

class Forgot_password_Page extends StatefulWidget {
  const Forgot_password_Page({super.key});

  @override
  State<Forgot_password_Page> createState() => _Forgot_password_PageState();
}

class _Forgot_password_PageState extends State<Forgot_password_Page> {
  var email_controller = TextEditingController();
  bool button = false;
  void is_Valid(){
    setState(() {
      button = email_controller.text.isNotEmpty;
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
                "Forgot Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8,),
              Text(
                "Enter your email address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 56,),
              Custom_Field(label: "Email Address", hint: "***********@mail.com", controller: email_controller, onchange: (new_Text){is_Valid();}),
              SizedBox(height: 56,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                    onPressed: (button)? () async{
                      await sendEmail(
                          email: email_controller.text,
                          onResponse: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OTF_Page(email: email_controller.text,)));
                          },
                          onError: (String e){showError(context, e);});
                    }:null,
                    child: Text(
                      "Send OTP",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Remember password? Back to", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                    },
                    child: Text("Sign in", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color.fromARGB(255, 5, 96, 250)),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
