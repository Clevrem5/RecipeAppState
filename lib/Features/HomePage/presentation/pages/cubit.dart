import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import '../../../CategorieDetail/presentation/widgets/ism.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NameCubit, String>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Ism o'zgardi: $state")),
          );
        },
        child: BlocBuilder<NameCubit, String>(
          builder: (context, state) => Center(
            child: RecipeAppText(
              data: state, // NameCubit dan state olinadi
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<NameCubit>().changeName(); // Ismni o'zgartiradi
            },
            child: RecipeAppText(
              data: "ism",
              color: Colors.white,
              size: 14,
            ),
          ),
          SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {
              context.read<NameCubit>().changeName2(); // Ikkinchi ism
            },
            child: RecipeAppText(
              data: "ism2",
              color: Colors.white,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
