import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mirai_app/components/confirm_dialog.dart';

Widget manageDialog({required BuildContext context}) {
  return Stack(
    alignment: AlignmentDirectional.topEnd,
    children: [
      SizedBox(
          height: 144,
          width: 215,
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: Get.isDarkMode
                ? Theme.of(context).primaryColor
                : Theme.of(context).dialogTheme.backgroundColor,
            child: Column(children: [
              Column(
                children: [
                  ListTile(
                    leading: const Icon(HeroIcons.pencil_square, size: 18),
                    title: Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    visualDensity: VisualDensity.compact,
                  ),
                  ListTile(
                    leading: const Icon(HeroIcons.trash, size: 18),
                    title: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    visualDensity: VisualDensity.compact,
                    onTap: () {
                      Get.back();
                      confirmDialog();
                    },
                  )
                ],
              )
            ]),
          ))
    ],
  );
}
