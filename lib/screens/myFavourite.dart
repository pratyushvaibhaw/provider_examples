import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/favourite_provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({super.key});

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final _favprovider = Provider.of<FavouriteProvider>(context);
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your favourites',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.favorite_outlined,
              size: 18,
              color: Colors.red,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                    builder: ((context, favProvider, child) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(15),
                    onTap: () {
                      favProvider.removeItem(favProvider.selecctedItem[index]);
                    },
                    title: Text('Item ' +
                        (favProvider.selecctedItem[index] + 1).toString()),
                    trailing: Icon(
                      Icons.favorite_outlined,
                      color: Colors.red,
                    ),
                  );
                }));
              },
              itemCount: _favprovider.selecctedItem.length,
            ),
          )
        ],
      ),
    );
  }
}
