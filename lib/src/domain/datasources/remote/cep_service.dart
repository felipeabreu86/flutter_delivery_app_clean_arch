import 'package:flutter_delivery_app_clean_arch/src/data/models/via_cep_response_model.dart';
import 'package:retrofit/dio.dart';

abstract class CepService {
  Future<HttpResponse<ViaCepResponseModel>> getAddress(String cep);
}
