import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleblocpatternwithsinglestate/data/database/entities/ships_entity.dart';
import 'package:sampleblocpatternwithsinglestate/data/models/ships/ships_data_model.dart';
import 'package:sampleblocpatternwithsinglestate/data/repositories/ships_repository.dart';
import 'package:sampleblocpatternwithsinglestate/utils/error_handling.dart';
import 'package:sampleblocpatternwithsinglestate/views/ships_screen/ships_bloc/ships_events.dart';
import 'package:sampleblocpatternwithsinglestate/views/ships_screen/ships_bloc/ships_states.dart';

class ShipsBloc extends Bloc<ShipsEvents, ShipsStates> {
  final ShipsRepository _shipsRepository = ShipsRepository();

  ShipsBloc() : super(ShipsStates()) {
    on<ShipsFetchData>(_onShipsFetched);
    on<ShipsFromLocalDatabase>(_shipsFromLocalDatabase);
    on<ShipsLocalSearch>(_onShipsLocalSearch);
  }

  Future<void> _onShipsFetched(
    ShipsFetchData event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(state.copyWith(shipStatus: ShipStatus.loading));
    await _shipsRepository
        .requestAndSaveDataLocal()
        .then((shipsServiceResponse) async {
      if (shipsServiceResponse.shipsEntityList != null) {
        List<ShipsDataModel> shipsDataModelList =
            await ShipsDataModel.createShipsDataModel(
                shipsServiceResponse.shipsEntityList!);
        emit(state.copyWith(
            shipStatus: ShipStatus.loaded,
            shipsDataModelList: shipsDataModelList));
      } else {
        emit(state.copyWith(
          error: ErrorHandling.getErrorMessage(
              shipsServiceResponse.dioException,
              shipsServiceResponse.statusMessage,
              shipsServiceResponse.statusCode ?? -1),
          statusCode: -1,
          shipStatus: ShipStatus.error,
        ));
      }
    });
  }

  Future<void> _shipsFromLocalDatabase(
    ShipsFromLocalDatabase event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(state.copyWith(shipStatus: ShipStatus.loading));
    List<ShipsEntity> shipsEntityList = await ShipsEntity.getAllShips();
    List<ShipsDataModel> shipsDataModelList =
        await ShipsDataModel.createShipsDataModel(shipsEntityList);
    emit(state.copyWith(
        shipStatus: ShipStatus.loaded, shipsDataModelList: shipsDataModelList));
  }

  Future<void> _onShipsLocalSearch(
    ShipsLocalSearch event,
    Emitter<ShipsStates> emit,
  ) async {
    List<ShipsEntity> shipsEntityList =
        await ShipsEntity.getShipsByName(event.searchText ?? "");
    List<ShipsDataModel>? shipsDataModelList =
        await ShipsDataModel.createShipsDataModel(shipsEntityList);
    emit(state.copyWith(
        shipStatus: ShipStatus.loaded, shipsDataModelList: shipsDataModelList));
  }
}
