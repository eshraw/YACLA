import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
  });

  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}