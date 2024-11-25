import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vict_app/src/config/constants/language_map.dart';
import 'package:flutter_vict_app/src/config/routes/router_state.dart';
import 'package:flutter_vict_app/src/domain/auth_service_cubit.dart';
import 'package:flutter_vict_app/src/screens/login_screen/login_screen_widgets/login_screen_body_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LanguageMap.lngMap['logStitle']),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                LanguageMap.lngMap['logDescription'],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              const LoginScreenBodyWidget(),

              // footer
              const Spacer(flex: 2),
              Center(
                child: GestureDetector(
                  onTap: () => context.read<AuthCubit>().loginMOCK(),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      LanguageMap.lngMap['logfooter'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
