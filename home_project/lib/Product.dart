import 'package:flutter/material.dart';
import 'package:home_project/CartPage.dart';
import 'package:home_project/Home.dart';
import 'package:home_project/cart_model.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  const Product({super.key});
  @override
  _ProductState createState() => _ProductState();
}
class _ProductState extends State<Product>{
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 180, 197, 215),
      appBar: AppBar(
        elevation: 3,
        title: const Text("DAR" ,style: TextStyle(color: Colors.white,),),
        centerTitle: true,
        leading: IconButton(
           onPressed: () {
            Navigator.pushNamed(context, "/ListFilter");
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: 46,
          ),
          padding: const EdgeInsets.only(right: 40),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 81, 97),
        actions: [
          IconButton(
            onPressed: () {setState(() {
                isFavorite = !isFavorite; // Toggle favorite state
              });},
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 46,
            ),
            padding: const EdgeInsets.only(right: 20),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 23,),
            SizedBox(
              height: 300,
              child: ImageCarousel(),
            ),
            Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20,left:30),
              child: const Text(
                "Urban Apartment",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 20,left:100,),
              child: const Text(
                "Taif",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.normal),
              ),
            ),],),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 30,left:30,),
              child: const Text(
                "this place is perfect for big family. Here you will find alll facility that an apartment should have. And there's also some spoecial facility that other Reed more",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            SingleChildScrollView( scrollDirection: Axis.horizontal, child:Row(
              children: [
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(45),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: const Row(
                    children: [
                      Icon(Icons.directions_car, color: Colors.black, size: 32),
                      SizedBox(width: 8),
                      Text(
                        "Parking",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: const Row(
                    children: [
                      Icon(Icons.bed, color: Colors.black, size: 32),
                      SizedBox(width: 8),
                      Text(
                        "Bedroom",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(45),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: const Row(
                    children: [
                      Icon(Icons.bathtub, color: Colors.black, size: 32),
                      SizedBox(width: 8),
                      Text(
                        "Bathroom",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(45),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: const Row(
                    children: [
                      Icon(Icons.weekend, color: Colors.black, size: 32),
                      SizedBox(width: 8),
                      Text(
                        "living room",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(45),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: const Row(
                    children: [
                      Icon(Icons.kitchen, color: Colors.black, size: 32),
                      SizedBox(width: 8),
                      Text(
                        "Kitchen",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: const Text(
                      "50,000 SAR",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                  onPressed: () {
                    // Add item to cart
                    final cartItem =
                        CartItem(name: "Urban Apartment", price: "50,000 SAR");
                    Provider.of<Cart>(context, listen: false).addItem(cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to cart!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 66, 81, 97), // Button color

                    padding:
                        const EdgeInsets.symmetric(horizontal: 55.0, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100,),

          ],
        ),
      ),
      //navagation here
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

class ImageCarousel extends StatelessWidget {
  final List<String> productImages = [
    'images/Building.jpeg',
    'images/parking.jpeg',
    'images/bedroom.png',
    'images/bathroom.png',
    'images/livingroom.png',
    'images/kitchen.jpeg',
  ];

   ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: productImages.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(15), // Rounded corners
            child: Image.asset(
                    productImages[index],
                    fit: BoxFit.cover, // Cover the container
            ),
          ),
        );
      },
    );
  }
}
