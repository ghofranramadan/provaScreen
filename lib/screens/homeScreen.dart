import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/brandDetails.dart';
import '../models/brand.dart';
import '../widgets/brandProfilePicture.dart';
import '../getData.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Brand> _brands;
  @override
  void initState() {
    super.initState();
    GetData.getBrands().then((brands) {
      setState(() {
        _brands = brands;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF707070),
        leading: Container(
          height: 24,
          width: 24,
          child: IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.black,
              ),
              onPressed: null),
        ),
        title: Text(
          'Prova',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
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
                    top: 28, bottom: 16, right: 16, left: 16),
                child: Container(
                  height: 44.0,
                  width: double.infinity,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //  height: 44.0,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>SizedBox(width: 10.5,),
                              itemCount: null == _brands ? 0 : 5,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                Brand brandPicture = _brands[index];
                                return BrandProfilePicture(
                                  id: brandPicture.id,
                                  profilePicture: brandPicture.profilePicture,
                                );
                              })),
                      Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: Container(
                          height: 32,
                          width: 0,
                          child: VerticalDivider(
                            thickness: 2,
                          ),
                        ),
                      ),
                      Container(
                        width: 44,
                        // MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.black,
                                  size: 19,
                                ),
                              ),
                              Text('Brands',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2,left: 16,right: 16),
                child: Container(
                  height: 112,
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
              padding: EdgeInsets.only(left: 16),
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: null == _brands ? 0 : _brands.length,
                  itemBuilder: (context, index) {
                    Brand brandDetails = _brands[index];
                    return BrandDetails(
                      name: brandDetails.name,
                      profilePicture: brandDetails.profilePicture,
                      productsOfBrand: brandDetails.products,
                    );
                  }))
        ])),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        fixedColor: Color(0xFF696969),
        backgroundColor: Color(0xFFD3D3D3),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 16,
            ),
            title: Text(
              'HOME',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 8,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.rss,
              size: 16,
            ),
            title: Text(
              'FEEDS',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 8,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              size: 16,
            ),
            title: Text(
              'ADD POST',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 8,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidComments,
              size: 16,
            ),
            title: Text(
              'CHATS',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 8,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userAlt,
              size: 16,
            ),
            title: Text(
              'PEAPLE',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
