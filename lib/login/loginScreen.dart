import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/login/cubit/login_cubit.dart';
import 'package:product/core/core_ui.dart';
import 'package:product/registrationScrenn/registrationScreen.dart';
part 'components/loginBtn.dart';
part 'components/loginCard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoginCard(),
                    const LoginBtn(),
                    const SizedBox(height: 30),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                              Text("Dont have account?", style: CommonTextStyles.labelText),
                              InkWell (
                              onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Registration(),
                              ),
                             );
       },
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text("Sing Up",style: CommonTextStyles.linktext ),
      )),
     ],)
                  ],
                );
              },
            ),
          ),
      
      ),
    );
  }
}
