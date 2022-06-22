import 'package:flutter/material.dart';

class IconDialog extends StatefulWidget {
  IconDialog({Key? key}) : super(key: key);

  @override
  State<IconDialog> createState() => _IconDialogState();
}

class _IconDialogState extends State<IconDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          "Icon",
          textAlign: TextAlign.center,
        ),
        content: Container(
          width: 350,
          height: 300,
          child: GridView.builder(
            //shrinkWrap: true,
            itemCount: listIcons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                /*crossAxisSpacing: 4, // para horizontal*/
                mainAxisSpacing: /* para vertical*/ 20.0),
            itemBuilder: (_, index) {
              return Icon(
                listIcons[index],
                color: Colors.blue,
              );
            },
          ),
        )

        /*SingleChildScrollView(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _rowIcons1(Colors.blue),
          _rowIcons2(Colors.blue),
          _rowIcons3(Colors.blue),
          _rowIcons4(Colors.blue),
          _rowIcons5(Colors.blue),
          _rowIcons6(Colors.blue),
        ],
      )),*/
        );
  }

  List<IconData> listIcons = [
    Icons.abc,
    Icons.add_box_outlined,
    Icons.ac_unit_sharp,
    Icons.access_alarm,
    Icons.access_time_sharp,
    Icons.accessibility,

    /////

    Icons.back_hand,
    Icons.backpack,
    Icons.backspace,
    Icons.backup,
    Icons.badge,
    Icons.bar_chart,
    //////////

    Icons.dark_mode,
    Icons.dashboard,
    Icons.data_usage,
    Icons.delete,
    Icons.deselect,

    /////////
    Icons.facebook,
    Icons.gif,
    Icons.hdr_off,
    Icons.image_search,
    Icons.import_export,
    Icons.insert_photo,
    ////////////
    Icons.keyboard,
    Icons.key,
    //Icons.landslide,
    Icons.language,
    Icons.library_music,
    Icons.mail,

    ////////////

    Icons.network_locked_sharp,
    Icons.opacity,
    Icons.messenger,
    Icons.snapchat_outlined,
    Icons.currency_yen_outlined,
    Icons.info,
  ];
}
