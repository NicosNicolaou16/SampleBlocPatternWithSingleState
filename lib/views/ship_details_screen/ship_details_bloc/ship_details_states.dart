import 'package:sampleblocpatternwithsinglestate/data/models/ship_details/ship_details_data_model.dart';

enum ShipDetailsStatus {
  initial,
  loading,
  loaded,
  error,
}

class ShipDetailsStates {
  String? error;
  int? statusCode;
  List<ShipDetailsDataModel> shipDetailsDataModelList;
  ShipDetailsStatus shipDetailsStatus;

  ShipDetailsStates({
    this.error,
    this.statusCode,
    this.shipDetailsDataModelList = const [],
    this.shipDetailsStatus = ShipDetailsStatus.initial,
  });

  ShipDetailsStates copyWith({
    String? error,
    int? statusCode,
    List<ShipDetailsDataModel>? shipDetailsDataModelList,
    required ShipDetailsStatus shipDetailsStatus,
  }) {
    return ShipDetailsStates(
      error: error ?? this.error,
      statusCode: statusCode ?? this.statusCode,
      shipDetailsDataModelList:
          shipDetailsDataModelList ?? this.shipDetailsDataModelList,
      shipDetailsStatus: shipDetailsStatus,
    );
  }
}
