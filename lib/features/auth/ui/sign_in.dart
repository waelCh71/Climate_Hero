import 'package:climate_hero/state%20management_auth/bloc/gloabl_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);
  @override
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername =
      TextEditingController();
  final TextEditingController _controllerPassword =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GloablBloc>(context).checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: BlocBuilder<GloablBloc, GloablState>(
        builder: (context, state) {
          if (state is LoadingEvent) {
            print("\nstate loading");
            return Center(
              child: CircularProgressIndicator(
                  color: Colors.blueAccent.shade200,
                  //backgroundColor: Colors.black,
                  strokeWidth: 10),
            );
          } else if (state is AUthenticatedError) {
            print("\nstate error");
            //TODO ERROR
            return Text(state.error);
            //snackBarShow(state.error, 1500, Colors.white);
          } else if (state is AUthenticated) {
            print("\nstate authenticated");
            return const Main();
          }
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Text(
                    "Welcome back",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Login to your account",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 60),
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: _controllerUsername,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      //counterStyle: const TextStyle(color: Colors.black),
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onEditingComplete: () => _focusNodePassword.requestFocus(),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email.";
                      } else if (!(value.contains('@') &&
                          value.contains('.'))) {
                        return "Invalid email";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _controllerPassword,
                    focusNode: _focusNodePassword,
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: _obscurePassword
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password.";
                      } else if (value.length < 8) {
                        return "password must contains at least 8 characters.";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent.shade200,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            //_boxLogin.put("loginStatus", true);
                            //_boxLogin.put("userName", _controllerUsername.text);

                            context.read<GloablBloc>().add(SignInEvent(
                                _controllerUsername.text,
                                _controllerPassword.text));

                            if (state is AUthenticated) {
                              snackBarShow("Welcome", 1500, Colors.white);
                            }
                          }
                        },
                        child: const Text("Login"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              _formKey.currentState?.reset();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const Signup();
                                  },
                                ),
                              );
                            },
                            child: const Text("Signup"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void snackBarShow(String x, int t, Color cl) {
    SnackBar snackBar = SnackBar(
      backgroundColor: cl,
      content: Text(
        x,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      duration: Duration(seconds: t),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
