import 'package:flutter/material.dart';
import '../scrense/trip_detal_screen.dart';
import '../modle/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
  });

  String get seasonText {
    if (season == Season.Winter) {
      return "الشتاء";
    }
    if (season == Season.Spring) {
      return "الربيع";
    }
    if (season == Season.Summer) {
      return "الصيف";
    }
    if (season == Season.Autumn) {
      return "الخريف";
    } else
      return "غير معروف ";
  }

  String get tripTypeText {
    if (tripType == TripType.Exploration) {
      return "استكشاف";
    }
    if (tripType == TripType.Recovery) {
      return "نقاهة";
    }
    if (tripType == TripType.Activities) {
      return "أنشطة";
    }
    if (tripType == TripType.Therapy) {
      return "معالجة";
    } else
      return "غير معروف ";
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
      tripDetalScreen.screenRoute,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Color.fromARGB(255, 255, 187, 0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration يوم "),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Color.fromARGB(255, 255, 187, 0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Color.fromARGB(255, 255, 187, 0),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
