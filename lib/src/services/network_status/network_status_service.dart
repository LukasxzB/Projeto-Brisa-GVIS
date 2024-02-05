import 'package:gvis_mobilidade/src/services/network_status/network_status.dart';
import 'package:rxdart/rxdart.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatusService {
  static final NetworkStatusService _instance =
      NetworkStatusService._constructor();

  factory NetworkStatusService() => _instance;

  final BehaviorSubject<NetworkStatus> _networkStatusStream =
      BehaviorSubject<NetworkStatus>.seeded(NetworkStatus.unknown);

  Stream<NetworkStatus> get networkStatusStream => _networkStatusStream.stream;
  NetworkStatus get networkStatusValue => _networkStatusStream.value;

  NetworkStatusService._constructor() {
    Connectivity().onConnectivityChanged.listen(_addNetworkStatus);
    Connectivity().checkConnectivity().then(_addNetworkStatus);
  }

  void _addNetworkStatus(ConnectivityResult result) {
    _networkStatusStream.sink.add(result == ConnectivityResult.none
        ? NetworkStatus.disconnected
        : NetworkStatus.connected);
  }
}
