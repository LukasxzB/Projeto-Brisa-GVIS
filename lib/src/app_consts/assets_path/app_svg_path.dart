const String _iconsPath = 'assets/svg_icons';

enum AppSvgPath {
  backArrowIcon('$_iconsPath/back_arrow.svg'),
  cameraAddIcon('$_iconsPath/camera_add.svg'),
  cityIcon('$_iconsPath/city.svg'),
  deleteForeverIcon('$_iconsPath/delete_forever.svg'),
  establishmentIcon('$_iconsPath/establishment.svg'),
  evaluationIcon('$_iconsPath/evaluation.svg'),
  eyeClosedIcon('$_iconsPath/eye_closed.svg'),
  eyeOpenIcon('$_iconsPath/eye_open.svg'),
  goArrowIcon('$_iconsPath/go_arrow.svg'),
  historyIcon('$_iconsPath/history.svg'),
  infoIcon('$_iconsPath/info.svg'),
  logoffIcon('$_iconsPath/logoff.svg'),
  passwordIcon('$_iconsPath/password.svg'),
  profileIcon('$_iconsPath/profile.svg'),
  searchIcon('$_iconsPath/search.svg'),
  serverIcon('$_iconsPath/server.svg'),
  spiderWebIcon('$_iconsPath/spider_web.svg'),
  termsIcon('$_iconsPath/terms.svg'),
  wifiOffIcon('$_iconsPath/wifi_off.svg'),
  wifiIcon('$_iconsPath/wifi.svg'),
  importIcon('$_iconsPath/import.svg'),
  exportIcon('$_iconsPath/export.svg'),
  writeIcon('$_iconsPath/write.svg');

  final String svgPath;
  const AppSvgPath(this.svgPath);
}
