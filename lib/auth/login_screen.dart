import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_request/main_page/main_page.dart';

import '../widgets/widgets.dart';
import 'auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthStateData>(
        listener: (context, state) async {
          if (state.state == AuthState.success) {
            setState(() {
              _isClicked = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => MainPage()));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
                (route) => false);
          } else if (state.state == AuthState.error) {
            // Show an error message to the user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Image.asset(
                      "assets/images/shopping_lady.png",
                      // height: 100,
                      // width: 100,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    textField(
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return "Invalid Username";
                        }
                      },
                      text: "Username",
                      controller: _usernameController,
                      prefixicon: const Icon(Icons.email),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textField(
                      valiDator: (value) {
                        if (value.isEmpty) {
                          return "Invalid password";
                        }
                      },
                      obscuretext: _isObscure,
                      text: "Password",
                      controller: _passwordController,
                      prefixicon: const Icon(Icons.key),
                      suffixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = _isObscure ? false : true;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    // ElevatedButton(
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         authBloc.add(LoginEvent(
                    //           username: _usernameController.text,
                    //           password: _passwordController.text,
                    //         ));
                    //       }
                    //     },
                    //     child: Text("Login")),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authBloc.add(LoginEvent(
                            username: _usernameController.text,
                            password: _passwordController.text,
                          ));
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 50,
                        width: _isClicked ? 60 : 300,
                        decoration: BoxDecoration(
                            color: _isClicked
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Colors.orangeAccent,
                            borderRadius: _isClicked
                                ? BorderRadius.circular(40)
                                : BorderRadius.circular(10)),
                        child: Center(
                            child: _isClicked
                                ? Icon(Icons.done)
                                : const Text("Login")),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    if (state.state == AuthState.loading)
                      CircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          );

          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       TextField(
          //         controller: _usernameController,
          //         decoration: InputDecoration(labelText: 'Username'),
          //       ),
          //       TextField(
          //         controller: _passwordController,
          //         decoration: InputDecoration(labelText: 'Password'),
          //         obscureText: true,
          //       ),
          //       SizedBox(height: 20),
          //       ElevatedButton(
          //         onPressed: () {
          //           authBloc.add(LoginEvent(
          //             username: _usernameController.text,
          //             password: _passwordController.text,
          //           ));
          //         },
          //         child: Text('Login'),
          //       ),
          //       if (state.state == AuthState.loading)
          //         CircularProgressIndicator(),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
