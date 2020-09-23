
import 'package:get/get.dart';
import 'package:getx_demo/data/services/home_service.dart';

import '../data/helper/resource.dart';
import '../models/movie.dart';
import 'sum_controller.dart';

class MovieController extends BaseController {

  final HomeService _homeService = HomeService();

  RxList<Movie> listMovie = List<Movie>().obs;

  @override
  void onReady() {
    getAPI();
    super.onReady();
  }

  Future getAPI() async {
    showLoadingView();
    final response = await _homeService.getNowPlayingMovies();

    hideLoadingView();
    if (response.status == Status.SUCCESS) {
      print("data: ${response.data.results.length}");
      listMovie.value = response.data.results;
    } else {
      print("error: ${response.error.message}");
    }
  }
}