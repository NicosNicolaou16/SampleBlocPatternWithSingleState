import 'package:dio/dio.dart';
import 'package:sampleblocpatternwithsinglestate/data/database/entities/ships_entity.dart';
import 'package:sampleblocpatternwithsinglestate/utils/apis/apis.dart';

class ShipsService {
  Future<List<ShipsEntity>> getShips() async {
    return Dio().get(Api.shipsUrl).then((response) {
      if (response.statusCode! == 200) {
        return ShipsEntity.fromJsonList(response.data);
      } else {
        return [];
      }
    });
  }
}
