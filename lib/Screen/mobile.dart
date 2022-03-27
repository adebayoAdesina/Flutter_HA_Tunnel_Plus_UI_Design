import 'package:flutter/material.dart';
import 'package:ha_tunnel_plus_ui_design/Views/Mobile/mobile_home.dart';
import 'package:ha_tunnel_plus_ui_design/Views/Mobile/mobile_log.dart';
import 'package:ha_tunnel_plus_ui_design/Widget/info.dart';

import '../Color/colors.dart';

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          title: const Text(
            'HA Tunnel Plus'
          ),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.settings),
              color: iconColor.withOpacity(0.6),
            ),
    
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.more_vert),
              color: iconColor.withOpacity(0.6),
            ),
          ],
          
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: drawerColor,
            labelColor: drawerColor,
            unselectedLabelColor: iconColor.withOpacity(0.6),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w400
            ),
            tabs: const [
              Tab(
                text: 'HOME',
              ),
              Tab(
                text: 'LOG',
              )
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: backGroundColor,
          child: ListView(
            children: [
              const DrawerHeader(
                padding: EdgeInsets.only(
                  top: 80,
                  left: 10
                ),
                decoration: BoxDecoration(
                  color: drawerColor
                ),
                  child: ListTile(
                    title: Text(
                      'HA Tunnel Plus' ,
                      style: TextStyle(
                        color: iconColor,
                        fontSize: 23
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top:8.0),
                      child: Text(
                        version ,
                        style: TextStyle(
                          color: iconColor,
                          fontSize: 16
                        ),
                      ),
                    ),
                  )
              ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.code,
                    color: iconColor,
                  ),
                  title: Text(
                    'Payload Generator',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Divider(
                color: iconColor.withOpacity(0.3),
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.fingerprint,
                    color: iconColor,
                  ),
                  title: Text(
                    'Identification',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Divider(
                color: iconColor.withOpacity(0.3),
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.file_upload_rounded,
                    color: iconColor,
                  ),
                  title: Text(
                    'Export Config',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.file_download,
                    color: iconColor,
                  ),
                  title: Text(
                    'Import Config',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Divider(
                color: iconColor.withOpacity(0.3),
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: iconColor,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.apps_rounded,
                    color: iconColor,
                  ),
                  title: Text(
                    'Server Apps',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Divider(
                color: iconColor.withOpacity(0.3),
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    // Icons.text_snippet_outlined
                    Icons.telegram,
                    color: iconColor,
                  ),
                  title: Text(
                    'Telegram Channel',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.info_rounded,
                    color: iconColor,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Divider(
                color: iconColor.withOpacity(0.3),
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    // Icons.text_snippet_outlined
                    Icons.cloud_sync_rounded,
                    color: iconColor,
                  ),
                  title: Text(
                    'Renew Access',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              Divider(
                color: iconColor.withOpacity(0.3),
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.align_horizontal_center_rounded,
                    color: iconColor,
                  ),
                  title: Text(
                    '**** ****** ©',
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MobileHome(),
            MobileLog()
          ]
        )
      ),
    );
  }
}
