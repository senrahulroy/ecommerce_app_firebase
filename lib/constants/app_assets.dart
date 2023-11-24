class AppAssets {
  AppAssets._();

  // static const   _jsonPath = "assets/json";
  // static const String  emptyJson = "$_base/empty.json";

  /// Common path for json
  static String jsonPath(String fileName) {
    return "assets/json/$fileName";
  }

  /// common path for image
  static String imagePath(String fileName) {
    return "assets/images/$fileName";
  }

  /// All json String delete.json
  static String get splashJson => jsonPath("splash.json");
  static String get welcomeJson => jsonPath("welcome.json");
  static String get loginJson => jsonPath("login.json");
  static String get signUpJson => jsonPath("signup.json");
  static String get facebookJson => jsonPath("facebook.json");
  static String get googleJson => jsonPath("google.json");
  static String get internetJson => jsonPath("internet.json");


}
