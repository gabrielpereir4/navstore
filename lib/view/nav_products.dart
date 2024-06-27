import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:navstore/bloc/product_bloc.dart';
import '../model/product.dart';

String searchQuery = '';

void _showMap(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/products/example.png'), // Trocar pela imagem do mapa
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );
    },
  );
}

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final List colors = [Colors.orange, Colors.red, Colors.yellow];
  final List icons = [Icons.ac_unit_outlined, Icons.access_alarm_rounded];

  List<Widget> _buildGridTileList(
      List<Product> productsList, BuildContext context) {
    List<Widget> children = [];

    List<Product> filterProducts(List<Product> productsList) {
      if (searchQuery.isEmpty) {
        return productsList;
      } else {
        return productsList
            .where((product) =>
                product.name
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()) ||
                product.section
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase()))
            .toList();
      }
    }

    List<Product> listFiltered = filterProducts(productsList);
    for (var product in listFiltered) {
      children.add(Container(
        padding: EdgeInsets.all(2.0),
        margin: EdgeInsets.only(bottom: 8.0, top: 0.0, left: 22.0, right: 22.0),
        color: Color.fromARGB(245, 244, 244, 244),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _showMap(context);
              },
              child: Image(image: AssetImage('../assets/products/example.png')),
            ),
            SizedBox(height: 1.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 1.0),
            Text(
              product.section,
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 65, 65, 65)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ));
    }
    if (listFiltered.isEmpty) {
      children.add(Container(
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.all(0.0),
        width: 300.0,
        color: Color.fromARGB(0, 244, 244, 244),
        child: Center(
          child: Text(
            'Nenhum produto encontrado!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }

    return children;
  }

  @override
  // void initState() {
  //   super.initState();
  //   context.read<ProductBloc>().add(LoadProducts());
  // }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      if (state is ProductLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ProductLoadError) {
        return Center(child: Text('Erro ao carregar produtos: ${state.error}'));
      }
      if (state is ProductListLoaded) {
        List<Product> productsList = state.productList;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    onChanged: (String text) {
                                      searchQuery =
                                          text; // Atualiza a variável global quando o texto muda
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Pesquisar Produto...',
                                      hintStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                        left: 10.0,
                                        top: 15.0,
                                        right: 10.0,
                                        bottom: 15.0,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {
                                    print('Pesquisar');
                                    print(searchQuery);
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: 260,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Set the desired corner radius
                                  color: const Color(0xFF240379),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: _buildGridTileList(productsList, context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
