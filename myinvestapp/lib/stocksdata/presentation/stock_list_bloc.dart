import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myinvestapp/stocksdata/domain/stock_list_usecase.dart';
import 'stock_list_state.dart';



class StockListBloc extends Cubit<StockListState> {
  final StockListUsecase _stockListUsecase;

   StockListBloc(
     StockListUsecase stockListUsecase,
  )  : _stockListUsecase = stockListUsecase, super(StockListLoading());


  Future<void> fetchStockListData() async {
    try {
      final data = await _stockListUsecase.fetchStockListData();
      emit(StockListLoaded(data));
    } catch (e) {
      emit(StockListError("Failed to fetch stock list data: $e"));
    }
  }

  
}


