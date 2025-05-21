import 'package:flutter/material.dart';
import 'package:movies_app/CategoryDao.dart';
import 'package:movies_app/MoviesPage.dart';

import 'Categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Categories>> allCategoryShow() async {
    var categoryList = CategoryDao().allCategories();
    return categoryList;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kategoriler"),
      ),
      body: FutureBuilder<List<Categories>>(
        future: allCategoryShow(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoryList = snapshot.data;
            return ListView.builder(
              itemCount: categoryList!.length,
              itemBuilder: (context, index) {
                var category = categoryList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MoviesPage(category: category,),));
                  },
                  child: Card(
                    color: index % 2 == 0 ? Colors.blueGrey : Colors.grey,
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.category_name, style: TextStyle(color: Colors.white, fontSize: 17),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else {
            return Center();
          }
        },
      ),

    );
  }
}
