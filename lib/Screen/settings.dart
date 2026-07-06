import 'package:flutter/material.dart';

import '../Color/colors.dart';
import '../Theme/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _sound = true;
  bool _vibrate = true;
  bool _connectionRetry = true;
  bool _forwardDns = false;
  bool _customDns = false;
  bool _httpProxy = false;
  bool _overrideHost = false;

  String _primaryDns = '8.8.4.4';
  String _secondaryDns = '8.8.8.8';
  String _proxy = 'Configure Proxy Host and Port';
  String _primaryHost = 'Primary host to used for the connection';
  String _nameserver = 'Nameserver to be used for DNS Tunnel';
  String _baseTunnel = 'SSH 2.0';
  String _tlsVersion = 'ANY';

  Future<void> _chooseTheme() async {
    final selected = await showDialog<ThemeMode>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Choose Theme'),
        children: [
          for (final mode in ThemeMode.values)
            ListTile(
              title: Text(themeModeLabel(mode)),
              trailing: mode == themeModeNotifier.value
                  ? const Icon(Icons.check, color: drawerColor)
                  : null,
              onTap: () => Navigator.of(context).pop(mode),
            ),
        ],
      ),
    );
    if (selected != null) {
      await setThemeMode(selected);
    }
  }

  Future<String?> _editText(String title, String current) {
    final controller = TextEditingController(text: current);
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          autofocus: true,
          cursorColor: drawerColor,
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: drawerColor),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL', style: TextStyle(color: drawerColor)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(controller.text.trim()),
            child: const Text('OK', style: TextStyle(color: drawerColor)),
          ),
        ],
      ),
    );
  }

  Future<String?> _pickOne(String title, List<String> options, String current) {
    return showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(title),
        children: [
          for (final option in options)
            ListTile(
              title: Text(option),
              trailing: option == current
                  ? const Icon(Icons.check, color: drawerColor)
                  : null,
              onTap: () => Navigator.of(context).pop(option),
            ),
        ],
      ),
    );
  }

  Future<void> _edit(
      String title, String current, ValueChanged<String> onSaved) async {
    final value = await _editText(title, current);
    if (value != null && value.isNotEmpty) {
      setState(() => onSaved(value));
    }
  }

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
        child: Text(
          title,
          style: const TextStyle(
            color: drawerColor,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget _switchTile(
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
  ) =>
      SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (v) => setState(() => onChanged(v)),
      );

  Widget _tile(
    String title,
    String subtitle, {
    VoidCallback? onTap,
    bool enabled = true,
  }) =>
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        enabled: enabled,
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerColor,
        foregroundColor: Colors.white,
        title: const Text('Settings'),
      ),
      body: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeModeNotifier,
        builder: (context, mode, _) => ListView(
          children: [
            _section('Notification'),
            _switchTile(
              'Sound',
              'Notify with a sound while connecting or disconnecting.',
              _sound,
              (v) => _sound = v,
            ),
            _switchTile(
              'Vibrate',
              'Notify with a vibration while connecting or disconnecting.',
              _vibrate,
              (v) => _vibrate = v,
            ),
            const Divider(),
            _section('Appearance'),
            _tile('Choose Theme', themeModeLabel(mode), onTap: _chooseTheme),
            const Divider(),
            _section('Connection'),
            _switchTile(
              'Connection Retry',
              'Try to reconnect after connection is lost. By default, service '
                  'is stopped after 10 consecutive unsuccessful attempts.',
              _connectionRetry,
              (v) => _connectionRetry = v,
            ),
            _switchTile(
              'Forward DNS',
              'Forward DNS queries to remote server if enabled.',
              _forwardDns,
              (v) => _forwardDns = v,
            ),
            _switchTile(
              'Custom DNS',
              'Use custom DNS servers to resolve DNS queries.',
              _customDns,
              (v) => _customDns = v,
            ),
            _tile(
              'Primary DNS',
              _primaryDns,
              enabled: _customDns,
              onTap: () =>
                  _edit('Primary DNS', _primaryDns, (v) => _primaryDns = v),
            ),
            _tile(
              'Secondary DNS',
              _secondaryDns,
              enabled: _customDns,
              onTap: () => _edit(
                  'Secondary DNS', _secondaryDns, (v) => _secondaryDns = v),
            ),
            _switchTile(
              'Connect through an HTTP Proxy',
              'Enable to send request through a proxy',
              _httpProxy,
              (v) => _httpProxy = v,
            ),
            _tile(
              'Configure HTTP Proxy',
              _proxy,
              enabled: _httpProxy,
              onTap: () => _edit('Configure HTTP Proxy', '', (v) => _proxy = v),
            ),
            _switchTile(
              'Override Primary Host',
              'Override primary host to be used for connection.\n'
                  "DO NOT enable this if you don't know what you are doing.",
              _overrideHost,
              (v) => _overrideHost = v,
            ),
            _tile(
              'Primary Host',
              _primaryHost,
              enabled: _overrideHost,
              onTap: () =>
                  _edit('Primary Host', '', (v) => _primaryHost = v),
            ),
            _tile(
              'Primary Nameserver',
              _nameserver,
              onTap: () =>
                  _edit('Primary Nameserver', '', (v) => _nameserver = v),
            ),
            const Divider(),
            _section('Tunnel Options'),
            _tile(
              'Base Tunnel',
              _baseTunnel,
              onTap: () async {
                final v = await _pickOne(
                  'Base Tunnel',
                  const ['SSH 2.0', 'SSL/TLS', 'HTTP'],
                  _baseTunnel,
                );
                if (v != null) setState(() => _baseTunnel = v);
              },
            ),
            _tile(
              'TLS Version',
              _tlsVersion,
              onTap: () async {
                final v = await _pickOne(
                  'TLS Version',
                  const ['ANY', 'TLSv1.2', 'TLSv1.3'],
                  _tlsVersion,
                );
                if (v != null) setState(() => _tlsVersion = v);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
