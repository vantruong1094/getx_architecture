
import 'package:getx_demo/data/helper/network_checker.dart';
import 'package:getx_demo/data/helper/resource.dart';
import 'app_exception.dart';

Future<Resource<E>> createResource<T, E>(
    Future<T> Function() block, E Function(T) map) async {
  final connected = await NetworkChecker.check();
  if (!connected) {
    return Resource.error(NoNetworkException());
  }
  try {
    final response = await block();
    return Resource.success(map(response));
  } catch (e) {
    print('ERROR: =======> $e');
    return Resource.error(handleError(e));
  }
}