
import 'package:get/get.dart';
import 'package:getx_demo/data/services/base_service.dart';
import 'package:getx_demo/data/services/end_point_app.dart';
import 'package:getx_demo/models/movie.dart';

class MovieController extends GetxController {

  final BaseService _baseService = BaseService();

  @override
  void onReady() {
    getAPI();
    super.onReady();
  }

  Future getAPI() async {
    final response = await _baseService.sendRequest(EndPointApp.nowPlayingMovie);
    final BaseArrayResponse arrayResponse = BaseArrayResponse<Movie>().parseJson(response.data, Movie());
    print("======> arrayResponse: ${arrayResponse.data.length}");
  }
}