import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{

  final double height = 60;
  final String title;
  final bool leading;
  final PreferredSizeWidget? bottom;

  const AppBarCustom({
    Key? key,
    required this.title,
    this.leading = true,
    this.bottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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