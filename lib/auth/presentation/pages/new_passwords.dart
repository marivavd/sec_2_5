import 'package:flutter/material.dart';
import 'package:sec_2_5/auth/data/repository/supabace.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../data/repository/show_error.dart';
import '../widgets/text_field.dart';

class New_password_Page extends StatefulWidget {

  const New_password_Page({super.key});

  @override
  State<New_password_Page> createState() => _New_password_PageState();
}

class _New_password_PageState extends State<New_password_Page> {
  var password_controller = TextEditingController();
  var confirm_password_controller = TextEditingController();
  bool password_is_obscure = true;
  bool confirm_password_is_obscure = true;
  bool button = false;
  void is_Valid(){
    setState(() {
      button = password_controller.text.isNotEmpty && confirm_password_controller.text.isNotEmpty;
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
                "New Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8,),
              Text(
                "Enter new password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 70,),
              Custom_Field(label: "Password", hint: "**********", controller: password_controller, onchange: (new_Text){is_Valid();}, is_obscure: password_is_obscure, on_tap_suffix: (){setState(() {
                password_is_obscure = !password_is_obscure;
              });},),
              SizedBox(height: 24,),
              Custom_Field(label: "Confirm Password", hint: "**********", controller: confirm_password_controller, onchange: (new_Text){is_Valid();}, is_obscure: confirm_password_is_obscure, on_tap_suffix: (){setState(() {
                confirm_password_is_obscure = !confirm_password_is_obscure;
              });},),
              SizedBox(height: 71,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                    onPressed: (button)? () async{
                      if (confirm_password_controller.text == password_controller.text){
                        await changePassword(
                            newPassword: password_controller.text,
                            onResponse: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                            },
                            onError: (String e){showError(context, e);});
                      }

                    }:null,
                    child: Text(
                      "Log in",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
