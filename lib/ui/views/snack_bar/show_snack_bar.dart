import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String massage, {
  bool error = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 48, right: 16, left: 16),
        child: Card(
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              children: [
                error
                    ? Icon(
                        Icons.error,
                        color: Theme.of(context).colorScheme.error,
                      )
                    : Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    massage,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: error
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
