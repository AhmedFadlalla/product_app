import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';
import 'package:product_app/presentation/screens/component/compenent.dart';
import 'package:product_app/presentation/screens/product_details_screen.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/enum.dart';
import '../../domain/entities/base_product_data.dart';
import '../controller/Home/home_bloc.dart';
import '../controller/Home/home_state.dart';
import 'package:iconly/iconly.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  final int categoryId;
  const CategoryProductsScreen({
    Key? key,
    required this.categoryName,
    required this.categoryId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (BuildContext context) => sl<HomeBloc>()..add(GetAllCategoryProductEvent(id: categoryId)),
      child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch(state.categoryProductDataState){
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                var products=state.categoryProductData;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(categoryName),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(IconlyBold.arrow_left),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder:(context,index)=>buildProductItem(products[index],context),
                          separatorBuilder: (context,index)=>const SizedBox(height: 8,),
                          itemCount: products.length),
                    ),
                  ),


                );
              case RequestState.error:
                return Center(child: Text(state.categoryProductDataMessage));
            }

          }
      ),

    );
  }

  Widget buildProductItem(BaseProductData model,context)=>InkWell(
    onTap: (){
      navigateTo(context,ProductDetailsScreen(productId: model.id));
    },
    child: Container(
      child:Row(
        children: [
          Image(image:
          NetworkImage(model.images[0]??model.images[1]??model.images[2]),
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),

              Text(
                "${model.price.toString()} \$",
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18
                ),
              ),

            ],
          )
        ],
      ),
    ),
  );
}
