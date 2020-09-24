enum MethodRequest { GET, POST, PUT, DELETE }

enum EndPointApp {
  nowPlayingMovie,
  popularMovie,
  topRatedMovie,
  upCommingMovie
}

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
      case EndPointApp.popularMovie:
        return "movie/popular";
      case EndPointApp.topRatedMovie:
        return "movie/top_rated";
      case EndPointApp.upCommingMovie:
        return 'movie/upcoming';
      default:
        return "";
    }
  }
}
