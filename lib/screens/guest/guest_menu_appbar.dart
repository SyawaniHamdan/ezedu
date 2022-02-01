import 'package:ezedu/screens/guest/guest_menu_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GuestMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const rightColor = Color(0xFF7f53ac);
  static const leftColor = Color(0xFF647dee); //INDICATOR COLOR

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GuestMenuViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => GuestMenuViewModel(),
      // onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => AppBar(
                      toolbarHeight: 80,
                      title: Row(children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text('Welcome, Guest'),
                        ),
                      ]),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                      flexibleSpace: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [rightColor, leftColor])),
                      ),
                    ),
                    
                  );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
