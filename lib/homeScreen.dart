import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'brandProfilePicture.dart';
import './models/brand.dart';
import 'brandDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Brand>> getBrands() async {
    var data = await http.get("http://prova-ltd.herokuapp.com/user_api/stores");
    var jssonData = json.decode(data.body);
    List<Product> products = [];
    List<Brand> brands = [];
   // List<Images>images = [];
    jssonData.forEach((b) {
      b['products'].forEach((p) {
        // b['products']['images'].forEach((i) {
        //   Images image = Images(
        //     id: i['id'],
        //     url: i['url'],
        //   );
        //   images.add(image);
        // });
        Product product = Product(
            id: p['id'],
            name: p['name'],
            price: p['price'],
            ratingAverage: p['rating_average'],
           // images: images,
            );
        products.add(product);
      });
      Brand brand = Brand(
        id: b['id'],
        profilePicture: b['profile_picture'],
        name: b['name'],
        products: products,
      );
      brands.add(brand);
    });
    return brands;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD3D3D3),
        leading: IconButton(
            icon: Icon(
              Icons.sort,
              size: 37.0,
              color: Colors.black,
            ),
            onPressed: null),
        title: Text(
          'Prova',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 37.0,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 8, right: 8),
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60.0,
                        width: MediaQuery.of(context).size.width * 0.72,
                        child: FutureBuilder(
                            future: getBrands(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return BrandProfilePicture(
                                        id: snapshot.data[index].id,
                                        profilePicture:
                                            snapshot.data[index].profilePicture,
                                      );
                                    });
                              } else {
                                return Center(
                                    child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFD3D3D3)),
                                ));
                              }
                            }),
                      ),
                      VerticalDivider(
                        endIndent: 5.0,
                        indent: 5.0,
                        thickness: 3,
                        width: 2.0,
                        color: Color(0xFFC0C0C0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.16,
                        child: RaisedButton(
                          elevation: 7.0,
                          color: Colors.white,
                          onPressed: () {},
                          splashColor: Color(0xFFD3D3D3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                                size: 20,
                              ),
                              Text('Brands',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 8.8)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            child: FutureBuilder(
                future: getBrands(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot snapshot,
                ) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return BrandDetails(
                            profilePicture: snapshot.data[index].profilePicture,
                            name: snapshot.data[index].name,
                          //  product: [snapshot.data[index].products],
                            nameOfProduct: snapshot.data[index].products[index].name,
                            price:snapshot.data[index].products[index].price,
                            ratingAverage:snapshot.data[index].products[index].ratingAverage,
                          //  // image:snapshot.data[index].products[index].images[index].url ,
                          );
                        });
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFD3D3D3)),
                    ));
                  }
                }),
          )
        ])),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        fixedColor: Color(0xFF696969),
        backgroundColor: Color(0xFFD3D3D3),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.rss),
            title: Text('FEEDS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('ADD POST'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidComments),
            title: Text('CHATS'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Text('PEAPLE'),
          ),
        ],
      ),
    );
  }
}
