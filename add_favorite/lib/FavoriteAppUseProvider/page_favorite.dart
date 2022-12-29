import 'package:add_favorite/FavoriteAppUseProvider/Provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    // gọi và khởi tạo provider
    final provider = Provider.of<FavoriteProvider>(context);

    // tạo mảng chứa những từ yêu thích
    final words = provider.words;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite word"),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: ((context, index) {
          // tạo biến là phần tử trong mảng
          final word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: (() {
                // gọi ra hàm thêm/xóa yêu thích
                provider.toggleFavorite(word);
              }),
              icon: provider.isExist(word)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          );
        }),
      ),
    );
  }
}
