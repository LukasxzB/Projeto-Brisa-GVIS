const String _logoPath = 'assets/app_logo';
const String _backPath = 'assets/background';

enum AppImagePath {
  appLogoImage('$_logoPath/app_logo.png'),
  appLogoWithBackgroundImage('$_logoPath/app_logo_with_background.png'),
  greenGradientBackgroundImage('$_backPath/green_gradient_background.png');

  final String imagePath;
  const AppImagePath(this.imagePath);
}
