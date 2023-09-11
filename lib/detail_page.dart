import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurantList.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(restaurant.pictureId),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16),
              child: Text(
                restaurant.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.location_on_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        restaurant.city,
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              margin: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star_border_outlined),
                      const SizedBox(height: 8.0),
                      Text(
                        restaurant.rating.toString(),
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Description',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    restaurant.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.grey),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Menus:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.restaurant),
                          Text('Foods:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(restaurant.menus.foods.map((foods) => foods.name).toString(),
                      ),
                     /* Container(
                        height: 10,
                        child: FutureBuilder(
                          future: DefaultAssetBundle.of(context).loadString('json/local_restaurant.json'),
                          builder: (context, snapshot){
                            final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
                            return ListView.builder(
                                itemCount: restaurant.menus.foods.length,
                                itemBuilder: (_, index){
                                  return _buildFoodItem(
                                    context, restaurant.menus.foods[index].name);
                                });
                          },
                        ),
                      ),*/
                      SizedBox(height:15),
                      Row(
                        children: [
                          Icon(Icons.local_drink_outlined),
                          Text('Drinks:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(restaurant.menus.drinks.map((drinks) => drinks.name).toString(),
                      ),
                     /* Container(
                        height: 10,
                        child: FutureBuilder(
                          future: DefaultAssetBundle.of(context).loadString('json/local_restaurant.json'),
                          builder: (context, snapshot){
                            final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
                            return ListView.builder(
                                itemCount: restaurant.menus.drinks.length,
                                itemBuilder: (context, index){
                                  return _buildFoodItem(
                                      context, restaurants[index]);
                                });
                          },
                        ),
                      ),*/
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
 /* Widget _buildFoodItem(BuildContext context, Restaurant restaurant){

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 3,
        shadowColor: Colors.grey,
        child: ListTile(
          title: Text(restaurant.menus.foods[index].name),
        ),
      ),
    );
  }*/

}




