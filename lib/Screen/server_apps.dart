import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Color/colors.dart';
import '../Widget/info.dart';

class _AppEntry {
  final String name;
  final String package;
  const _AppEntry(this.name, this.package);
}

class _AppCategory {
  final String title;
  final IconData icon;
  final Color color;
  final List<_AppEntry> apps;
  const _AppCategory(this.title, this.icon, this.color, this.apps);
}

const _categories = [
  _AppCategory('GAMES', Icons.sports_esports, Color(0xFF455A64), [
    _AppEntry('8 Ball Pool', 'com.miniclip.eightballpool'),
    _AppEntry('Asphalt 9: Legends', 'com.gameloft.android.ANMP.GloftA9HM'),
    _AppEntry('Call Of Duty Mobile', 'com.activision.callofduty.shooter'),
    _AppEntry('Chess Rush', 'com.tencent.godgame'),
    _AppEntry('Clash Of Clans', 'com.supercell.clashofclans'),
    _AppEntry('Crisis Action', 'com.herogames.gplay.crisisactionsa'),
    _AppEntry('eFootball PES 2020', 'jp.konami.pesam'),
    _AppEntry('Free Fire', 'com.dts.freefireth'),
    _AppEntry('Mobile Legends', 'com.mobile.legends'),
    _AppEntry('Mobile Legends: Bang Bang', 'com.tencent.ig'),
    _AppEntry('Modern Strike Online', 'com.gamedevltd.modernstrike'),
    _AppEntry('ONE PUNCH MAN', 'com.onepunchman.ggplay.sea'),
    _AppEntry('PUBG Mobile', 'com.tencent.ig'),
  ]),
  _AppCategory('NETFLIX', Icons.play_circle_fill, Color(0xFFD50000), [
    _AppEntry('Netflix', 'com.netflix.mediaclient'),
    _AppEntry('Netflix (Android TV)', 'com.netflix.ninja'),
    _AppEntry('Netflix VR', 'com.netflix.android_vr'),
    _AppEntry('VIX - CINE. TV. GRATIS.', 'com.batanga.vix'),
    _AppEntry('Youtube', 'com.google.android.youtube'),
    _AppEntry('Youtube Kids', 'com.google.android.apps.youtube.kids'),
    _AppEntry('Youtube Kids (Android TV)', 'com.google.android.youtube.tvkids'),
    _AppEntry('Youtube Music', 'com.google.android.apps.youtube.music'),
  ]),
  _AppCategory('VOIP', Icons.phone, Color(0xFF4CAF50), [
    _AppEntry('BOTIM', 'im.thebot.messenger'),
    _AppEntry('Imo Beta', 'com.imo.android.imoimbeta'),
    _AppEntry('Imo HD', 'com.imo.android.imoimhd'),
    _AppEntry('Imo Lite', 'com.imo.android.imoimlite'),
    _AppEntry('Imo Messenger', 'com.imo.android.imoim'),
    _AppEntry('Messenger', 'com.facebook.orca'),
    _AppEntry('Messenger Lite', 'com.facebook.mlite'),
    _AppEntry('Skype', 'com.skype.raider'),
    _AppEntry('Skype Lite', 'com.skype.m2'),
    _AppEntry('Viber', 'com.viber.voip'),
    _AppEntry('Whatsapp', 'com.whatsapp'),
    _AppEntry('Whatsapp Business', 'com.whatsapp.w4b'),
  ]),
  _AppCategory('TORRENT', Icons.downloading, Color(0xFF43A047), [
    _AppEntry('Bit Torrent', 'com.bittorrent.client'),
    _AppEntry('Google Chrome', 'com.android.chrome'),
    _AppEntry('uTorrent', 'com.utorrent.client'),
    _AppEntry('uTorrent Pro', 'com.utorrent.client.pro'),
  ]),
];

class ServerAppsPage extends StatelessWidget {
  const ServerAppsPage({Key? key}) : super(key: key);

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Server Apps'),
        content: const Text(
          'These are the apps this design groups by server type. Pick an '
          'app from a list to use it with the matching server.\n\n'
          'Missing an app? Use the menu to request it.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: drawerColor)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final light = Theme.of(context).brightness == Brightness.light;
    final nameColor = light ? Colors.black87 : Colors.white;
    final packageColor = light ? Colors.black87 : Colors.white70;

    return DefaultTabController(
      length: _categories.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: drawerColor,
          foregroundColor: Colors.white,
          title: const Text('Server Apps'),
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () => _showInfo(context),
            ),
            PopupMenuButton<int>(
              onSelected: (_) => launchUrl(
                Uri.parse('$githubUrl/Flutter_HA_Tunnel_Plus_UI_Design/issues'),
                mode: LaunchMode.externalApplication,
              ),
              itemBuilder: (context) => const [
                PopupMenuItem(value: 1, child: Text('Request App')),
              ],
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kTextTabBarHeight),
            child: ColoredBox(
              color: light ? Colors.white : appBarColor,
              child: TabBar(
                indicatorColor: drawerColor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: drawerColor,
                unselectedLabelColor:
                    light ? Colors.black54 : Colors.white60,
                tabs: [for (final c in _categories) Tab(text: c.title)],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            for (final category in _categories)
              ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: category.apps.length,
                itemBuilder: (context, i) {
                  final app = category.apps[i];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    leading: Icon(category.icon, color: category.color, size: 48),
                    title: Text(app.name, style: TextStyle(color: nameColor)),
                    subtitle: Text(
                      app.package,
                      style: TextStyle(color: packageColor, fontSize: 12),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
