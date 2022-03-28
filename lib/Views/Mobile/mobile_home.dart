import 'package:flutter/material.dart';

import '../../Color/colors.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({ Key? key }) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: backGroundColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 8
                            ),
                            child: Text(
                              'SELECT SERVER',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: drawerColor,
                              size: 40,
                            ),
                            title: Text(
                              'Random Server',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            subtitle: Text(
                              'Any Location',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SELECT PORT',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'AUTO',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          
                            trailing: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: drawerColor,
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Icon(
                                    Icons.download,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              Text(
                                '0.0KB',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: drawerColor,
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Icon(
                                    Icons.download,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              Text(
                                '0.0MB',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}