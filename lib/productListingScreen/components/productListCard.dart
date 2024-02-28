part of '../productListingscreen.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({super.key, required this.productData});
  final ProductModel productData;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(productDetailsData: productData ),
                        ));
                  },
                  title: Text(
                    productData.name,
                   style: DataListingScreenTextStyles.title
                  ),
                  subtitle: Text(  "₹  ${productData.price}", style: DataListingScreenTextStyles.subtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
