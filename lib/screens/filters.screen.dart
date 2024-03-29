import 'package:course_007/widgets/index.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final Function setFilters;

  FiltersScreen(this.setFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];

    super.initState();
  }

  Widget buildSwitch({
    String title,
    String subtitle,
    bool value,
    Function handler,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: (change) => handler(change),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.setFilters(widget.filters),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitch(
                  title: 'Gluten Free',
                  subtitle: 'Include gluten free meals',
                  value: _glutenFree,
                  handler: (change) {
                    setState(() {
                      _glutenFree = change;
                      widget.filters['gluten'] = change;
                    });
                  },
                ),
                buildSwitch(
                  title: 'Lactose Free',
                  subtitle: 'Include lactose free meals',
                  value: _lactoseFree,
                  handler: (change) {
                    setState(() {
                      _lactoseFree = change;
                      widget.filters['lactose'] = change;
                    });
                  },
                ),
                buildSwitch(
                  title: 'Vegetarian',
                  subtitle: 'Vegetarian meals',
                  value: _vegetarian,
                  handler: (change) {
                    setState(() {
                      _vegetarian = change;
                      widget.filters['vegetarian'] = change;
                    });
                  },
                ),
                buildSwitch(
                  title: 'Vegan',
                  subtitle: 'Vegan meals',
                  value: _vegan,
                  handler: (change) {
                    setState(() {
                      _vegan = change;
                      widget.filters['vegan'] = change;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
