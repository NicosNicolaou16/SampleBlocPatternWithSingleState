import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleblocpatternwithsinglestate/data/models/ship_details/ship_details_data_model.dart';
import 'package:sampleblocpatternwithsinglestate/views/ship_details_screen/ship_details_events/ship_details_events.dart';
import 'package:sampleblocpatternwithsinglestate/views/ship_details_screen/ship_details_states/ship_details_states.dart';

class ShipDetailsBloc extends Bloc<ShipDetailsEvents, ShipDetailsStates> {
  ShipDetailsBloc(ShipDetailsStates shipStates) : super(shipStates) {
    on<ShipDetailsLocalQuery>(_onShipsLocalSearch);
  }

  Future<void> _onShipsLocalSearch(
    ShipDetailsLocalQuery event,
    Emitter<ShipDetailsStates> emit,
  ) async {
    if (event.shipId != "-1") {
      emit(ShipDetailsLoadedState(
          shipDetailsDataModelList:
              await ShipDetailsDataModel.createShipDetailsDataModel(
                  event.shipId)));
    } else {
      emit(const ShipDetailsErrorState());
    }
  }
}
