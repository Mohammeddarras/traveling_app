import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveling_app/models/trips.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

class tripItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;

  const tripItems(
      {
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.season,
      @required this.tripType});


  String get seasonText{
    switch (season) {
      case Season.Summer:
      return 'صيف';
      break;
      case Season.Winter:
      return 'شتاء';
      break;
      case Season.Spring:
      return 'ربيع';
      break;
      case Season.Autumn:
      return 'خريف';
      break;
      default:
      return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'أنشطة';
        break;
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }


  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(tripDetailScreen.id,
        arguments: id,
    ).then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
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
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6 , 1],
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
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
                      Icon(Icons.today,color: Theme.of(context).accentColor,),
                      SizedBox(width: 7,),
                      Text('$duration الأيام '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny,color: Theme.of(context).accentColor,),
                      SizedBox(width: 7,),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom,color: Theme.of(context).accentColor,),
                      SizedBox(width: 7,),
                      Text(tripTypeText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
