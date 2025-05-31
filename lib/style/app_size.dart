class Insets {
  static const double maxWidth = 1280;
  static double get med => 12;
  static double get xs => 4;
  static double get xl => 20;
  static double get xxl => 32;
  static double get xxxl => 80;
  static double get lg => 16;
  static double get sm => 8;
}

abstract class AppInsets {
  double get padding;
  double get appBarHeight;
  double get cardpadding;
  double get gap;
}

class LargeInsets extends AppInsets {
  @override
  double get padding => 80;

  @override
  double get appBarHeight => 64;

  @override
  double get cardpadding => Insets.xl;

  @override
  double get gap => 120;
}

class SmallInsets extends AppInsets {
  @override
  double get padding => 16;

  @override
  double get appBarHeight => 56;

  @override
  double get cardpadding => Insets.lg;

  @override
  double get gap => 120;
}
