
import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurantList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
      },
    );
  }
}

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('json/local_restaurant.json'),
        builder: (context, snapshot){
          final List<Restaurant> restaurant = parseRestaurants(snapshot.data) ;
          return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index){
                return _buildRestaurantItem(context, restaurant[index]);
              },
              );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant){
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0
      ),
      leading: Image.network(
       restaurant.pictureId,
        width: 100,
        errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
      ),
      title: Text(restaurant.name,
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined,
              size: 16,),
              SizedBox(width: 8),
              Text(restaurant.city),
            ],
          ),
          Row(children: [
            Icon(Icons.star_border_outlined,
            size: 16,
            ),
            SizedBox(width: 8),
            Text(restaurant.rating.toString())
          ],
          )
        ],
      ),
    );
  }


}


