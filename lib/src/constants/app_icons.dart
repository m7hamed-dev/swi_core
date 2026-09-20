import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

/// Every icon the app draws, named for what it means rather than what it
/// looks like.
///
/// Backed by `iconsax_flutter`, the maintained port. The original `iconsax`
/// package defines `call_minus4` at codepoint 0x0, which aborts Flutter's
/// icon font subsetter and forces `--no-tree-shake-icons` on every release
/// build. Same artwork, same names.
///
/// Backed by Iconsax. The call sites say `AppIcons.warehouse`, so swapping the
/// icon set again is a change to this file alone. Iconsax's own names are an
/// implementation detail and are deliberately not used directly anywhere else.
///
/// Names carrying a digit (`arrow_up_3`, `setting_2`) are separate icons in
/// Iconsax rather than weight variants of the base name, so they are picked on
/// how the glyph actually reads, not on the suffix.
///
/// Not here: the logo, the language flags and the empty-state illustrations.
/// Iconsax has no equivalent for any of them, so they stay as SVG assets in
/// [AppAssets] and are still drawn with `SvgIcon`.
class AppIcons {
  const AppIcons._();

  //! Navigation and arrows
  static const IconData arrowDown = Iconsax.arrow_down;
  static const IconData arrowUp = Iconsax.arrow_up_3;
  static const IconData arrowLeft = Iconsax.arrow_left;
  static const IconData arrowRight = Iconsax.arrow_right_1;
  static const IconData collapseLeft = Iconsax.arrow_square_left;
  static const IconData collapseRight = Iconsax.arrow_square_right;
  static const IconData menu = Iconsax.menu_1;
  static const IconData homePage = Iconsax.home;
  static const IconData navigation = Iconsax.gps;
  static const IconData routing = Iconsax.routing;

  //! Entities
  static const IconData refrigerator = Iconsax.driver;
  static const IconData store = Iconsax.shop;
  static const IconData warehouse = Iconsax.buildings;
  static const IconData region = Iconsax.map;
  static const IconData marker = Iconsax.location;
  static const IconData mapAdd = Iconsax.location_add;
  static const IconData box = Iconsax.box;
  static const IconData unit = Iconsax.ruler;
  static const IconData category = Iconsax.category;
  static const IconData type = Iconsax.tag;
  static const IconData status = Iconsax.colorfilter;
  static const IconData maintenance = Iconsax.cpu_setting;
  static const IconData note = Iconsax.note_text;
  static const IconData id = Iconsax.personalcard;
  static const IconData job = Iconsax.briefcase;

  //! People
  static const IconData user = Iconsax.user;
  static const IconData users = Iconsax.profile_2user;
  static const IconData employee = Iconsax.user;
  static const IconData customer = Iconsax.profile_circle;
  static const IconData userCircle = Iconsax.profile_circle;
  static const IconData userProfile = Iconsax.profile_circle;
  static const IconData manager = Iconsax.security_user;
  static const IconData representative = Iconsax.user_tag;

  //! Operations
  static const IconData operations = Iconsax.task_square;
  static const IconData visit = Iconsax.location_tick;
  static const IconData feed = Iconsax.box_add;
  static const IconData lost = Iconsax.box_remove;
  static const IconData withdraw = Iconsax.receive_square;
  static const IconData move = Iconsax.arrow_swap_horizontal;
  static const IconData transfer = Iconsax.arrow_swap;
  static const IconData other = Iconsax.more_square;
  static const IconData more = Iconsax.more;

  //! Actions
  static const IconData edit = Iconsax.edit;
  static const IconData trash = Iconsax.trash;
  static const IconData trashTow = Iconsax.trash;
  static const IconData add = Iconsax.add;
  static const IconData minus = Iconsax.minus;
  static const IconData close = Iconsax.close_circle;
  static const IconData search = Iconsax.search_normal_1;
  static const IconData filter = Iconsax.filter;
  static const IconData refresh = Iconsax.refresh;
  static const IconData rotateLeft = Iconsax.rotate_left;
  static const IconData share = Iconsax.share;
  static const IconData export = Iconsax.export;
  static const IconData print = Iconsax.printer;
  static const IconData link = Iconsax.link;
  static const IconData logout = Iconsax.logout;

  //! Files
  static const IconData file = Iconsax.document;
  static const IconData filePlus = Iconsax.document_upload;
  static const IconData pdf = Iconsax.document_text;
  static const IconData csv = Iconsax.clipboard_text;
  static const IconData excel = Iconsax.document;
  static const IconData image = Iconsax.gallery;

  //! Forms and fields
  static const IconData calendar = Iconsax.calendar;
  static const IconData date = Iconsax.calendar;
  static const IconData email = Iconsax.sms;
  static const IconData phone = Iconsax.call;
  static const IconData key = Iconsax.key;
  static const IconData lock = Iconsax.lock;
  static const IconData eye = Iconsax.eye;
  static const IconData eyeSlash = Iconsax.eye_slash;
  static const IconData money = Iconsax.money_recive;

  //! Status and feedback
  static const IconData checkCircle = Iconsax.tick_circle;
  static const IconData circle = Iconsax.record;
  static const IconData warning = Iconsax.danger;
  static const IconData info = Iconsax.info_circle;
  static const IconData pause = Iconsax.pause;
  static const IconData switchOn = Iconsax.toggle_on_circle;
  static const IconData switchOff = Iconsax.toggle_off_circle;
  static const IconData activity = Iconsax.activity;

  //! System
  static const IconData settings = Iconsax.setting_2;
  static const IconData settingsOperations = Iconsax.setting_4;
  static const IconData report = Iconsax.chart_square;
  static const IconData notification = Iconsax.notification;
  static const IconData notificationActive = Iconsax.notification_bing;
  static const IconData lightMode = Iconsax.lamp;
  static const IconData darkMode = Iconsax.moon;
  static const IconData gridView = Iconsax.element_3;
  static const IconData listView = Iconsax.row_vertical;
  static const IconData delivery = Iconsax.truck_fast;
}
