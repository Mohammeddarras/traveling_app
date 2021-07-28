import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class filterScreen extends StatefulWidget {
  static const String id = 'filterScreen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  filterScreen(this.currentFilters, this.saveFilters);


  @override
  _filterScreenState createState() => _filterScreenState();
}

class _filterScreenState extends State<filterScreen> {

  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  initState() {
    _summer = widget.currentFilters['summer'];
    _winter = widget.currentFilters['winter'];
    _family = widget.currentFilters['family'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, var currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الفلترة'),centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: appDrawer(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20,),
                  SwitchListTile(
                      title: Text('الرحلات الصيفية'),
                      subtitle: Text('اظهار الرحلات في فصل الصيف فقط'),
                      value: _summer,
                      onChanged: (newValue){
                        setState(() {
                          _summer = newValue;
                        });
                      }),
                  SizedBox(height: 10,),
                  SwitchListTile(
                      title: Text('الرحلات الشتوية'),
                      subtitle: Text('اظهار الرحلات في فصل الشتاء فقط'),
                      value: _winter,
                      onChanged: (newValue){
                        setState(() {
                          _winter = newValue;
                        });
                      }),
                  SizedBox(height: 10,),
                  SwitchListTile(
                      title: Text('الرحلات العائلية'),
                      subtitle: Text('اظهار الرحلات مع العائلة فقط'),
                      value: _family,
                      onChanged: (newValue){
                        setState(() {
                          _family = newValue;
                        });
                      }),
                ],
              )
          ),
        ],
      ),

    );
  }
}
