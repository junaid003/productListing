part of '../productListingscreen.dart';

// ignore: must_be_immutable
class DrawerCard extends StatelessWidget {
  String emaild;
   DrawerCard({super.key,  required this.emaild});
  @override
  Widget build(BuildContext context) {
    return   Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
             DrawerHeader(
              decoration:const BoxDecoration(
                color: Colors.green,
              ), 
              child: UserAccountsDrawerHeader(
                decoration:const BoxDecoration(color: Colors.green),
                accountName: const Text(
                 "HELLO",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text( emaild.toString(),),
              ), 
            ), 
            ListTile(
              leading: const Icon(Icons.add),
              title:  Text(' Product Add ', style: CommonTextStyles.drawerlabelText),
              onTap: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductAddScreen(),
                              ),
                             );
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title:  Text(' Search ', style: CommonTextStyles.drawerlabelText),
              onTap: () {
               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductSearchScreen(),
                              ),
                             );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title:  Text('Log Out',style: CommonTextStyles.drawerlabelText),
              onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          const LoginScreen()), (Route<dynamic> route) => false);
              });
              },
            ),
          ],
        ),
    );
  }
}