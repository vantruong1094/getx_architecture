
import 'package:getx_demo/data/helper/resource.dart';
import 'package:getx_demo/models/movie.dart';

abstract class HomeRepository {

  Future<Resource<Movie>> getNowPlayingMovies();
}