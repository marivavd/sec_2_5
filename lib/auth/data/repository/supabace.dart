import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
var supabase = Supabase.instance.client;

Future<void> signUp(
    {required String email,
      required String password,
      required String confirm_password,
      required String full_name,
      required String phone_number,
      required Function onResponse,
      required Function onError}) async {
  try {
    if (!EmailValidator.validate(email)){
      throw Exception("Incorrect email");
    }
    if (confirm_password != password) {
      throw Exception("Passwords don't match");
    } else {
      var result = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      await supabase.from('profiles').insert({
        "id_user": result.user!.id,
        "fullname": full_name,
        'phone': phone_number,
        'avatar': ''
      });
      onResponse(result);
    }
  } on AuthException catch (e) {
    onError(e.message);
  }
}

Future<void> signIn(
    {required String email,
      required String password,
      required Function onResponse,
      required Function onError}) async {
  try{
    var result = await supabase.auth.signInWithPassword(
        password: password,
        email: email
    );
    onResponse(result);
  } on AuthException catch(e){
    onError(e.message);
  }
}
Future<void> sendEmail(
    {required String email,
      required Function onResponse,
      required Function onError}) async {
  try{
    await supabase.auth.resetPasswordForEmail(email);
    onResponse();
  } on AuthException catch(e){
    onError(e.message);
  }
  on Exception catch(e){
    onError("Something went wrong");
  }
}
Future<void> changePassword(
    {
      required String newPassword,
      required Function onResponse,
      required Function onError}) async {
  try{
    await supabase.auth.updateUser(UserAttributes(
      password: newPassword,
    ));
    onResponse();
  } on AuthException catch(e){
    onError(e.message);
  }
  on Exception catch(e){
    onError("Something went wrong");
  }
}
Future<void> verifyOTP(
    {
      required String email,
      required String code,
      required Function onResponse,
      required Function onError}) async {
  try{
    final AuthResponse res = await supabase.auth.verifyOTP(
      type: OtpType.email,
      token: code,
      email: email
    );
    onResponse();
  } on AuthException catch(e){
    onError(e.message);
  }
  on Exception catch(e){
    onError("Something went wrong");
  }
}