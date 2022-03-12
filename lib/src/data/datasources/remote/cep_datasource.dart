import 'package:flutter_firebase_login_clean_arch/src/data/models/address_model.dart';
import 'package:retrofit/dio.dart';

abstract class ICepDatasource {
  Future<HttpResponse<AddressModel>> getAddress(String cep);
}
