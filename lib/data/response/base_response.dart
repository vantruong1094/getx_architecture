
class ArrayDataResponse<T> {
  List<T> results;

  ArrayDataResponse({this.results});

  ArrayDataResponse<T> parseJson(Map<String, dynamic> json, BaseObject<T> target) {
    return ArrayDataResponse(results: (json["results"] as List).map((e) => target.fromJson(e)).toList());
  }
}

class DataResponse<T> {
  T result;

  DataResponse({this.result});

  DataResponse parseJson(Map<String, dynamic> json, BaseObject target) {
    return DataResponse(result: target.fromJson(json));
  }
}

abstract class BaseObject<T> {
  T fromJson(json);
}