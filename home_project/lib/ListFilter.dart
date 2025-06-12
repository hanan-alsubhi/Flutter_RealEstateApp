import 'package:flutter/material.dart';
import 'package:home_project/CartPage.dart';
import 'package:home_project/Home.dart';


class Productlist {
  final String name;
  final double price;
  final String category;
  final String images;

  Productlist(this.name, this.price, this.category, this.images);
}

class ListFilter extends StatefulWidget {
  const ListFilter({super.key});

  @override
  _ListFilterState createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  final List<Productlist> products = [
    Productlist('Urban Apartment', 50.000, 'Taif', "images/ListProduct1.jpg"),
    Productlist(' New Apartment', 150.000, 'Yanbu', "images/ListProduct2.jpg"),
    Productlist("    7 floor building", 12.000, 'Taif', "images/ListProduct3.jpg"),
    Productlist('    Apartment', 30.0, 'Jeddah', "images/ListProduct4.jpg"),
    Productlist('    4 floor building', 20.0, 'Taif', "images/ListProduct5.jpg"),
    Productlist('  shared Apartment', 20.0, 'Taif', "images/ListProduct6.jpg"),
  ];

  String filterCategory = '';
  List<Productlist> filteredProducts = [];
  bool notFound = false;

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initialize filtered list
    notFound = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 180, 197, 215),
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 81, 97),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/Home");
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: 46,
          ),
          padding: const EdgeInsets.only(right: 40),
        ),
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
                        const SizedBox(height: 40),

              Container(
                      height: 100,
                      width: 500,
                      padding: const EdgeInsets.only( left: 50, right: 50),                      
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          image: DecorationImage(
                            fit: BoxFit .cover, 
                            image: AssetImage('images/N.jpg'),
                          ),
                          ),
                      
                    ),

              Container(
                margin: const EdgeInsets.only(left: 5,right: 5,bottom: 30), // المسافات حقت الفيلد والصفحة
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), //  الحواف بيضاوية
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // لون الظل
                      spreadRadius: 1, //  انتشار الظل
                      blurRadius: 10, //  تشويش الظل
                      offset: const Offset(3, 3), //  جهه الظل
                    ),
                  ],
                ),
                child: TextField(
                  maxLength: 10,
                  cursorWidth: 2,
                  cursorOpacityAnimates: true, // يصير كذا خفيف تدريجي
                  textInputAction: TextInputAction.next, // enter !
                  onChanged: (category) {
                    setState(() {
                      filterCategory = category.toLowerCase();
                      filteredProducts = products.where((product) => product.category.toLowerCase().contains(filterCategory)).toList();
                     
                      notFound = filteredProducts.isEmpty &&filterCategory.isNotEmpty; // هنا مالقي فا يرجع نل من برودكت مع انه اليوزر مدخل
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 193, 211, 231),
                    filled: true,
                    labelText: 'Filter by Category',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12), //  الحواف بيضاوية
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                    ),
                  ),
                ),
              ),


              if (notFound) //لوكان نوت فاوند بترو يعني فاضي رح يطبع رسالة
                const Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Text(
                    'NO RESULTS FOUND',
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              //فيه منتجات يعرضها
              if (!notFound)
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // two items in one row
                    childAspectRatio: 0.691, // حجم الكارد
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Card(
                      color: const Color.fromARGB(255, 66, 81, 97),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only( bottom: 29, left: 10, right: 10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                if (product.name == 'Urban Apartment') {
                                  Navigator.pushNamed(context, "/Product");
                                }
                              },
                              child: ClipRRect(
                                //Creates a rounded-rectangular clip
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                child: Image.asset(
                                  product.images,
                                  height: 209,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            //هنا رو عشان الاسم ,والسعر يجون جمب بعض
                            children: [
                              const SizedBox(width: 10), //space in left
                              Text(
                                product.name,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 25), // space between text
                              Text(
                                product.category,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16), //the space betwen name and price
                          Text(
                            '${product.price.toStringAsFixed(3)} SAR',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                          const SizedBox( height: 15), //  space for bottom of the card
                          
                        ],
                      ),
                      
                    );
                  },
                ),
                const SizedBox(height: 100),

            ],
            
          ),
          
        ),
        
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
