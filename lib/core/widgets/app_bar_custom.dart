import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{

  final double height = 60;
  final String title;
  final bool leading;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final double elevation;

  const AppBarCustom({
    Key? key,
    required this.title,
    this.leading = true,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: bottomOpacity,
      elevation: elevation,
      automaticallyImplyLeading: leading,
      backgroundColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: EdgeInsets.only(left: (leading ? 0 : 10)),
        child: Text(
          title,
          style: TextStyle(
            fontSize: (
              title.length > 14 ? 
                14.0 : 
                18.0
            )
          ),
        ),
      ),
      leading: (
        leading ? 
          IconButton(icon:const Icon(Icons.arrow_back),
        onPressed:(
          () => Navigator.pop(context)
        ),
      ) : null),
      bottom: bottom,
      actions: <Widget>[
         !leading ? IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            }) : Container()
      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    bottom == null ? height : (height + 30)
  );
  
}