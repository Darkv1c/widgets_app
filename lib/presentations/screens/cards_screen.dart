import 'package:flutter/material.dart';

class CardData {
  final double elevation;
  final String label;

  const CardData(this.elevation, this.label);
}

const List<CardData> cards = [
  CardData(0.0, 'Elevation 0.0'),
  CardData(1.0, 'Elevation 1.0'),
  CardData(2.0, 'Elevation 2.0'),
  CardData(3.0, 'Elevation 3.0'),
  CardData(4.0, 'Elevation 4.0'),
  CardData(5.0, 'Elevation 5.0'),
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards Screen')),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (final card in cards)
              _SimpleCard(elevation: card.elevation, label: card.label),
            for (final card in cards)
              _OutlinedCard(elevation: card.elevation, label: card.label),
            for (final card in cards)
              _SurfaceCard(elevation: card.elevation, label: card.label),
            for (final card in cards)
              _ImageBackgroundCard(
                elevation: card.elevation,
                label: card.label,
              ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _SimpleCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _SimpleCard({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _OutlinedCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _OutlinedCard({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label-Outline'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SurfaceCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _SurfaceCard({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surface,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(alignment: Alignment.bottomLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _ImageBackgroundCard extends StatelessWidget {
  final double elevation;
  final String label;

  const _ImageBackgroundCard({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surface,
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://picsum.photos/id/${elevation.toInt()}/600/400',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(200),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
