import 'package:flutter_delivery_app_clean_arch/src/domain/entities/address.dart';

class ViaCepResponseModel extends Address {
  const ViaCepResponseModel({
    required String cep,
    required String logradouro,
    required String complemento,
    required String bairro,
    required String localidade,
    required String uf,
    required String ibge,
    required String gia,
    required String ddd,
    required String siafi,
  }) : super(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
          ibge: ibge,
          gia: gia,
          ddd: ddd,
          siafi: siafi,
        );

  factory ViaCepResponseModel.fromJson(Map<String, dynamic> json) {
    return ViaCepResponseModel(
      cep: json['cep']?.toString() ?? '',
      logradouro: json['logradouro']?.toString() ?? '',
      complemento: json['complemento']?.toString() ?? '',
      bairro: json['bairro']?.toString() ?? '',
      localidade: json['localidade']?.toString() ?? '',
      uf: json['uf']?.toString() ?? '',
      ibge: json['ibge']?.toString() ?? '',
      gia: json['gia']?.toString() ?? '',
      ddd: json['ddd']?.toString() ?? '',
      siafi: json['siafi']?.toString() ?? '',
    );
  }
}
