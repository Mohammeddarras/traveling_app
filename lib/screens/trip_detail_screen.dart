import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

class tripDetailScreen extends StatelessWidget {
  static const String id = 'tripDetailScreen';

  final Function manageFavorite;
  final Function isFavorite;

  tripDetailScreen(this.manageFavorite, this.isFavorite);


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == args);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${selectedTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
               ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context , index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1 }'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(args) ? Icons.star : Icons.star_border),
        onPressed: () => manageFavorite(args),
      ),
    );
  }
}


Widget buildSectionTitle (BuildContext context, String titleText){
return Container(
  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  alignment: Alignment.bottomRight,
  child: Text(
    titleText,
    style: Theme.of(context).textTheme.headline5,
  ),
);
}

Widget buildListViewContainer (child){
  return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
  color: Colors.white,
  border: Border.all(color: Colors.grey)
  ),
  height: 200,
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.symmetric(horizontal: 15),
    child: child,
  );
}