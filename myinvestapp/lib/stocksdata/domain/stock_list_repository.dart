import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'domain_model.dart';


abstract class StockListRepository {
  Future<Either<Failure, Response>> fetchPanchangamData(); 
}