class Recipe {
  String title;
  String description;
  dynamic imageUrl;
  dynamic ingredients;
  dynamic ingredientsNumber;
  dynamic instructions;
  Recipe(
      { this.title = '',  this.description = '',  this.imageUrl = '', this.ingredients = '', this.ingredientsNumber = '', this.instructions = ''});
}