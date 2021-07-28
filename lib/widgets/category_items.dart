import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';

class categoryItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  categoryItems(this.id,this.title, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      categoryTripsScreen.id,
      arguments: {
        'id':id,
        'title': title,
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () => selectCategory(context),
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme
            .of(context)
            .primaryColor,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
