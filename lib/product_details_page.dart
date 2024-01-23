import 'package:flutter/material.dart';

import 'prezentation/resources/app_icons.dart';
import 'prezentation/resources/app_colors.dart';

import 'product_model.dart';

// Define the Review model
class Review {
  final String author;
  final String date; // Ideally this would be a DateTime object
  final String comment;
  final double rating;

  Review({
    required this.author,
    required this.date,
    required this.comment,
    required this.rating,
  });
}


// Import your models
// import 'path_to_your_product_model.dart';
// import 'path_to_your_review_model.dart';
class ProductDetailsPage extends StatelessWidget {
  final Product product;
  ProductDetailsPage({Key? key, required this.product}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // Dummy data for sizes and reviewss. Replace with your actual data source.
    final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
    // final List<String> reviews = [
    //   'Great product, loved it!',
    //   'The fit is a bit off, but great quality.',
    //   'Loved the color and material.',
    // ];
    final List<Review> reviews = [
      Review(
        author: 'John Doe',
        date: '20 Oct, 2023',
        comment: 'Great product, loved it!',
        rating: 4.5,
      ),
      Review(
        author: 'Jane Smith',
        date: '18 Oct, 2023',
        comment: 'The fit is a bit off, but great quality.',
        rating: 4.0,
      ),
      // ... more reviews
    ];


    return Scaffold(
      // FIXME: nav bar of the product
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Makes the AppBar background transparent
        elevation: 0, // Removes shadow from the AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Change to match your icon color
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true, // Centers the title if set to true
        // title: Text(
        //   productName,
        //   style: TextStyle(color: Colors.black), // Change to match your text color
        // ),
        title: Text(product.name, style: TextStyle(color: AppColors.blackColor)),
        actions: [
          IconButton(
            icon: AppIcons.shoppingCartIcon(context), // Assuming your icon is set up to match the style
            onPressed: () {
              // TODO: Shopping cart action
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: AppColors.blackColor,
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // FIXME: the top image
            Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 600,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // FIXME: row for price & name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Column for the product name and its label
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jewelry',
                              style: TextStyle(
                                color: AppColors.graySmokeColor,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              product.name, // Use the product name variable
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Column for the product price and its label
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Price', // This is the label for price
                            style: TextStyle(
                              color: Colors.grey, // Adjust the color to match your design
                              fontSize: 12, // Adjust the size to match your design
                            ),
                          ),
                          Text(
                            '\$${product.price}', // Use the product price variable
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // FIXME: add the four more examples
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 90.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 140.0,
                          child: Image.asset('lib/prezentation/assets/models/rectangle_one.png'),
                        ),
                        Container(
                          width: 140.0, // Adjust the width to fit your layout
                          child: Image.asset('lib/prezentation/assets/models/rectangle_two.png'),
                        ),
                        Container(
                          width: 140.0, // Adjust the width to fit your layout
                          child: Image.asset('lib/prezentation/assets/models/rectangle_three.png'),
                        ),
                        Container(
                          width: 140.0, // Adjust the width to fit your layout
                          child: Image.asset('lib/prezentation/assets/models/rectangle_four.png'),
                        ),
                      ],
                    ),
                  ),
                  // FIXME: end the four more examples

                  // FIXME: the size container
                  SizedBox(height: 16),
                  Text(
                    'Size',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40, // Adjust the height of the container holding the sizes
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Handle the size tap
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 23.0), // Horizontal padding inside the container
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color of the size container
                                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: Text(
                                sizes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, // Font size for size text
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // FIXME: the size container end

                  // FIXME: description part
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 2, // This will make the line height double the font size
                    ),
                  ),

                  Text(
                    'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with a luxurious touch.',
                    style: TextStyle(fontSize: 16),
                  ),
                  // FIXME: description end


                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items horizontally
                    children: <Widget>[
                      Text(
                        'Reviews',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  // FIXME: end the header of the review

                  // FIXME: add new review
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items horizontally
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '245 reviews',
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '4.8',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 4), // Add some space between the rating and stars
                              Row(
                                children: List.generate(
                                  5,
                                      (index) => Icon(
                                    Icons.star,
                                    color: index < 4 ? AppColors.goldColor : AppColors.graySmokeColor, // Make 4 stars gold and the last one grey
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Add Review action
                        },
                        icon: Icon(Icons.edit),
                        label: Text('Add Review'),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.blueOceanColor, // Use your custom color here
                          textStyle: TextStyle(fontSize: 16),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding as needed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // FIXME: end the part with review
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Review review = reviews[index];
                      return Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          leading: CircleAvatar(
                            // Placeholder for user image; replace with actual image source
                            backgroundImage: AssetImage('lib/prezentation/assets/models/round.png'),
                            radius: 20,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                review.author,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                review.date, // This is correct
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(height: 5),
                              Text(
                                review.comment, // Use 'comment' field instead of 'text'
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(5, (starIndex) {
                              return Icon(
                                starIndex < review.rating ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 20,
                              );
                            }),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        ),
                      );
                    },
                  ),

                  //   FIXME: the bottom text last
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items horizontally
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Total Price',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'with VAT, SD',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '\$125',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //   FIXME: end the bottom text last

                ],
              ),
            ),

            // FIXME the bottom button
            Container(
              width: double.infinity, // Set the width to fill the parent horizontally
              margin: EdgeInsets.symmetric(horizontal: 0), // Adjust the horizontal margin as needed
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add to Cart action
                },
                child: Text('Add to Cart', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.blueOceanColor, // Use your custom color here
                  padding: EdgeInsets.symmetric(vertical: 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // Set borderRadius to 0 to remove rounded corners
                  ),
                ),
              ),
            ),
          //   FIXME: end the button
          ],
        ),
      ),
    );
  }
}

