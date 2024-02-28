part of '../productAddScreen.dart';

class ProductSave extends StatelessWidget {
  const ProductSave({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
          child: SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                BlocProvider.of<ProductAddCubit>(context).productSave(context);
              },
              child:  Text('Save', style: CommonTextStyles.btnTextStyel),
            ),
          ),
        ),
      ],
    );
  }
}
