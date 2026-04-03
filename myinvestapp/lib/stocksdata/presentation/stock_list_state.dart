// bloc/stock_list_state.dart
import '../domain/domain_model.dart';

abstract class StockListState {}


class StockListLoading extends StockListState {}

class StockListLoaded extends StockListState {
  final List<StockModel> data;
  StockListLoaded(this.data);
}

class StockListError extends StockListState {
  final String message;
  StockListError(this.message);
}