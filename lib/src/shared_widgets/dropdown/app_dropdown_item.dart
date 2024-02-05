import 'package:gvis_mobilidade/src/shared_widgets/dropdown/app_dropdown.dart';

///
/// [AppDropdownItem] é uma classe de modelo para um item de um [AppDropdown].
///
/// O [AppDropdownItem] é composto por um [text] e um [value].
/// - [text] é o texto que será exibido dentro do [AppDropdown].
/// - [value] é o valor utilizado para identificar o item dentro do [AppDropdown].
///

class AppDropdownItem {
  final String text;
  final String value;

  const AppDropdownItem({
    required this.text,
    required this.value,
  });
}
