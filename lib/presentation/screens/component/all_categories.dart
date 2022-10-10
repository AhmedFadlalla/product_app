import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/domain/entities/base_product_category.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';
import 'package:product_app/presentation/screens/category_products_screen.dart';
import 'package:product_app/presentation/screens/component/compenent.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enum.dart';
import '../../controller/Home/home_bloc.dart';
import '../../controller/Home/home_state.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetAllCategoriesEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {

        switch(state.categoriesDataState){
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            var categories = state.categoriesData;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 120,

                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context, index) =>buildCategoryItem(categories[index],context) ,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: categories.length),
                ),
              ),
            );
          case RequestState.error:
            return Center(child: Text(state.categoriesDataMessage));
        }


      }),
    );
  }
  Widget buildCategoryItem(BaseProductCategory model,context)=>InkWell(
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(image: NetworkImage(
          model.image,

        ),
          width: 100,
          height: 120,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 100.0,
          color: Colors.black.withOpacity(0.5),
          child: Text(
            model.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
        )
      ],
    ),
    onTap: (){
      navigateTo(context, CategoryProductsScreen(
          categoryName: model.name,
        categoryId: model.id,
      ));
    },
  );
}
