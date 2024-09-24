import 'package:servicios_ya_ve/views/screens/page_switcher.dart';
import 'package:flutter/material.dart';
import 'package:servicios_ya_ve/models/core/recipe.dart';
import 'package:servicios_ya_ve/models/helper/recipe_helper.dart';
import 'package:servicios_ya_ve/views/screens/bestsellers.dart';
import 'package:servicios_ya_ve/views/screens/newly_posted_page.dart';
import 'package:servicios_ya_ve/views/screens/profile_page.dart';
import 'package:servicios_ya_ve/views/screens/search_page.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';
import 'package:servicios_ya_ve/views/widgets/custom_app_bar.dart';
import 'package:servicios_ya_ve/views/widgets/dummy_search_bar.dart';
import 'package:servicios_ya_ve/views/widgets/featured_recipe_card.dart';
import 'package:servicios_ya_ve/views/widgets/recipe_tile.dart';
import 'package:servicios_ya_ve/views/widgets/recommendation_recipe_card.dart';

class HomePage extends StatelessWidget {
  final List<Recipe> featuredRecipe = RecipeHelper.featuredRecipe;
  final List<Recipe> recommendationRecipe = RecipeHelper.recommendationRecipe;
  final List<Recipe> newlyPostedRecipe = RecipeHelper.newlyPostedRecipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('ARTLEX',
            style: TextStyle(
                fontFamily: 'inter',
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        showProfilePhoto: true,
        profilePhoto: const AssetImage('assets/images/pp.jpg'),
        profilePhotoOnPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Inventario'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Usuarios'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Novedades'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Notificationes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Artlex Version 1.0.0'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Featured Recipe - Wrapper
          Container(
            height: 350,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 245,
                  color: AppColor.primary,
                ),
                // Section 1 - Content
                Column(
                  children: [
                    // Search Bar
                    DummySearchBar(
                      routeTo: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchPage()));
                      },
                    ),
                    // Delicious Today - Header
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Productos más vendidos',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'inter'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BestSellers()));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14)),
                            child: const Text('ver todo'),
                          ),
                        ],
                      ),
                    ),
                    // Best Sellers - ListView
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 220,
                      child: ListView.separated(
                        itemCount: featuredRecipe.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 16,
                          );
                        },
                        itemBuilder: (context, index) {
                          return FeaturedRecipeCard(
                              data: featuredRecipe[index]);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Section 2 - Recommendation Recipe
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(
                    'Productos de alto rendimiento.',
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
                    itemCount: recommendationRecipe.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return RecommendationRecipeCard(
                          data: recommendationRecipe[index]);
                    },
                  ),
                )
              ],
            ),
          ),
          // Section 3 - Newly Posted
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vendidos recientemente',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewlyPostedPage()));
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                      child: const Text('ver todo'),
                    ),
                  ],
                ),
                // Content
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      data: newlyPostedRecipe[index],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
