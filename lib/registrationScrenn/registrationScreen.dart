// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/login/loginScreen.dart';
import 'package:product/registrationScrenn/cubit/registration_data_cubit.dart';
import 'package:product/core/core_ui.dart';
part 'components/registrationCard.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationDataCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: 
                 Text("Registration", style: DataListingScreenTextStyles.appBar, )),
        
          body: const Column(
        children: [
          RegistrationCard(),
        ],
      )),
    );
  }
}
