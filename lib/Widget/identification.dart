import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Color/colors.dart';

const _idKey = 'identification';

String _generateId() {
  final random = Random.secure();
  return List.generate(16, (_) => random.nextInt(16).toRadixString(16)).join();
}

/// Returns the saved identification, generating and saving one on first use.
Future<String> getIdentification() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_idKey);
    if (saved != null && saved.isNotEmpty) return saved;
    final id = _generateId();
    await prefs.setString(_idKey, id);
    return id;
  } catch (e) {
    // Storage unavailable (e.g. plugin not loaded yet): still show a code.
    debugPrint('Identification storage failed: $e');
    return _generateId();
  }
}

Future<void> showIdentificationDialog(BuildContext context) async {
  final id = await getIdentification();
  if (!context.mounted) return;
  await showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : appBarColor,
      shape: const RoundedRectangleBorder(),
      title: const Text('Identification'),
      content: SelectableText(id),
      actions: [
        TextButton(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: id));
            if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Identification copied')),
              );
            }
          },
          child: const Text('COPY', style: TextStyle(color: drawerColor)),
        ),
      ],
    ),
  );
}
