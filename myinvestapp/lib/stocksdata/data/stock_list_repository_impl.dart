import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

import '../domain/domain_model.dart';
import '../domain/domain_model_mapper.dart';
import '../domain/stock_list_repository.dart';

class StockListRepositoryImpl implements StockListRepository {
  final Dio dio;
  final DomainModelMapper mapper = DomainModelMapper();

  StockListRepositoryImpl(this.dio);

 final String baseUrl = "http://localhost:3000"; 

  @override
  Future<Either<Failure, Response>> fetchPanchangamData() async{  
    try {
    final res = await dio.get("$baseUrl/stocks");
      return Right(res);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
    //return PanchangamModel(id: "",tithi: "tithi",nakshatra: "nakshatra",yoga: "yoga",karana: "karana");
  } 

}


  