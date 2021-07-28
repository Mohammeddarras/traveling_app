import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trips.dart';
import 'package:traveling_app/widgets/trip_items.dart';

class categoryTripsScreen extends StatefulWidget {

  static const String id = "categoryTripsScreen";

  final List<Trip> availableTrips;

  categoryTripsScreen(this.availableTrips);

  @override
  _categoryTripsScreenState createState() => _categoryTripsScreenState();
}

class _categoryTripsScreenState extends State<categoryTripsScreen> {

  String categoryTitle;
  List<Trip> displayTrips;

  @override
  void didChangeDependencies() {
    final routeArgument =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryTitle
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context,index){
            return tripItems(
                id: displayTrips[index].id,
                title: displayTrips[index].title,
                imageUrl: displayTrips[index].imageUrl,
                duration: displayTrips[index].duration,
                season: displayTrips[index].season,
                tripType: displayTrips[index].tripType
            );
          },
        itemCount: displayTrips.length,
      ),
    );
  }
}
