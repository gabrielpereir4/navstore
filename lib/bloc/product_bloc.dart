import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navstore/model/product.dart';
import 'package:navstore/provider/product_provider.dart';

// Eventos

abstract class ProductEvent {}

class ProductInsert extends ProductEvent {
  final Product newProduct;

  ProductInsert(this.newProduct);
}

class ProductLoad extends ProductEvent {
  final int id;

  ProductLoad(this.id);
}

class ProductListLoad extends ProductEvent {}

class ProductDelete extends ProductEvent {
  final int productid;

  ProductDelete(this.productid);
}

class ProductUpdate extends ProductEvent {
  final int id;
  final Product product;

  ProductUpdate(this.id, this.product);
}

// Estados

abstract class ProductState {}

class ProductInserted extends ProductState {
  final Product product;

  ProductInserted(this.product);
}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded(this.product);
}

class ProductListLoaded extends ProductState {
  final List<Product> productList;

  ProductListLoaded(this.productList);
}

class ProductLoading extends ProductState {}

class ProductLoadError extends ProductState {
  final String error;

  ProductLoadError(this.error);
}

class ProductInsertError extends ProductState {
  final String error;

  ProductInsertError(this.error);
}

// Bloc

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoading()) {
    ProductProvider.helper.stream.listen((data) {
      print("Stream received PRODUCT data");
      add(ProductListLoad());
    });

    on<ProductInsert>((event, emit) async {
      try {
        await ProductProvider.helper.insert(event.newProduct);
        emit(ProductInserted(event.newProduct));
      } catch (e) {
        emit(ProductInsertError(e.toString()));
      }
    });
    on<ProductLoad>((event, emit) async {
      try {
        Product product = await ProductProvider.helper.get(event.id) as Product;
        emit(ProductLoaded(product));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });
    on<ProductListLoad>((event, emit) async {
      try {
        print('FETCH PRODUCT LIST');
        List<Product> list = await ProductProvider.helper.getList();
        print(list);
        emit(ProductListLoaded(list));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });
    on<ProductUpdate>((event, emit) async {
      await ProductProvider.helper.update(event.id, event.product);
    });
    on<ProductDelete>((event, emit) async {
      await ProductProvider.helper.delete(event.productid);
    });
  }
}
