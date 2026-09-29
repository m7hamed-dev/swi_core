/// The layer both SWI apps share.
///
/// HTTP plumbing and the types that travel with it. Everything here is free of
/// app configuration: no service locator, no flavour, no navigator, no
/// logging. What an app needs to supply, it supplies through a constructor.
library;

export 'src/constants/app_icons.dart';
export 'src/constants/border_values.dart';
export 'src/constants/colors.dart';
export 'src/constants/font_size.dart';
export 'src/constants/light_colors.dart';
export 'src/constants/messages.dart';
export 'src/constants/size.dart';
export 'src/constants/values.dart';
export 'src/helpers/data_type_handler.dart';
export 'src/helpers/date_readable.dart';
export 'src/helpers/fixed.dart';
export 'src/helpers/ksa_money_format.dart';
export 'src/helpers/money_format.dart';
export 'src/helpers/pop.dart';
export 'src/helpers/push.dart';
export 'src/helpers/remove_some_string.dart';
export 'src/helpers/secure_storage.dart';
export 'src/helpers/sum_doubles.dart';
export 'src/helpers/sum_strings.dart';
export 'src/helpers/tax_calc.dart';
export 'src/helpers/validations.dart';
export 'src/logging/app_log.dart';
export 'src/network/api_consumer.dart';
export 'src/network/api_message_model.dart';
export 'src/network/api_response.dart';
export 'src/network/dio_consumer.dart';
export 'src/network/dio_make_request.dart';
export 'src/network/exception_to_message.dart';
export 'src/network/general_exceptions.dart';
export 'src/network/make_request.dart';
export 'src/network/network_status.dart';
export 'src/network/result.dart';
export 'src/network/server_error_message.dart';
export 'src/network/smart_handler.dart';
export 'src/network/status_code.dart';
export 'src/network/status_to_message.dart';

//! Widgets that carry no app state
export 'src/widgets/auto_complete_model.dart';
export 'src/widgets/circular_loading.dart';
export 'src/widgets/closer_div.dart';
export 'src/widgets/empty_cached_image.dart';
export 'src/widgets/error_cached_image.dart';
export 'src/widgets/error_for_main.dart';
export 'src/widgets/flash_border_card.dart';
export 'src/widgets/image_picker_methods.dart';
export 'src/widgets/image_state.dart';
export 'src/widgets/input_clear_icon.dart';
export 'src/widgets/input_eye_or_splash_eye.dart';
export 'src/widgets/input_search_icon.dart';
export 'src/widgets/input_suffix.dart';
export 'src/widgets/input_tracking_icon.dart';
export 'src/widgets/loading_cached_image.dart';
export 'src/widgets/picked_image_card.dart';
export 'src/widgets/rounded_svg_icon.dart';
export 'src/widgets/row_action_type.dart';
export 'src/widgets/sliver_height.dart';
export 'src/widgets/svg_icon.dart';
