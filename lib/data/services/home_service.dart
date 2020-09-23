
import 'package:getx_demo/data/helper/resource.dart';
import 'package:getx_demo/models/movie.dart';
import '../../models/movie.dart';
import '../helper/resource.dart';
import 'base_service.dart';
import 'end_point_app.dart';

class HomeService extends BaseService {

  Future<Resource<ArrayDataResponse<Movie>>> getNowPlayingMovies() async {
    final response = await sendRequest(EndPointApp.nowPlayingMovie);
    if (response.status == Status.SUCCESS) {
      final ArrayDataResponse baseArrayResponse = ArrayDataResponse<Movie>().parseJson(response.data.data, Movie());
      return Resource.success(baseArrayResponse);
    } else {
      return Resource.error(response.error);
    }

  }

}