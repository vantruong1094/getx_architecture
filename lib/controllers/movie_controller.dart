
import 'package:get/get.dart';
import 'package:getx_demo/controllers/base_controller.dart';
import 'package:getx_demo/data/services/end_point_app.dart';
import 'package:getx_demo/data/services/home_service.dart';

import '../data/helper/resource.dart';
import '../models/movie.dart';

enum MovieSection {
  NOW_PLAYING,
  POPULAR,
  TOP_RATED,
  UPCOMMING
}

extension MovieSectionExt on MovieSection {
  String get title {
    switch (this) {
      case MovieSection.NOW_PLAYING: return "Now Playing";
      case MovieSection.POPULAR: return "Popular";
      case MovieSection.TOP_RATED: return "Top Rated";
      case MovieSection.UPCOMMING: return "Upcomming";
    }
  }
}

class MovieController extends BaseController {

  final HomeService _homeService = HomeService();

  RxList<Movie> listNowPlayingMovie = List<Movie>().obs;
  RxList<Movie> listPopularMovie = List<Movie>().obs;
  RxList<Movie> listTopRatedMovie = List<Movie>().obs;
  RxList<Movie> listUpCommingMovie = List<Movie>().obs;

  bool get showNowPlayingMovie => listNowPlayingMovie.value.length > 0;
  bool get showPopularMovie => listPopularMovie.value.length > 0;
  bool get showTopRatedgMovie => listTopRatedMovie.value.length > 0;
  bool get showUpCommingMovie => listUpCommingMovie.value.length > 0;

  List<Movie> get nowPlayingMovies => listNowPlayingMovie.value;
  List<Movie> get popularMovies => listPopularMovie.value;
  List<Movie> get topRatedMovies => listTopRatedMovie.value;
  List<Movie> get upcommingMovies => listUpCommingMovie.value;

  @override
  void onReady() {
    getAPI();
    super.onReady();
  }

  Future getAPI() async {
    showLoadingView();
    final responsePlayingMovie = await _homeService.getMovies(EndPointApp.nowPlayingMovie);
    final resPopularMovie = await _homeService.getMovies(EndPointApp.popularMovie);
    final resTopRatedMovie = await _homeService.getMovies(EndPointApp.topRatedMovie);
    final resUpCommingMovie = await _homeService.getMovies(EndPointApp.upCommingMovie);

    hideLoadingView();
    if (responsePlayingMovie.status == Status.SUCCESS) {
      listNowPlayingMovie.value = responsePlayingMovie.data.results.getRange(0, 10).toList();
    }

    if (resPopularMovie.status == Status.SUCCESS) {
      listPopularMovie.value = resPopularMovie.data.results.getRange(0, 10).toList();
    }

    if (resTopRatedMovie.status == Status.SUCCESS) {
      listTopRatedMovie.value = resTopRatedMovie.data.results.getRange(0, 10).toList();
    }

    if (resUpCommingMovie.status == Status.SUCCESS) {
      listUpCommingMovie.value = resUpCommingMovie.data.results.getRange(0, 10).toList();
    }
  }
}