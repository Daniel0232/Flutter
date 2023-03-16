import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/login.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              'coreivent',
              style: TextStyle(fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              foreground: Paint()..shader = LinearGradient(
                colors: <Color>[
                    Color.fromARGB(255, 0, 103, 131), 
                    Color.fromARGB(255, 84, 125, 190),
                    Color.fromARGB(255, 9, 173, 234),
                    //add more color here.
                ],
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
              ),
            ), const Padding(padding: EdgeInsets.only(bottom: 12)),const Align(alignment: const Alignment(-1, 0)),
            const Text(
              'Hola',
              style: TextStyle(fontFamily: 'Roboto',  color: Colors.black
              ),
            ),const Padding(padding: EdgeInsets.only(bottom: 6)),

            const Text('Utiliza tus credenciales de usuario para acceder al sistema'),const Padding(padding: EdgeInsets.all(6)),

            const Text('Español'),const Padding(padding: EdgeInsets.only(bottom: 6)),
            const Text('cambiar'),const Padding(padding: EdgeInsets.only(bottom: 6)),
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),const Padding(padding: EdgeInsets.all(12)),
            const Text('Has olvidado tu contraseña',
            style: TextStyle(color: Color.fromARGB(255 ,0, 103, 131)),),const Padding(padding: EdgeInsets.all(12)),
            const Text('Si no dispones de una cuenta de usuario o tienes problemas para acceder, ponte en contacto con tu administrador.'),const Padding(padding: EdgeInsets.all(6)),
            _LoginButton(),          
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 2, 
                style: BorderStyle.none,
              ),
            ),
            labelText: 'username',
            errorText: state.username.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
             border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 2, 
                style: BorderStyle.none,
              ),
            ),
            labelText: 'password',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text('Acceder'),
              );
      },
    );
  }
}
