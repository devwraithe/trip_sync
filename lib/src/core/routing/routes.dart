class Routes {
  // Auth routes
  static String auth = "/auth";
  static String signUp = '$auth/sign_up';
  static String signIn = '$auth/sign_in';
  static String resetPassword = '$auth/reset_password';

  // Trips routes
  static String trips = "/trips";
  static String newTrip = "$trips/new-trip";
}
