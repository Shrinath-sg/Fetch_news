import 'package:flutter/material.dart';
import 'package:task/widgets/signup_signIn_container.dart';
class FormFields extends StatefulWidget {
 final currentMode;
 final emailKey;
 final passwordKey;
 final reEnterPasswordKey;
 final emailController;
 final passwordController;
 final reEnterPasswordController;
 FormFields({this.currentMode,this.emailKey,this.passwordKey,this.emailController,this.passwordController,this.reEnterPasswordKey,this.reEnterPasswordController});

  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {

  @override
  Widget build(BuildContext context) {
    //print(widget.currentMode);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      // key: _formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: width < 600 ? null : height * 0.055,
            width: width < 600 ? width * 0.85 : width * 0.7,
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              key: widget.emailKey,
              onChanged: (value) {
                widget.emailKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Email';
                }
                return null;
              },
              controller: widget.emailController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: width < 600 ? width * 0.04 : width * 0.02,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: width < 600 ? null : height * 0.055,
            width: width < 600 ? width * 0.85 : width * 0.7,
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              key: widget.passwordKey,
              onChanged: (value) {
                widget.passwordKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Password";
                }
                return null;
              },
              controller: widget.passwordController,
              style: TextStyle(color: Colors.white),
              // obscureText: !_passwordVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(
                    fontSize: width < 600 ? width * 0.04 : width * 0.02,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
         widget.currentMode==mode.signUp?Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: width < 600 ? null : height * 0.055,
            width: width < 600 ? width * 0.85 : width * 0.7,
            decoration: BoxDecoration(
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              key: widget.reEnterPasswordKey,
              onChanged: (value) {
                widget.reEnterPasswordKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Re-enter Password";
                }
                return null;
              },
              controller: widget.reEnterPasswordController,
              style: TextStyle(color: Colors.white),
              // obscureText: !_passwordVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Re-enter Password",
                hintStyle: TextStyle(
                    fontSize: width < 600 ? width * 0.04 : width * 0.02,
                    color: Colors.white),
              ),
            ),
          ):Container(height: 0,),
             //:Container(height: 0,),
          //SizedBox(height: height * 0.02),
          Container(
            alignment: Alignment.centerRight,
            width: width < 600 ? width * 0.85 : width * 0.7,
           // color: Colors.red,
            child: Text(
              "Forgot password?",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
