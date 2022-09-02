import 'package:flutter/cupertino.dart';

import '../constants/enums.dart';
import '../constants/service_constants.dart';

abstract class BaseViewModel extends ChangeNotifier {
  ProviderState _providerState = ProviderState.idle;
  ProviderState get providerState => _providerState;

  set providerState(ProviderState providerState) {
    if (providerState != _providerState) {
      _providerState = providerState;
      notifyListeners();
    }
  }

  Future<void> initProvider();
  final ServiceConstants serviceConstants = ServiceConstants();
}
