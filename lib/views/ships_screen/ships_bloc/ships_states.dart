import 'package:sampleblocpatternwithsinglestate/data/models/ships/ships_data_model.dart';

enum ShipStatus {
  initial,
  loading,
  loaded,
  error,
}

final class ShipsStates {
  String? error;
  int? statusCode;
  List<ShipsDataModel> shipsDataModelList;
  ShipStatus shipStatus;

  ShipsStates({
    this.error,
    this.shipsDataModelList = const [],
    this.shipStatus = ShipStatus.initial,
  });

  ShipsStates copyWith({
    error,
    statusCode,
    shipsDataModelList,
    shipStatus,
  }) {
    return ShipsStates(
      error: error ?? this.error,
      shipsDataModelList: shipsDataModelList ?? this.shipsDataModelList,
      shipStatus: shipStatus ?? this.shipStatus,
    );
  }
}
