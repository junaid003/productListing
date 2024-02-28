part of '../loginScreen.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                BlocProvider.of<LoginCubit>(context).loginfunction(context);
              },
              child: Center(child: Text('Login', style: CommonTextStyles.btnTextStyel)),
            ),
          ),
        ],
      ),
    );
  }
}
