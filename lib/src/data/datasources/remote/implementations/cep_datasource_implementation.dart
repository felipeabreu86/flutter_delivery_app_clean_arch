import 'package:dio/dio.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/datasources/remote/cep_datasource.dart';
import 'package:flutter_firebase_login_clean_arch/src/data/models/address_model.dart';
import 'package:retrofit/retrofit.dart';

// run: flutter packages pub run build_runner build --delete-conflicting-outputs
// watch: flutter packages pub run build_runner watch
part 'cep_datasource_implementation.g.dart';

@RestApi(baseUrl: kViaCepUrl)
abstract class CepDatasourceImplementation implements ICepDatasource {
  factory CepDatasourceImplementation(Dio dio, {String baseUrl}) =
      _CepDatasourceImplementation;

  @override
  @GET('/{cep}/json')
  Future<HttpResponse<AddressModel>> getAddress(@Path("cep") String cep);
}
