import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_state.dart';
import 'package:flutter_vict_app/src/domain/auth_service_cubit.dart';
import 'package:flutter_vict_app/src/screens/login_screen/login_screen_widgets/login_screen_error_widget.dart';
import 'package:flutter_vict_app/src/screens/login_screen/login_screen_widgets/box_textfield_widget.dart';

class LoginScreenBodyWidget extends StatefulWidget {
  const LoginScreenBodyWidget({super.key});

  @override
  State<LoginScreenBodyWidget> createState() => _LoginScreenBodyWidgetState();
}

class _LoginScreenBodyWidgetState extends State<LoginScreenBodyWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: 300,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // email
                    BoxTextFieldWidget(
                      childWidget: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: LanguageMap.lngMap['emailhint'],
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    // password
                    BoxTextFieldWidget(
                      childWidget: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: LanguageMap.lngMap['passwhint'],
                            errorText: null),
                      ),
                    ),
                    // error messages

                    SizedBox(
                      height: 60,
                      child: ErrorMessagesWidget(authState: state),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            state.runtimeType == AuthStateLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      height: 1,
                      width: 150,
                      child: LinearProgressIndicator(),
                    ),
                  )
                : FilledButton(
                    onPressed: () async {
                      context.read<AuthCubit>().login(
                          login: _emailController.text.trim(),
                          password: _passwordController.text);
                    },
                    child: Text(LanguageMap.lngMap['authBtn']),
                  ),
          ],
        );
      },
    );
  }
}
