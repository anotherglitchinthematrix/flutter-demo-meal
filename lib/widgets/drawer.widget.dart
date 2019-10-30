import 'package:course_007/screens/index.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerTile({IconData icon, String title, Function handler}) {
    return ListTile(
      onTap: handler,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text('Drawer'),
          ),
          SizedBox(
            height: 16,
          ),
          buildDrawerTile(
            icon: Icons.restaurant,
            title: 'Meals',
            handler: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          buildDrawerTile(
            icon: Icons.settings,
            title: 'Filters',
            handler: () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
