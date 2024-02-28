part of '../productSearchScreen.dart';

class searchcard extends StatelessWidget {
  const searchcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
      child: Column(children: [
               TextField(
                  decoration:  InputDecoration(labelText: 'Enter product Name', labelStyle: CommonTextStyles.inputLabelStyel),
                  controller:
                BlocProvider.of<ProductSearchCubit>(context).searchController,
                ),
                const SizedBox(height: 15),
          ElevatedButton(
          onPressed: () {
           FocusManager.instance.primaryFocus?.unfocus();
          BlocProvider.of<ProductSearchCubit>(context).searchProduct(context);
          },
          child:  Text('Search', style: CommonTextStyles.btnTextStyel),
         ),  
             ],),
    );
  }
}