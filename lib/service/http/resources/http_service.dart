abstract class HttpService {
  static const String baseUrl =
      'https://learning-data-sync-mobile.herokuapp.com/datasync/';

  static const headers = {
    "content-type": "application/json",
    "accept": "application/json",
  };

  static const timeoutDuration = Duration(seconds: 10);
}
