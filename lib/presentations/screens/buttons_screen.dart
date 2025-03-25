import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons Screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox.expand(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            /** Elevated */
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Elevated with Icon'),
              icon: const Icon(Icons.add),
            ),
            /** Filled */
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            const FilledButton(
              onPressed: null,
              child: Text('Elevated disabled'),
            ),
            FilledButton.icon(
              onPressed: () {},
              label: const Text('Elevated with Icon'),
              icon: const Icon(Icons.add),
            ),
            /** Outlined */
            OutlinedButton(onPressed: () {}, child: const Text('Filled')),
            const OutlinedButton(
              onPressed: null,
              child: Text('Elevated disabled'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Elevated with Icon'),
              icon: const Icon(Icons.add),
            ),
            /** TextButton */
            TextButton(onPressed: () {}, child: const Text('Filled')),
            const TextButton(onPressed: null, child: Text('Elevated disabled')),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Elevated with Icon'),
              icon: const Icon(Icons.add),
            ),
            /** IconButton */
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            const IconButton(onPressed: null, icon: Icon(Icons.add)),
            IconButton.filled(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),

            /** Custom Button */
            _CustomButton(),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
