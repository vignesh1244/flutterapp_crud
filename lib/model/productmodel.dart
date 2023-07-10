import 'package:rxdart/rxdart.dart';
class  productcontroller{
  final _activityIndicatorStreamController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get activityIndicatorStream => _activityIndicatorStreamController.stream;
  Function(bool)? get _setActivityIndicatorStream =>
      _activityIndicatorStreamController.isClosed ? null : _activityIndicatorStreamController.sink.add;

}