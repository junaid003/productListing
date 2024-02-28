// ignore: file_names
part of '../loginScreen.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        margin:const EdgeInsets.all(20.0),
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Email', labelStyle: CommonTextStyles.inputLabelStyel),
                controller:
              BlocProvider.of<LoginCubit>(context).emailController,
              ),
             const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Password', labelStyle: CommonTextStyles.inputLabelStyel),
                obscureText: true,
                controller: BlocProvider.of<LoginCubit>(context).passwordController,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}