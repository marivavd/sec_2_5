import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:sec_2_5/auth/data/repository/show_error.dart';
import 'package:sec_2_5/auth/data/repository/supabace.dart';
import 'package:sec_2_5/auth/presentation/pages/sign_in_page.dart';
import 'package:sec_2_5/auth/presentation/widgets/text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Sign_up_Page extends StatefulWidget {
  const Sign_up_Page({super.key});

  @override
  State<Sign_up_Page> createState() => _Sign_up_PageState();
}

class _Sign_up_PageState extends State<Sign_up_Page> {
  var name_controller = TextEditingController();
  var phone_controller = MaskedTextController(mask: "+0(000)000-00-00");
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var confirm_password_controller = TextEditingController();
  bool password_is_obscure = true;
  bool confirm_password_is_obscure = true;
  bool button = false;
  bool check = false;
  void is_Valid(){
    setState(() {
      button = name_controller.text.isNotEmpty && phone_controller.text.isNotEmpty && email_controller.text.isNotEmpty && password_controller.text.isNotEmpty && confirm_password_controller.text.isNotEmpty && check;
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
              SizedBox(height: 54,),
              Text(
                "Create an account",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8,),
              Text(
                "Complete the sign up process to get started",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 33,),
              Custom_Field(label: "Full name", hint: "Ivanov Ivan", controller: name_controller, onchange: (new_Text){is_Valid();}),
              SizedBox(height: 24,),
              Custom_Field(label: "Phone Number", hint: "+7(999)999-99-99", controller: phone_controller, onchange: (new_Text){is_Valid();}),
              SizedBox(height: 24,),
              Custom_Field(label: "Email Address", hint: "***********@mail.com", controller: email_controller, onchange: (new_Text){is_Valid();}),
              SizedBox(height: 24,),
              Custom_Field(label: "Password", hint: "**********", controller: password_controller, onchange: (new_Text){is_Valid();}, is_obscure: password_is_obscure, on_tap_suffix: (){setState(() {
                password_is_obscure = !password_is_obscure;
              });},),
              SizedBox(height: 24,),
              Custom_Field(label: "Confirm Password", hint: "**********", controller: confirm_password_controller, onchange: (new_Text){is_Valid();}, is_obscure: confirm_password_is_obscure, on_tap_suffix: (){setState(() {
                confirm_password_is_obscure = !confirm_password_is_obscure;
              });},),
              SizedBox(height: 37,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 1,),
                  SizedBox(
                    height: 14,
                    width: 14,
                    child: Checkbox(
                      value: check,
                      activeColor: Color.fromARGB(255, 0, 108, 236),
                      side: BorderSide(
                        width: 1, color: Color.fromARGB(255, 0, 108, 236),
                      ),
                      onChanged: (bool? val){
                        setState(() {
                          check = val!;
                          is_Valid();
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 11,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                    text: "By ticking this box, you agree to our",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: " Terms and \nconditions and private policy",
                        style: TextStyle(
                            color: Color.fromARGB(255, 235, 188, 46))
                      )
                    ]

                  ),
                  )
                ],
              ),
              SizedBox(height: 64,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                    onPressed: (button)? () async{
                      signUp(
                          email: email_controller.text,
                          password: password_controller.text,
                          confirm_password: confirm_password_controller.text,
                          full_name: name_controller.text,
                          phone_number: phone_controller.text,
                          onResponse: (AuthResponse response){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                          },
                          onError: (String e){showError(context, e);});
                    }:null,
                    child: Text(
                      "Sign Up",
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_in_Page()));
                    },
                    child: Text("Sign in", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color.fromARGB(255, 5, 96, 250)),),
                  ),
                ],
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("or sign in using", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
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
