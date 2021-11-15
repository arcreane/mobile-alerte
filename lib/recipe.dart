
import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  String title;
  @HiveField(1)
  String user;
  @HiveField(2)
  String description;



  Recipe(this.title, this.user, this.description);

  String key() => title.hashCode.toString();
}