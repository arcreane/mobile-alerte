//import 'package:hive/hive.dart';
//import 'package:mobilealerte/recipe.dart';
//import 'package:path_provider/path_provider.dart';
/*
class RecipeBox {
  static final RecipeBox instance = RecipeBox();
  static Box box;

  static void init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(RecipeAdapter());
    box = await Hive.openBox("recipeBox");
    var values = box.values;
    if (values == null || values.isEmpty) {
      RecipeBox.box.putAll(Map.fromIterable(recipes, key: (e) => e.key(), value: (e) => e));
    }
  }

  static final List<Recipe> recipes = [ Recipe(
    "moi",
    "idir ",
    "idir"
  ),
    Recipe(
      "idir",
      "idir",
      " idir",
    )
  ];
}*/