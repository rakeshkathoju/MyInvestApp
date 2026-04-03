import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart';

import 'stocksdata/domain/domain_model.dart';
import 'stocksdata/presentation/stock_list_state.dart';
import 'stocksdata/presentation/stock_list_bloc.dart';

class StockListWidget extends StatefulWidget {
  const StockListWidget({super.key, required this.title});

  final String title;

  @override
  State<StockListWidget> createState() => _StockListWidgetState();
}

class _StockListWidgetState extends State<StockListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StockListBloc>()..fetchStockListData(),
      // Use Scaffold here so the AppBar and Body work correctly
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocBuilder<StockListBloc, StockListState>(
          builder: (context, state) {
            if (state is StockListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StockListLoaded) {
              // Pass the stocks from the state to the widget
              return loadedWidget(state.data); 
            } else if (state is StockListError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Press button to fetch stocks'));
          },
        ),
      ),
    );
  }

  // Modified to accept the list of stocks
  Widget loadedWidget(List<StockModel> stocks) {
    if (stocks.isEmpty) {
      return const Center(child: Text("No stocks found for today."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final stock = stocks[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            title: Text(
              stock.stockName ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Qty: ${stock.quantity} | Target: ${stock.target}"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Price: ${stock.price}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "PnL: ${stock.pnl}",
                  style: TextStyle(
                    color: (double.tryParse(stock.pnl.toString()) ?? 0) >= 0 
                        ? Colors.green 
                        : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



