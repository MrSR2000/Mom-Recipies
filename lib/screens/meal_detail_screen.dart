import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        'Ingredients:',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final mealArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final meadId = mealArg['id'];
    final mealTitle = mealArg['title'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == meadId);
    final appBar = AppBar(
      title: Text('$mealTitle'),
    );

    Widget buildContainer(child) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: (mediaquery.size.height -
                mediaquery.padding.top -
                appBar.preferredSize.height) *
            0.25,
        width: 300,
        child: child,
      );
    }

    ;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Color.fromARGB(255, 238, 234, 196),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                      // color: Color.fromARGB(255, 238, 234, 196),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(3.0),
                      //   child: Text(
                      //     selectedMeal.steps[index],
                      //   ),
                      // ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
