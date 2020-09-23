import 'package:getx_demo/data/helper/app_exception.dart';

enum Status { INITIALIZE, LOADING, SUCCESS, ERROR, EMPTY }

class Resource<T extends dynamic> {
  final Status status;
  final T data;
  final AppException error;

  Resource._default({this.status, this.data, this.error});

  Resource.success(this.data)
      : this.error = null,
        this.status = Status.SUCCESS;

  Resource.initialize({this.data})
      : this.error = null,
        this.status = Status.INITIALIZE;

  Resource.error(this.error, {this.data}) : this.status = Status.ERROR;

  Resource.loading({this.data})
      : this.error = null,
        this.status = Status.LOADING;

  Resource.empty({this.data})
      : this.error = null,
        this.status = Status.EMPTY;

  @override
  String toString() {
    return 'Resource{status: $status, error: $error}';
  }

  Resource<T> copyWith({Status status, T data, Object error}) {
    return Resource._default(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}