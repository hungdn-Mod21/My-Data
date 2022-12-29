import 'package:add_favorite/FavoriteAppUseProvider/Provider/favorite_provider.dart';
import 'package:add_favorite/FavoriteAppUseProvider/page_favorite.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class PageFavoriteUsingProvider extends StatefulWidget {
  const PageFavoriteUsingProvider({super.key});

  @override
  State<PageFavoriteUsingProvider> createState() =>
      _PageFavoriteUsingProviderState();
}

class _PageFavoriteUsingProviderState extends State<PageFavoriteUsingProvider> {
  // lấy 50 từ tiếng anh bất kỳ
  final words = nouns.take(50).toList();

  @override
  Widget build(BuildContext context) {
    // gọi và khởi tạo provider
    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
      ),
      body: ListView.builder(
        // số lượng lst
        itemCount: words.length,
        itemBuilder: ((context, index) {
          // tạo mảng chứa các từ word
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() {
          final route = MaterialPageRoute(
            builder: ((context) => FavoritePage()),
          );
          Navigator.push(context, route);
        }),
        label: Text("Favorites"),
      ),
    );
  }
}
