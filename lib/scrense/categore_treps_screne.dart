import 'package:flutter/material.dart';

import '../widget/trip_item.dart';
import '../app_data.dart';

class CategoryTrepsScrene extends StatelessWidget {
  static const screenRote = '/category-trips';
  @override
  // ignore: override_on_non_overriding_member
  // final String categoryid;
  // final String categorytitle;
  // CategoryTrepsScrene(this.categoryid, this.categorytitle);

  Widget build(BuildContext context) {
    final routerAguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryid = routerAguments["id"];
    final categorytitle = routerAguments["title"];
    final felterdTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(categorytitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: felterdTrips[index].id,
            title: felterdTrips[index].title,
            imageUrl: felterdTrips[index].imageUrl,
            duration: felterdTrips[index].duration,
            tripType: felterdTrips[index].tripType,
            season: felterdTrips[index].season,
          );
        },
        itemCount: felterdTrips.length,
      ),
    );
  }
}
