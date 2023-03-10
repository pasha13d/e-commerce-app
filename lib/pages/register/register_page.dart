import 'package:flutter/material.dart';
import 'package:my_ecom_app/common_widgets/form_helper.dart';
import 'package:my_ecom_app/common_widgets/hex_color.dart';
import 'package:my_ecom_app/common_widgets/progress_hud.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: HexColor("#283B71"),
            body: ProgressHUD(
              child: Form(
                key: globalFormKey,
                child: _registerUI(context),
              ),
              key: UniqueKey(),
              inAsyncCall: isAPICallProcess,
              opacity: 0.3,
            )
        )
    );
  }

  Widget _registerUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logo.png",
                    width: 250,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              top: 50,
            ),
            child: Text("Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          /// User name
          FormHelper.inputFieldWidget(
            context,
            "userName",
            "User Name",
                (onValidateVal) {
              if(onValidateVal.isEmpty){
                return "Username can\'t be empty.";
              }
              return null;
            },
                (onSavedVal){
              userName = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            prefixIcon: const Icon(Icons.person),
            showPrefixIcon: true,
            borderRadius: 10,
          ),
          SizedBox(height: 10,),
          /// Password
          FormHelper.inputFieldWidget(
            context,
            "password",
            "Password",
                (onValidateVal) {
              if(onValidateVal.isEmpty){
                return "Password can\'t be empty.";
              }
              return null;
            },
                (onSavedVal){
              password = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            prefixIcon: const Icon(Icons.lock),
            showPrefixIcon: true,
            borderRadius: 10,
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.white.withOpacity(0.7),
              icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          SizedBox(height: 10,),
          /// Email
          FormHelper.inputFieldWidget(
            context,
            "email",
            "Email",
                (onValidateVal) {
              if(onValidateVal.isEmpty){
                return "Email can\'t be empty.";
              }
              return null;
            },
                (onSavedVal){
              email = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            prefixIcon: const Icon(Icons.email),
            showPrefixIcon: true,
            borderRadius: 10,
          ),
          SizedBox(height: 20,),
          /// Login button
          Center(
            child: FormHelper.submitButton(
              "Register",
                  (){

              },
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }
}
