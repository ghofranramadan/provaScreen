import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import './models/brand.dart';

class BrandDetails extends StatelessWidget {
 // final List<List<Product>> product;
  // final int id;
  final String profilePicture;
  final String name;
  // final String image;
  final String nameOfProduct;
  final int price;
  final int ratingAverage;

  BrandDetails(
      {
      //this.product,
      //   this.id,
       this.profilePicture,
      this.name,
      //this.image,
      this.nameOfProduct,
      this.price,
      this.ratingAverage
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(profilePicture),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(name),
                        ],
                      ),
                      FlatButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Text('see more',
                            style: TextStyle(
                                color: Color(0xFFD3D3D3),
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView.builder(
                itemCount:  5,
                // product.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.33,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://hips.hearstapps.com/del.h-cdn.co/assets/17/27/640x959/gallery-1499460644-garlicky-1.jpg?resize=768:*'),
                                              fit: BoxFit.fill)),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: Color(0xFFD3D3D3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    nameOfProduct,
                                                    //product[index].name,
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  Text(price.toString(),
                                                    // product[index].price.toString(),
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width: 35,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFFFB600),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Container(
                                                  margin: EdgeInsets.all(3.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color: Colors.white,
                                                        size: 8,
                                                      ),
                                                      Text(
                                                        ratingAverage.toString(),
                                                      // product[index].ratingAverage.toString(),
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7.5,
                        )
                      ],
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }
}
