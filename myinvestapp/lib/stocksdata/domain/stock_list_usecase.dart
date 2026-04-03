
import 'domain_model.dart';
import 'domain_model_mapper.dart';
import 'stock_list_repository.dart';

class StockListUsecase {
  final StockListRepository repository;
  final DomainModelMapper mapper = DomainModelMapper();

  StockListUsecase(this.repository);

  Future<List<StockModel>> fetchStockListData() async {
    final result = await repository.fetchPanchangamData();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (response) => mapper.execute(response),
    );
  }
}