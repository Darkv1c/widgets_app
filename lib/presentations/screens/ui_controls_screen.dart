import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  final name = 'UI Controls Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum _Transportation {
  car('car'),
  bike('bike'),
  bus('bus'),
  train('train');

  final String name;

  const _Transportation(this.name);
}

class _Food {
  final String name;
  bool state;

  _Food(this.name, this.state);

  static getValues() => [
    _Food('pizza', false),
    _Food('pasta', false),
    _Food('hamburger', false),
    _Food('salad', false),
  ];
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool _isDeveloperMode = false;
  _Transportation _transportation = _Transportation.car;
  final List<_Food> _foods = _Food.getValues();

  void changeSwitchValue(bool value) {
    setState(() {
      _isDeveloperMode = value;
    });
  }

  void changeRadioTile(_Transportation value) {
    setState(() {
      _transportation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          onChanged: changeSwitchValue,
          value: _isDeveloperMode,
        ),
        ExpansionTile(
          title: Text('Transportation'),
          subtitle: Text('Your current choice is ${_transportation.name}'),
          children: [
            for (final transportation in _Transportation.values)
              RadioListTile(
                title: Text('By ${transportation.name}'),
                subtitle: Text('Enjoy your travel by ${transportation.name}'),
                value: transportation,
                onChanged: (value) => changeRadioTile(value as _Transportation),
                groupValue: _transportation,
              ),
          ],
        ),

        for (final food in _foods)
          CheckboxListTile(
            value: food.state,
            onChanged: (value) {
              setState(() {
                food.state = value ?? false;
              });
            },
            title: Text(food.name),
            subtitle: Text('Enjoy your meal with ${food.name}'),
          ),
      ],
    );
  }
}
