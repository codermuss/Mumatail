import 'package:mumacock/core/services/network_service.dart';

abstract class BaseApiService {
  NetworkService get networkService => NetworkService();
}
