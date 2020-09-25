import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/product.dart';

class BrandDetails extends StatelessWidget {
  final String name;
  final String profilePicture;
  final List<Product> productsOfBrand;
  BrandDetails({this.name, this.profilePicture, this.productsOfBrand});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 14,
      ),
      width: double.infinity,
      height: 205,
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 44,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000),
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(profilePicture),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 16,
                        width: 50,
                        child: Text('see more',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ListView.builder(
                itemCount: productsOfBrand.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF000000),
                                    blurRadius: 2,
                                    offset: Offset(1, 3),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFF5F5F5)),
                            width: MediaQuery.of(context).size.width * 0.33,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF000000),
                                              blurRadius: 2,
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                productsOfBrand[index]
                                                            .images
                                                            .length ==
                                                        0
                                                    ? ''
                                                    : productsOfBrand[index]
                                                        .images[0]
                                                        .url,
                                              ),
                                              fit: BoxFit.fill)),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5)),
                                          color: Color(0xFFF5F5F5)),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    productsOfBrand[index].name,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Roboto Condensed',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                  ),
                                                  productsOfBrand[index]
                                                              .discountPrice ==
                                                          0
                                                      ? Text(
                                                          productsOfBrand[index]
                                                              .price
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12),
                                                        )
                                                      : Row(
                                                          children: [
                                                            Text(
                                                              (productsOfBrand[
                                                                              index]
                                                                          .price -
                                                                      productsOfBrand[
                                                                              index]
                                                                          .discountPrice)
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12),
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            Text(
                                                              productsOfBrand[
                                                                      index]
                                                                  .price
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize: 10),
                                                            ),
                                                          ],
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
                                                width: 28,
                                                height: 13,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFB600),
                                                   borderRadius:
                                              BorderRadius.circular(2),
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.all(3.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .solidStar,
                                                        color: Colors.white,
                                                        size: 8,
                                                      ),
                                                      Text(
                                                        productsOfBrand[index]
                                                            .ratingAverage
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 8,
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
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
                          width: 16,
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
