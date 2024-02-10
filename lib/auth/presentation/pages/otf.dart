import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sec_2_5/auth/data/repository/show_error.dart';
import 'package:sec_2_5/auth/data/repository/supabace.dart';
import 'package:sec_2_5/auth/presentation/pages/new_passwords.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OTF_Page extends StatefulWidget {
  final String email;
  const OTF_Page({super.key, required this.email});

  @override
  State<OTF_Page> createState() => _OTF_PageState();
}

class _OTF_PageState extends State<OTF_Page> {
  bool button = false;
  var lost_seconds = 60;
  bool is_Error = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double separator = widthScreen / 6 - 32;


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 131,),
              Text(
                "OTP Verification",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8,),
              Text(
                "Enter the 6 digit numbers sent to your email",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 32,),
              Pinput(
                length: 6,
                controller: controller,
                separatorBuilder: (context) => SizedBox(width: separator,),
                defaultPinTheme: PinTheme(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFA7A7A7)),
                    borderRadius: BorderRadius.zero
                  )
                ),
                focusedPinTheme: PinTheme(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF0560FA)),
                        borderRadius: BorderRadius.zero
                    )
                ),
                submittedPinTheme: (!is_Error) ? PinTheme(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF0560FA)),
                        borderRadius: BorderRadius.zero
                    )
                ): PinTheme(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFED3A3A)),
                        borderRadius: BorderRadius.zero
                    )
                ),
                errorPinTheme: PinTheme(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFED3A3A)),
                        borderRadius: BorderRadius.zero
                    )
                ),
                onChanged: (text){
                  setState(() {
                    is_Error = false;
                    print(controller.text);
                    button = text.length == 6;
                  });
                },
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you didn’t receive code, ", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
                  (lost_seconds != 0) ? Countdown(
                      seconds: 60,
                      build: (BuildContext context, double time){
                        lost_seconds = time.toInt();
                        var lostMin = lost_seconds ~/ 60;
                        var lost_diffsec = lost_seconds - lostMin * 60;
                        return Text("$lostMin:${(lost_diffsec <10) ? "0$lost_diffsec": lost_diffsec}");
                      },
                    interval: const Duration(seconds: 1),
                    onFinished: (){
                        setState(() {
                        });
                    },
                  ) : const Text("resend")
                ],
              ),
              SizedBox(height: 82,),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 46,
                  width: 342,
                  child: FilledButton(
                    style: Theme.of(context).filledButtonTheme.style,
                    onPressed: (button)? () async{
                      verifyOTP(
                          email: widget.email,
                          code: controller.text,
                          onResponse: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => New_password_Page()));
                          },
                          onError: (String e){
                            setState(() {
                              is_Error = true;
                            });
                            showError(context, e);});
                    }:null,
                    child: Text(
                      "Set New Password",
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
