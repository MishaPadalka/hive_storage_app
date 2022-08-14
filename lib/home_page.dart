import 'dart:math';
import 'package:hive_storage_app/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          Movie movie = movies[index];
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: Image.network(
              movie.imageUrl,
              fit: BoxFit.cover,
              width: 100,
            ),
            title: Text(movie.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.watch_later_sharp,
                    color: movie.addedToWatchList ? Colors.grey : Colors.red,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>_showModalBottomSheet(context: context),
      ),
    );
  }

  void _showModalBottomSheet({
    required BuildContext context,
    Movie? movie,
  }) {
    Random random = Random();
    TextEditingController nameController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();
    if (movie != null) {
      nameController.text = movie.name;
      imageUrlController.text = movie.imageUrl;
    }
    showModalBottomSheet(
        isDismissible: true,
        elevation: 5,
        context: context,
        builder: (context) =>
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(labelText: 'Movie'),
                  ),
                  TextField(
                  controller: imageUrlController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                ),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: () {
                    Movie movie = Movie(
                      id: '${random.nextInt(10000)}',
                      name: nameController.text,
                      imageUrl: imageUrlController.text,
                      addedToWatchList: false,
                    );
                    setState(() {
                      movies.add(movie);
                    });
                    Navigator.pop(context);
                  }, child: const Text('Save'),)
                ],
              ),
            )
    );
  }
}
