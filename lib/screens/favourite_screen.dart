import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/favourite_provider.dart';
import 'package:provider_one/screens/myFavourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    // final favProvider = Provider.of<FavouriteProvider>(context);
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavouriteItem()));
              },
              child: Text('Favourites'))
        ],
        centerTitle: true,
        title: Row(
          children: [
            Text(
              'Add to favourites',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.favorite_outlined,
              size: 18,
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
                      if (!favProvider.selecctedItem.contains(index))
                        favProvider.addItem(index);
                      else
                        favProvider.removeItem(index);
                    },
                    title: Text('Item ' + (index + 1).toString()),
                    trailing: (favProvider.selecctedItem.contains(index))
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border_sharp),
                  );
                }));
              },
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
