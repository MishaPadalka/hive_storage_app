import 'package:flutter/material.dart';
import 'package:hive_storage_app/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_storage_app/models/movie_model.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  
  Hive.registerAdapter(MovieAdapter());

  await Hive.openBox<Movie>('favourite_movies');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
