part of '../productAddScreen.dart';
class productAddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration:  InputDecoration(labelText: 'Name', labelStyle: CommonTextStyles.inputLabelStyel),
                controller:
              BlocProvider.of<ProductAddCubit>(context).nameController,
              ),
             const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Measurement', labelStyle: CommonTextStyles.inputLabelStyel),
                controller: BlocProvider.of<ProductAddCubit>(context).measurementController,
              ),
            const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(labelText: 'Price', labelStyle: CommonTextStyles.inputLabelStyel),
                controller: BlocProvider.of<ProductAddCubit>(context).priceController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.allow(RegExp(r'^\d+(?:\.\d+)?$')),
               ], 
              ),
            ],
          ),
        ),
      ),
    );
  }
}