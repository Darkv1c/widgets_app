import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static String name = 'Progress Screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: _ProgressIndicatorsView(),
    );
  }
}

class _IndicatorData {
  final String name;
  final Widget indicator;

  const _IndicatorData(this.name, this.indicator);
}

class _ProgressIndicatorsView extends StatelessWidget {
  final List<_IndicatorData> indicators = const [
    _IndicatorData('Circular', CircularProgressIndicator(strokeWidth: 2)),
    _IndicatorData(
      'Linear',
      SizedBox(width: 100, child: LinearProgressIndicator()),
    ),
  ];

  wrapIndicator(String name, Widget child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 20,
      children: [Text(name), child, SizedBox()],
    );
  }

  wrapIndicatorGroup(String name, List<Widget> children) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(name),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 20,
            children: children,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 40,
        children: [
          wrapIndicatorGroup('Uncontrolled', [
            for (final indicator in indicators)
              wrapIndicator(indicator.name, indicator.indicator),
          ]),
          wrapIndicatorGroup('Controlled', [
            for (final indicator in indicators)
              wrapIndicator(indicator.name, indicator.indicator),
          ]),
        ],
      ),
    );
  }
}

class _ControlledIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
