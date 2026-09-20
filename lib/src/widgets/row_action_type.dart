import 'package:swi_core/swi_core.dart';
import 'package:flutter/material.dart';

enum RowActionType {
  delete('delete', '', AppIcons.trashTow, AppColors.red),
  details('details', 'تفاصيل', AppIcons.eye, AppColors.orange),
  share('share', 'مشاركة', AppIcons.share, AppColors.primary),
  edit('edit', 'تعديل', AppIcons.edit, AppColors.green);

  final String title;
  final String titleAr;
  final IconData icon;
  final Color color;
  const RowActionType(this.title, this.titleAr, this.icon, this.color);
}
