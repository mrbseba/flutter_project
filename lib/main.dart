import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'prezentation/resources/app_icons.dart';
import 'prezentation/resources/app_colors.dart';

// import the second page for the project
import 'product_details_page.dart';
import 'product_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTM Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// FIXME: home page
class _HomePageState extends State<HomePage> {

  late Product selectedProduct;
  // FIXME: the list of the products
  // final List<Product> products = [
  //   Product(
  //     name: "Addidas Club",
  //     category: "Men's Clothing",
  //     price: "99.0",
  //     imagePath: "lib/prezentation/assets/models/model_one.png",
  //   ),
  //   Product(
  //     name: "Nike Club",
  //     category: "Jewelery",
  //     price: "99.0",
  //     imagePath: "lib/prezentation/assets/models/model_two.png",
  //   ),
  //   Product(
  //     name: "Fila Club",
  //     category: "Electronics",
  //     price: "99.0",
  //     imagePath: "lib/prezentation/assets/models/model_three.png",
  //   ),
  //   Product(
  //     name: "Puma Club",
  //     category: "Women's clothing",
  //     price: "99.0",
  //     imagePath: "lib/prezentation/assets/models/model_four.png",
  //   ),
  // ];
  // FIXME: used for the delay
  late List<Product> products;
  bool _isLoaded = false;


  void initState() {
    super.initState();
    products = [];
    loadProductsAfterDelay();
  }
  void loadProductsAfterDelay() {
    // Add a post-frame callback to introduce the delay
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          // Load your products here
          products = [
            Product(
              name: "Addidas Club",
              category: "Men's Clothing",
              price: "99.0",
              imagePath: "lib/prezentation/assets/models/model_one.png",
            ),
            Product(
              name: "Nike Club",
              category: "Jewelery",
              price: "99.0",
              imagePath: "lib/prezentation/assets/models/model_two.png",
            ),
            Product(
              name: "Fila Club",
              category: "Electronics",
              price: "99.0",
              imagePath: "lib/prezentation/assets/models/model_three.png",
            ),
            Product(
              name: "Puma Club",
              category: "Women's clothing",
              price: "99.0",
              imagePath: "lib/prezentation/assets/models/model_four.png",

            ),
          ];
          _isLoaded = true;
        });
      });
    });
  }


  @override
  // void initState() {
  //   super.initState();
  //   products = [];
  //   Future.delayed(Duration(seconds: 3), () {
  //     setState(() {
  //       products = [
  //       Product(
  //         name: "Addidas Club",
  //         category: "Men's Clothing",
  //         price: "99.0",
  //         imagePath: "lib/prezentation/assets/models/model_one.png",
  //       ),
  //       Product(
  //         name: "Nike Club",
  //         category: "Jewelery",
  //         price: "99.0",
  //         imagePath: "lib/prezentation/assets/models/model_two.png",
  //       ),
  //       Product(
  //         name: "Fila Club",
  //         category: "Electronics",
  //         price: "99.0",
  //         imagePath: "lib/prezentation/assets/models/model_three.png",
  //       ),
  //       Product(
  //         name: "Puma Club",
  //         category: "Women's clothing",
  //         price: "99.0",
  //         imagePath: "lib/prezentation/assets/models/model_four.png",
  //
  //       ),];
  //       _isLoaded = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // loadProductsAfterDelay();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget> [
            // Static top bar with menu and shopping cart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: AppIcons.menuIcon(context),
                    onPressed: () {
                      print('Menu tapped');
                    },
                  ),
                  IconButton(
                    icon: AppIcons.shoppingCartIcon(context),
                    onPressed: () {
                      print('Shopping cart tapped');
                    },
                  ),
                ],
              ),
            ),
            // Scrollable content area
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // FIXME: the top message text
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 1.2
                            ),
                            children: <TextSpan>[
                              // main text
                              TextSpan(
                                  text: 'Hello\n',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                  )
                              ),
                              TextSpan(
                                text: 'Welcome to UTM SHOP.', // Second line of text
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.graySmokeColor, // gray color
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ),

                    Padding(
                      // Adjust the padding as needed
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0), // left, top, right, bottom
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                              ),
                            ),
                          ),
                          Padding(
                            // Adjust right padding if needed
                            padding: const EdgeInsets.only(left: 10.0, right: 20),
                            child: InkWell(
                              onTap: () {
                                print('Microphone tapped');
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0), // Adjust padding inside the container
                                decoration: BoxDecoration(
                                  color: AppColors.blueOceanColor, // Your color
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: SizedBox(
                                  width: 30, // Adjust width if needed
                                  height: 30, // Adjust height if needed
                                  child: AppIcons.voiceIcon(context), // Your microphone icon widget
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // FIXME: for the category
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0), // Adjust the padding as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // This aligns the text widgets to each side of the Row
                        children: [
                          Text(
                            'Choose Category',
                            style: TextStyle(
                              fontSize: 20, // Set the font size as per your design
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.black, // Set the text color to black or any other color as per your design
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Action when 'View All' is tapped
                              print('View All tapped');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 20.0), // Adjust the right padding to move 'View All' a bit to the left
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 16, // Set the font size smaller than 'Choose Category'
                                  fontWeight: FontWeight.bold, // Make the text bold
                                  color: AppColors.lightgrayColor, // Set the text color to indicate it is tappable, adjust color as per your design
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FIXME: end for the category

                    // FIXME: the logo from category
                    Container(
                      height: 100.0,
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3, // Total number of categories
                        itemBuilder: (context, index) {
                          Widget logo;
                          switch (index) {
                            case 0:
                              logo = AppIcons.adidasIcon(context);
                              break;
                            case 1:
                              logo = AppIcons.nikeIcon(context);
                              break;
                            case 2:
                              logo = AppIcons.filaIcon(context);
                              break;
                            case 3:
                              logo = AppIcons.pumaIcon(context);
                              break;
                            default:
                              logo = AppIcons.menuIcon(context); // Default case, if required
                          }
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0), // Space between category items
                            width: 130, // Width of each category item container
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    // Logo container with adjusted padding
                                    padding: EdgeInsets.all(8), // Padding inside the logo container
                                    child: Center(child: logo), // Center the logo horizontally
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    //FIXME: top text for products
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0), // Adjust the padding as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // This aligns the text widgets to each side of the Row
                        children: [
                          Text(
                            'All products',
                            style: TextStyle(
                              fontSize: 20, // Set the font size as per your design
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.black, // Set the text color to black or any other color as per your design
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Action when 'View All' is tapped
                              print('View All tapped');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 20.0), // Adjust the right padding to move 'View All' a bit to the left
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 16, // Set the font size smaller than 'Choose Category'
                                  fontWeight: FontWeight.bold, // Make the text bold
                                  color: AppColors.lightgrayColor, // Set the text color to indicate it is tappable, adjust color as per your design
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // FIXME: the products list
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:  GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          childAspectRatio: (1 / 1.9),
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectedProduct = product;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetailsPage(product: selectedProduct),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        product.imagePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 245,
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: IconButton(
                                        icon: Icon(Icons.favorite_border, color: AppColors.graySmokeColor),
                                        onPressed: () {
                                          // Handle the heart icon tap
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _isLoaded
                                    ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(product.name),
                                      SizedBox(height: 4),
                                      Text(product.category, style: TextStyle(fontSize: 12, color: Colors.grey)),
                                      SizedBox(height: 8),
                                      Text('\$${product.price}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ): Center(child: CircularProgressIndicator(),
                                ),
                                ),
                              ],
                            ),

                          );
                        },
                      )

                    )


                  ], // FIXME: the end of the main children
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
