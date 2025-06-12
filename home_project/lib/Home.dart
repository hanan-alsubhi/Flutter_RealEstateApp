import 'package:flutter/material.dart';
import 'package:home_project/CartPage.dart';


//start here
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color textFieldColor = Colors.transparent; // عشان يرجع شفاف
  final FocusNode _focusNode = FocusNode(); // نراقب التيكست فيلد هل في حاله تركيز انه يوزر يضغط عليه ولابرا
  int selecet=0;

  @override
  //هنا اول مارح نشغل التطبيق رح يكون التيكست فيلد شفاف لانه التركيز مو علية 
void initState() {
    super.initState();
    //يوم تركيز يتغير هنا بنغير اللون
    _focusNode.addListener(() {
      //اليورز ضغط الفيلد ولا ماضغط نشيك 
      setState(() {
        textFieldColor = _focusNode.hasFocus //_focusNode.hasFocus return boolean
            ? Colors.white //true make it white
            : Colors.transparent; // false make transparent
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 180, 197, 215), // Sets the background color

      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 66, 81, 97), //sets the appbar color
        centerTitle: true, 
        title: const Text(
          "DAR",
          style: TextStyle(
            color: Color.fromARGB(246, 134, 134, 134),
            fontFamily: 'Poppins',
          ),
        ),
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Container(
              height: 190,
              width: 400,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 30),
              margin: const EdgeInsets.only(top: 30, left: 15.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                image: DecorationImage(
                  fit: BoxFit.cover, 
                  image: AssetImage('images/LogoHomeScreen.jpg'),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 100, bottom: 40),
              child: const Text(
                "Explore Your Next Abode",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 98, 98, 98),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Search TextField
            Container(
             width: 900,
              margin: const EdgeInsets.only( top: 20,left: 50,right: 50,bottom: 40), //المسافات حقت الفيلد والصفحة
              child: TextField(
                maxLength: 10,
                cursorWidth: 2,cursorOpacityAnimates: true,//يصير كذا خفيف تدريجي
                //ربط الابوجكت فوق سويته مع فوكس
                focusNode: _focusNode,
                textInputAction: TextInputAction.next,//enter !
                decoration: InputDecoration(
                  filled: _focusNode.hasFocus,
                  fillColor: textFieldColor,
                  labelText: "   search places",
                  labelStyle: const TextStyle(fontSize: 15,color: Color.fromARGB(255, 66, 81, 97),),
                  hintText: "Enter the place you want to search... ",
                  hintStyle: const TextStyle(fontSize: 12,color: Color.fromARGB(255, 66, 81, 97),),
                  focusedBorder: OutlineInputBorder(//The border to display when the [InputDecorator] has the focus
                    borderSide: const BorderSide(color: Color.fromARGB(255, 66, 81, 97), width: 4),//Creates a rounded rectangle outline border 
                    borderRadius: BorderRadius.circular(70),//الحواف كيف تكون دويرة
                  ),
                  
                  suffixIcon: const Icon(Icons.search, size: 30, color: Color.fromARGB(255, 34, 41, 49),),
                  suffixIconConstraints: const BoxConstraints(minWidth: 60,),//make suffix in right

                ),
                
              ),
            ),

            // Horizontal scrolling row

            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling

                child: Row(
                  children: [
                    Container(
                      height: 250,
                      width: 200,
                      margin: const EdgeInsets.only(left: 8, bottom: 30),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          image: DecorationImage(
                            fit: BoxFit
                                .cover, 
                            image: AssetImage('images/home1Row.jpg'),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 72, 71, 71),
                                offset: Offset(4.0, 4.0),
                                blurRadius:20,
                                spreadRadius: 1.0)
                          ]),
                      child: InkWell(
                        onTap: () {
                          //  tap functionality here
                          Navigator.pushNamed(context, "/ListFilter");
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      height: 250,
                      width: 200,
                      margin: const EdgeInsets.only(left: 8, bottom: 30),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          image: DecorationImage(
                            fit: BoxFit
                                .cover, // Change fit according to your needs
                            image: AssetImage('images/home2Row.jpg'),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 72, 71, 71),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15,
                                spreadRadius: 1.0)
                          ]),
                      child: InkWell(
                        onTap: () {
                          //  tap functionality here
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      height: 250,
                      width: 200,
                      margin: const EdgeInsets.only(left: 8, bottom: 30),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          image: DecorationImage(
                            fit: BoxFit
                                .cover, // Change fit according to your needs
                            image: AssetImage('images/home3Row.jpg'),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 72, 71, 71),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15,
                                spreadRadius: 1.0)
                          ]),
                      child: InkWell(
                        onTap: () {
                          //  tap functionality here
                        },
                      ),
                    ),
                  ], //childrean for row
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 36),
            ),

            // Vertical scrolling column
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, // Enable vertical scrolling
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 490,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 66, 81, 97),
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15,
                                spreadRadius: 1.0)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              image: DecorationImage(
                                fit: BoxFit
                                    .cover, // Change fit according to your needs
                                image: AssetImage('images/home1Column.jpg'),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                //  tap functionality here
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 50.0, top: 30),
                                child: const Text(
                                  "Apartments",
                                  style: TextStyle(
                                    fontSize: 25.0, // Set large font size
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold, // Set bold font weight
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 50.0, right: 10),
                                    child: const Text(
                                      "viewed by (3029 vestor)",
                                      selectionColor:
                                          Color.fromARGB(133, 176, 176, 176),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.remove_red_eye,
                                      color: Color.fromARGB(255, 38, 38, 37),
                                      size: 16),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ), //fisrt column

                    const SizedBox(height: 30),

                    Container(
                      height: 120,
                      width: 490,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 66, 81, 97),
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15,
                                spreadRadius: 1.0)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              image: DecorationImage(
                                fit: BoxFit
                                    .cover, // Change fit according to your needs
                                image: AssetImage('images/home2Column.jpg'),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                //  tap functionality here
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 50.0, top: 40),
                                child: const Text(
                                  " Shared Apartments",
                                  style: TextStyle(
                                    fontSize: 18.0, // Set large font size
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold, // Set bold font weight
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 50.0, right: 10),
                                    child: const Text(
                                      "viewed by (3000 vestor)",
                                      selectionColor:
                                          Color.fromARGB(133, 176, 176, 176),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.remove_red_eye,
                                      color: Color.fromARGB(255, 38, 38, 37),
                                      size: 16),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ), //2nd column
                    const SizedBox(height: 30),

                    Container(
                      height: 120,
                      width: 490,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 66, 81, 97),
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15,
                                spreadRadius: 1.0)
                          ]),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 5),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              image: DecorationImage(
                                fit: BoxFit
                                    .cover, // Change fit according to your needs
                                image: AssetImage('images/home3Column.jpg'),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                //  tap functionality here
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 50.0, top: 40),
                                child: const Text(
                                  "Residential Building",
                                  style: TextStyle(
                                    fontSize: 18.0, // Set large font size
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold, // Set bold font weight
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 50.0),
                                    child: const Text(
                                      "viewed by (2307 vestor)    ",
                                      selectionColor:
                                          Color.fromARGB(133, 176, 176, 176),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.remove_red_eye,
                                      color: Color.fromARGB(255, 38, 38, 37),
                                      size: 16),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ), //3rd column

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ], //childrean for colum
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
