import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/login-provider.dart';
import 'package:task/screens/home_screen.dart';
import 'package:task/widgets/text_form_fields.dart';

enum mode { signUp, signIn }

final _emailKey = GlobalKey<FormFieldState>();
final _passwordKey = GlobalKey<FormFieldState>();
final _reEnterPasswordKey = GlobalKey<FormFieldState>();

class SignUpSignInContainer extends StatefulWidget {
  @override
  _SignUpSignInContainerState createState() => _SignUpSignInContainerState();
}

class _SignUpSignInContainerState extends State<SignUpSignInContainer> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  mode _currentMode = mode.signIn;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.green,
      height: size.height * 0.60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    _currentMode == mode.signIn ? 'Sign In' : 'Sign Up',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FormFields(
                  emailKey: _emailKey,
                  passwordKey: _passwordKey,
                  currentMode: _currentMode,
                  emailController: emailController,
                  passwordController: passwordController,
                  reEnterPasswordController: reEnterPasswordController,
                  reEnterPasswordKey: _reEnterPasswordKey,
                ),
                FlatButton(
                    minWidth: size.width * 0.35,
                    height: size.height * 0.058,
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {

                      if (_passwordKey.currentState?.validate() == true &&
                          _emailKey.currentState?.validate() == true ){
                        if (_currentMode == mode.signIn) {
                         // Provider.of<Auth>(context,listen: false).signin(emailController.text, passwordController.text);
                        } else {
                        //  Provider.of<Auth>(context,listen: false).signup(emailController.text, passwordController.text);
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsHomeScreen()));
                      }
                      // print('##################');
                      // print(emailController.text);
                      // print(passwordController.text);

                    },
                    child: Text(
                      (_currentMode == mode.signIn ? "Sign In" : 'Sign Up'),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15, right: 20),
                        width: size.width * 0.20,
                        child: Divider(
                          thickness: 2,
                          height: 4,
                        )),
                    Text(
                        _currentMode == mode.signIn
                            ? 'Or Sign In With'
                            : 'Or Sign Up With',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                        margin: EdgeInsets.only(left: 15, right: 20),
                        width: size.width * 0.20,
                        child: Divider(
                          thickness: 3,
                        )),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.13,
                      child: Image.network(
                        'https://www.pngkit.com/png/full/178-1783296_g-transparent-circle-google-logo.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: size.height * 0.06,
                      width: size.width * 0.13,
                      child: Image.network(
                        'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Don't Have An Account?",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_currentMode == mode.signIn) {
                          setState(() {
                            _currentMode = mode.signUp;
                          });
                        } else {
                          setState(() {
                            _currentMode = mode.signIn;
                          });
                        }
                      },
                      child: Text(
                        _currentMode == mode.signIn ? ' Sign Up' : 'Sign In',
                        style: TextStyle(
                            color: Colors.amber[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))
                ]),
                SizedBox(
                  height: size.height * 0.01,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
