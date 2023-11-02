import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleblocpatternwithsinglestate/data/database/entities/ships_entity.dart';
import 'package:sampleblocpatternwithsinglestate/data/models/ships/ships_data_model.dart';
import 'package:sampleblocpatternwithsinglestate/domain/repositories/ships_repository.dart';
import 'package:sampleblocpatternwithsinglestate/views/ships_screen/ships_events/ships_events.dart';
import 'package:sampleblocpatternwithsinglestate/views/ships_screen/ships_states/ships_states.dart';

class ShipsBloc extends Bloc<ShipsEvents, ShipsStates> {
  final ShipsRepository _shipsRepository = ShipsRepository();

  ShipsBloc(ShipsStates shipsStates) : super(shipsStates) {
    on<ShipsFetchData>(_onShipsFetched);
    on<ShipsFromLocalDatabase>(_shipsFromLocalDatabase);
    on<ShipsLocalSearch>(_onShipsLocalSearch);
  }

  Future<void> _onShipsFetched(
    ShipsFetchData event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(ShipsLoadingState());
    await _shipsRepository.requestAndSaveDataLocal().then((value) async {
      List<ShipsDataModel> shipsDataModelList =
          await ShipsDataModel.createShipsDataModel(value);
      emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
    }).catchError((err) async {
      emit(const ShipsErrorState(
        error: "Something went wrong",
        statusCode: -1,
      ));
    });
  }

  Future<void> _shipsFromLocalDatabase(
    ShipsFromLocalDatabase event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(ShipsLoadingState());
    List<ShipsEntity> shipsEntityList = await ShipsEntity.getAllShips();
    List<ShipsDataModel> shipsDataModelList =
        await ShipsDataModel.createShipsDataModel(shipsEntityList);
    emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
  }

  Future<void> _onShipsLocalSearch(
    ShipsLocalSearch event,
    Emitter<ShipsStates> emit,
  ) async {
    List<ShipsEntity> shipsEntityList =
        await ShipsEntity.getShipsByName(event.searchText ?? "");
    List<ShipsDataModel>? shipsDataModelList =
        await ShipsDataModel.createShipsDataModel(shipsEntityList);
    emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
  }
}
