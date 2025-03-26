import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  final name = 'Snackbar Screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a snackbar'),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      ),
    );
  }

  void openDialog(BuildContext context) {
    void close() => context.pop();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('This action cannot be undone '),
            actions: [
              TextButton(onPressed: close, child: Text('No')),
              FilledButton(onPressed: close, child: Text('Yes')),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: const [Text('This is an about dialog')],
                );
              },
              child: Text('Licenses'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: Text('Dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Show Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
