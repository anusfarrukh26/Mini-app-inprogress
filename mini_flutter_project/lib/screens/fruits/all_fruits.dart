import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_flutter_project/screens/fruits/highprice_fruits.dart';
import 'package:mini_flutter_project/screens/fruits/lowprice_fruits.dart';
import 'package:mini_flutter_project/screens/fruits/popular_fruits.dart';
import 'package:mini_flutter_project/screens/product_details.dart';

class AllFruits extends StatefulWidget {
  const AllFruits({super.key});

  @override
  State<AllFruits> createState() => _AllFruitsState();
}

class _AllFruitsState extends State<AllFruits> {
  int selectedContainerIndex = 0;

  List<String> upbartitle = [
    "All Fruits",
    "Popular Fruits",
    "Low Price Fruits",
    "High Price Fruits",
  ];
  List ProductData = [
    {'price': '\$40', 'name': "Pomegranate", 'title': 'Fresh & Organic'},
    {'price': '\$35', 'name': 'Mango', 'title': 'Fresh & Organic'},
    {'price': '\$10', 'name': 'Watermelon', 'title': 'Fresh & Organic'},
    {'price': '\$25', 'name': 'Apple', 'title': 'Fresh & Organic'},
    {'price': '\$15', 'name': 'Cherries', 'title': 'Fresh & Organic'},
    {'price': '\$45', 'name': 'Banana', 'title': 'Fresh & Organic'},
  ];
  List Productsvgpath = [
    "assets/svg/mangoooo.svg",
    "assets/svg/pooemegranateee.svg",
    "assets/svg/watrermelon3.svg",
    "assets/svg/apple4.svg",
    "assets/svg/cherries5.svg",
    "assets/svg/banana6.svg",
  ];
  List upbarpages = [
    AllFruits(),
    PopularFruits(),
    LowPriceFruits(),
    HighPriceFruits(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: SvgPicture.asset("assets/svg/Fill 4.svg")),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Upto 50% Fruit Items",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < upbartitle.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedContainerIndex = i;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => upbarpages[i],
                            ),
                          );
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: selectedContainerIndex == i
                                ? Color(0xFFF9B023)
                                : Colors.white,
                            border: Border.all(color: Color(0xFFB2BBCE)),
                          ),
                          child: Center(
                            child: Text(
                              upbartitle[i],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selectedContainerIndex == i
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < Productsvgpath.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              svgPath: Productsvgpath[i],
                              name: ProductData[i]['name'],
                              title: ProductData[i]['title'],
                              price: ProductData[i]['price'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  Productsvgpath[i],
                                  height: 90,
                                  // MediaQuery.of(context).
                                  width: 110,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  ProductData[i]['name'],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF555555),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  ProductData[i]['title'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF555555),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ProductData[i]['price'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SvgPicture.asset("assets/svg/Cart.svg")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
