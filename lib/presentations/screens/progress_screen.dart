import 'package:flutter/material.dart';

class _IndicatorData {
  final String name;
  final Widget indicator;

  const _IndicatorData(this.name, this.indicator);
}

List<_IndicatorData> _getIndicators({double? value}) => [
  _IndicatorData(
    'Circular',
    CircularProgressIndicator(strokeWidth: 2, value: value),
  ),
  _IndicatorData(
    'Linear',
    SizedBox(width: 100, child: LinearProgressIndicator(value: value)),
  ),
];

_wrapIndicator(String name, Widget child) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    spacing: 20,
    children: [Text(name), child, SizedBox()],
  );
}

_wrapIndicatorGroup(String name, List<Widget> children) {
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

class _ProgressIndicatorsView extends StatelessWidget {
  final _indicators = _getIndicators();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 40,
        children: [
          _wrapIndicatorGroup('Uncontrolled', [
            for (final indicator in _indicators)
              _wrapIndicator(indicator.name, indicator.indicator),
          ]),
          _ControlledIndicators(),
        ],
      ),
    );
  }
}

class _ControlledIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 100),
        (count) => count / 100,
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final indicators = _getIndicators(value: snapshot.data ?? 0);

        return _wrapIndicatorGroup('Controlled', [
          for (final indicator in indicators)
            _wrapIndicator(indicator.name, indicator.indicator),
        ]);
      },
    );
  }
}
