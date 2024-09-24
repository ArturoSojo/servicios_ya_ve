import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicios_ya_ve/models/core/recipe.dart';
import 'package:servicios_ya_ve/models/helper/recipe_helper.dart';
import 'package:servicios_ya_ve/views/screens/search_page.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';
import 'package:servicios_ya_ve/views/widgets/category_card.dart';
import 'package:servicios_ya_ve/views/widgets/popular_recipe_card.dart';
import 'package:servicios_ya_ve/views/widgets/recommendation_recipe_card.dart';

class ExplorePage extends StatelessWidget {
  final Recipe popularRecipe = RecipeHelper.popularRecipe;
  final List<Recipe> sweetFoodRecommendationRecipe =
      RecipeHelper.sweetFoodRecommendationRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: false,
        title: const Text('Explore Recipe',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: SvgPicture.asset('assets/icons/search.svg',
                color: Colors.white),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Category
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: 245,
            color: AppColor.primary,
            child: const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CategoryCard(
                    title: 'Saludable',
                    image: AssetImage('assets/images/healthy.jpg')),
                CategoryCard(
                    title: 'Bebida',
                    image: AssetImage('assets/images/drink.jpg')),
                CategoryCard(
                    title: 'Mariscos',
                    image: AssetImage('assets/images/seafood.jpg')),
                CategoryCard(
                    title: 'Postre',
                    image: AssetImage('assets/images/desert.jpg')),
                CategoryCard(
                    title: 'Picante',
                    image: AssetImage('assets/images/spicy.jpg')),
                CategoryCard(
                    title: 'Carne',
                    image: AssetImage('assets/images/meat.jpg')),
              ],
            ),
          ),
          // Section 2 - Popular Card
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: PopularRecipeCard(
              data: popularRecipe,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Todays sweet food to make your day happy ......',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              // Content
              SizedBox(
                height: 174,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sweetFoodRecommendationRecipe.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    return RecommendationRecipeCard(
                        data: sweetFoodRecommendationRecipe[index]);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
