enum MethodRequest { GET, POST, PUT, DELETE }

enum EndPointApp { nowPlayingMovie }

extension EndPointAppExt on EndPointApp {
  MethodRequest get method {
    switch (this) {
      default:
        return MethodRequest.GET;
    }
  }

  String get path {
    switch (this) {
      case EndPointApp.nowPlayingMovie:
        return "movie/now_playing";
      default:
        return "";
    }
  }
}

class HomeService {

  void getNowPlayingMovies(Map<String, dynamic> param) {

  }
}
