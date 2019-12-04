import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<OrderResponseModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<OrderResponseModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.orders.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          print(snapshot.data.orders[index].items[0].quantity.toString());
          return buildItemList(snapshot.data.orders[index].items);
          // Image.network(
          //   'https://image.tmdb.org/t/p/w185${snapshot.data
          //       .results[index].poster_path}',
          //   fit: BoxFit.cover,
          // );
        });
  }

    Widget buildItemList(List<dynamic> items) {
    return GridView.builder(
        itemCount: items.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          print(items[index].quantity.toString());
          return Text(items[index].quantity.toString());
          // Image.network(
          //   'https://image.tmdb.org/t/p/w185${snapshot.data
          //       .results[index].poster_path}',
          //   fit: BoxFit.cover,
          // );
        });
  }
}