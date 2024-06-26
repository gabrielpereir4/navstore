import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/model/market.dart';
import 'package:navstore/provider/market_provider.dart';

// Eventos

abstract class MarketEvent {}

class MarketInsert extends MarketEvent {
  final Market newMarket;

  MarketInsert(this.newMarket);
}

class MarketLoad extends MarketEvent {
  final int id;

  MarketLoad(this.id);
}

class MarketListLoad extends MarketEvent {}

class MarketDelete extends MarketEvent {
  final int marketid;

  MarketDelete(this.marketid);
}

class MarketUpdate extends MarketEvent {
  final int id;
  final Market market;

  MarketUpdate(this.id, this.market);
}

// Estados

abstract class MarketState {}

class MarketInserted extends MarketState {
  final Market market;

  MarketInserted(this.market);
}

class MarketLoaded extends MarketState {
  final Market market;

  MarketLoaded(this.market);
}

class MarketListLoaded extends MarketState {
  final List<Market> marketList;

  MarketListLoaded(this.marketList);
}

class MarketLoading extends MarketState {}

class MarketLoadError extends MarketState {
  final String error;

  MarketLoadError(this.error);
}

class MarketInsertError extends MarketState {
  final String error;

  MarketInsertError(this.error);
}

// Bloc

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketLoading()) {
    MarketProvider.helper.stream.listen((data) {
      print("Stream received MARKET data");
      add(MarketListLoad());
    });

    on<MarketInsert>((event, emit) async {
      try {
        await MarketProvider.helper.insert(event.newMarket) as Market;
        emit(MarketInserted(event.newMarket));
      } catch (e) {
        emit(MarketInsertError(e.toString()));
      }
    });
    on<MarketLoad>((event, emit) async {
      try {
        Market market = await MarketProvider.helper.get(event.id) as Market;
        emit(MarketLoaded(market));
      } catch (e) {
        emit(MarketLoadError(e.toString()));
      }
    });
    on<MarketListLoad>((event, emit) async {
      try {
        List<Market> list =
            await MarketProvider.helper.getList() as List<Market>;
        emit(MarketListLoaded(list));
      } catch (e) {
        emit(MarketLoadError(e.toString()));
      }
    });
    on<MarketUpdate>((event, emit) async {
      await MarketProvider.helper.update(event.id, event.market);
    });
    on<MarketDelete>((event, emit) async {
      await MarketProvider.helper.delete(event.marketid);
    });
  }
}
