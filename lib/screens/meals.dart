import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MeaslScreen extends StatelessWidget {
  const MeaslScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;


  void selectMeal(BuildContext context, Meal meal) {
    // Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Uhh oh... nothing here!", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,),),
          const SizedBox(height: 16,),
          Text('Try Selecting a different Category!', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),)
        ],)
        );

      if (meals.isNotEmpty) {
        content =  ListView.builder(
          itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectMeal: (meal) {selectMeal(context, meal); },)   // (Meal meal) {selectMeal(context, meal); } -> one way of doing it
       ); 
      }

    if (title == null) {
      return content;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
