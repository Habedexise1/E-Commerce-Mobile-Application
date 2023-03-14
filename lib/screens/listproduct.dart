import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});

  Widget _buildFeaturedProduct({
    String? name,
    double? price,
  }) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
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
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 700,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                    children: [
                      _buildFeaturedProduct(
                          // image: "man.jpg",
                          price: 30.0,
                          name: "Men Long T-Shirt"),
                      _buildFeaturedProduct(
                          // image: "watch.png",
                          price: 30.0,
                          name: "Women White Watch"),
                      _buildFeaturedProduct(
                          // image: "man.jpg",
                          price: 30.0,
                          name: "Men Long T-Shirt"),
                      _buildFeaturedProduct(
                          // image: "watch.png",
                          price: 30.0,
                          name: "Women White Watch"),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
