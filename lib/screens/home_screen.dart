import 'package:flutter/material.dart';

import '../practice/product_filter.dart';
import 'team_board_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FED Team', style: theme.textTheme.displaySmall),
              const SizedBox(height: 8),
              Text(
                'Frontend Engineering Delivery',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'A profile board for the people shipping the product.',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const TeamBoardScreen(),
                      ),
                    );
                  },
                  child: const Text('Meet the team'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => _showActiveProducts(context),
                  child: const Text('Active products'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showActiveProducts(BuildContext context) {
    final names = inStockProductNames(sampleProducts);
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Active products'),
          content: Text(names.join('\n')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
