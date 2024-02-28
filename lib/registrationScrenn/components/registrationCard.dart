// ignore: file_names
part of '../registrationScreen.dart';

class RegistrationCard extends StatelessWidget {
  const RegistrationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding:const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Email', labelStyle: CommonTextStyles.inputLabelStyel),
                  controller:
                BlocProvider.of<RegistrationDataCubit>(context).emailController,
                ),
               const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'Password', labelStyle: CommonTextStyles.inputLabelStyel),
                  obscureText: true,
                  controller: BlocProvider.of<RegistrationDataCubit>(context).passwordController,
                ),
               const  SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'confirm password', labelStyle: CommonTextStyles.inputLabelStyel),
                  obscureText: true,
                  controller: BlocProvider.of<RegistrationDataCubit>(context).cnfpasswordController,
                ),
                const SizedBox(height: 20),
      Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                BlocProvider.of<RegistrationDataCubit>(context).registration(context);
              },
              child: Center(child: Text('Sign up', style: CommonTextStyles.btnTextStyel)),
            ),
          ),
        ],
      ),
    ),     

 const SizedBox(height: 30),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                              Text("already have an account", style: CommonTextStyles.labelText),
                              InkWell (
                              onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                             );
                              }  ,

                            child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text("Sing In",style: CommonTextStyles.linktext ),
      ))
             ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}