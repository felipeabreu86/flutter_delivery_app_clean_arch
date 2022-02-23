import 'package:flutter_delivery_app_clean_arch/src/core/resources/data_state.dart';
import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';

abstract class ViaCepRepository {
  Future<DataState<Address>> getAddress(String cep);
}
