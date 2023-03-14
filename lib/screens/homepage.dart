import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildFeaturedProduct({String? name, double? price, String? image}) {
    return Card(
      child: SizedBox(
        height: 250,
        width: 180,
        child: Column(
          children: [
            Container(
              height: 190,
              width: 160,
              decoration: BoxDecoration(),
              child: Image.asset("assets/watch.png"),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xff9b96d6)),
            ),
            Text(
              name!,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProduct({String? image, required int color}) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image.asset("assets/watch.png"),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    key:
    _key;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu, color: Colors.black)),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            _buildCategoryProduct(
                                // image: "dress.png",
                                color: 0xff33dcfd),
                            _buildCategoryProduct(
                                // image: "pant.png",
                                color: 0xfff38cdd),
                            _buildCategoryProduct(
                                // image: "shoe.png",
                                color: 0xff4ff2af),
                            _buildCategoryProduct(
                                // image: "shirt.png",
                                color: 0xff74acf7),
                            _buildCategoryProduct(
                                // image: "tie.png",
                                color: 0xfffc6c8d),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Featured",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [

                            _buildFeaturedProduct(
                                // image: "man.jpg",
                                price: 30.0,
                                name: "Men Long T-Shirt"),
                            _buildFeaturedProduct(
                                // image: "watch.png",
                                price: 30.0,
                                name: "Women White Watch")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Achives",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildFeaturedProduct(
                                // image: "man.jpg",
                                price: 30.0,
                                name: "A Man Wrist Watch"),
                            _buildFeaturedProduct(
                                // image: "watch.png",
                                price: 30.0,
                                name: "A Man Pant")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
