import 'package:flutter/material.dart';
import 'package:home_project/Home.dart';
import 'package:home_project/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 180, 197, 215),
        appBar: AppBar(
          automaticallyImplyLeading :false,
          backgroundColor: const Color.fromARGB(255, 66, 81, 97),
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
          
        ),
        body: Column(
          children: [
            Expanded(
                child: cart.itemCount == 0
                    ? const Center(child: Text("Your cart is empty!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),))
                    : ListView.builder(
                        itemCount: cart.itemCount,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return Container(
                              width: 150,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(2, 3),
                                    )
                                  ]),
                              child: ListTile(
                                title: Text(
                                  item.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  item.price,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove_shopping_cart_sharp),
                                  onPressed: () {
                                    cart.removeItem(item);
                                  },
                                ),
                              ));
                        },
                      )),
            Container(
              width: 150,
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 66, 81, 97),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    )
                  ]),
              child: TextButton(
              onPressed: () {
                  Navigator.pushNamed(context, "/ListFilter");
              },
              child: const Text(
                "Book Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),

            )
          ],
        ),
           bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 176, 176, 176),
        unselectedItemColor: const Color.fromARGB(255, 176, 176, 176),
        iconSize:30,
        items: const [
          
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 66, 81, 97) ,
            icon: Icon(Icons.home_filled), 
            label: '',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          final screens = [
            const Home(),
            const CartPage(),
            const Center(child: Text('IN FUTURE',style: TextStyle(fontSize: 24),),),
            const Center(child: Text('IN FUTURE',style: TextStyle(fontSize: 24),),),

          ];
          Navigator.push(context, MaterialPageRoute(builder: (context) => screens[index]),);}

    ),
       );
  }
}
