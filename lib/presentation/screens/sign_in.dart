import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged/logic/bloc/auth/auth_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        title: const Text('Miaged'),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.white),
              label: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushNamed('/home');
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 20.0, right: 20.0, bottom: 8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: 'Email'),
                          controller: _emailController,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an email' : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 20.0, right: 20.0, bottom: 8.0),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) => value!.length < 6
                              ? 'Enter a password with at least 4 characters'
                              : null,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                            onPressed: () {
                              _authenticateWithEmailAndPassword(context);
                            },
                            child: const Text('Sign In',
                                style: TextStyle(color: Colors.white))),
                      ),
                      //Text(error, style: const TextStyle(color: Colors.red))
                    ],
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      context.read<AuthBloc>().add(
            SignInRequested(_emailController.text, _passwordController.text),
          );
    }
  }
}
