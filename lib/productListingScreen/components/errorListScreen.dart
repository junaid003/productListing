part of '../productListingscreen.dart';


// ignore: must_be_immutable
class ErrorListScreen extends StatelessWidget {
  productListError state;
  ErrorListScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(state.message != null
                ? state.message.toString()
                : "Something went wrong")),
               const SizedBox(height: 20,),
        InkWell(
          onTap: () {
            BlocProvider.of<ProductListingCubit>(context).fetchProduct();
          },
          child: Container(
            height: 30,
            width: 100,
             decoration:const BoxDecoration(
              color:  Color.fromARGB(255, 95, 71, 249),
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child:const Center(
              child:  Text(
                'Retry',
                style: TextStyle(fontSize:15 ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
