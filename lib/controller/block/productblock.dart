// import 'package:flutter/widgets.dart';
// import 'package:rxdart/rxdart.dart';
//
// import '../../model/productmodel.dart';
// import '../../widget/error_message.dart';
//
// class AppDrawerBloc {
//   final _activityIndicatorStreamController =
//       BehaviorSubject<bool>.seeded(false);
//   Stream<bool> get activityIndicatorStream =>
//       _activityIndicatorStreamController.stream;
//   Function(bool)? get _setActivityIndicatorStream =>
//       _activityIndicatorStreamController.isClosed
//           ? null
//           : _activityIndicatorStreamController.sink.add;
//
//   final _profileDeleteStreamController =
//       BehaviorSubject<Detectproductapiresp>.seeded(
//           Detectproductapiresp.fromJson({}));
//   Stream<Detectproductapiresp> get profileDeleteStream =>
//       _profileDeleteStreamController.stream;
//   Function(Detectproductapiresp)? get setProfileDeleteStreamStream =>
//       _profileDeleteStreamController.isClosed
//           ? null
//           : _profileDeleteStreamController.sink.add;
//
//   Future<void> deleteProfile(BuildContext context) async {
//     try {
//       _setActivityIndicatorStream!(true);
//       final result =
//           await RestApiClientService.shared.deleteProfile(customerId);
//       if (!result.status!) throw GeneralException(message: result.message!);
//       setProfileDeleteStreamStream!(result!);
//       _setActivityIndicatorStream!(false);
//       // FlutterToastWidget.show(
//       //     message: result.message.toString(), context: context);
//     } catch (error) {
//       _setActivityIndicatorStream!(false);
//       ErrorAlertSimpleDialog.show(message: error.toString(), context: context);
//     }
//   }
// }
