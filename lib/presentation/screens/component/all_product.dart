import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/utils/app_color.dart';
import 'package:product_app/domain/entities/base_product_data.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';
import 'package:product_app/presentation/screens/product_details_screen.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/enum.dart';
import '../../controller/Home/home_bloc.dart';
import '../../controller/Home/home_state.dart';
import 'compenent.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<HomeBloc>()..add(GetAllProductsEvent()),
      child: BlocBuilder<HomeBloc,HomeState>(
          builder: (context,state){
           switch(state.productsDataState){
             case RequestState.loading:
               return const Center(child: CircularProgressIndicator());
             case RequestState.loaded:
               var products=state.productsData;

               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                     color: lightCardColor,
                     child: GridView.count(
                       shrinkWrap: true,
                       crossAxisCount:2,
                       physics:const  NeverScrollableScrollPhysics(),
                       childAspectRatio: 1 / 1.42,
                       crossAxisSpacing: 1.0,
                       mainAxisSpacing: 1.0,
                       children: List.generate(products.length,
                               (index) =>buildProductItem(products[index], context) ),
                     )
                 ),
               );
             case RequestState.error:
               return Center(child: Text(state.productsDataMessage));
           }
          }
      ),

    );
  }

  Widget buildProductItem(BaseProductData model,context)=>InkWell(
    onTap: (){
      navigateTo(context, ProductDetailsScreen(productId: model.id));
    },
    child: Container(
      height: 100,
      color: lightScaffoldColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.images[0]),
                width: double.infinity,
                height: 190,
              ),
            ],
          ),
          Text(
            model.title,
            style:const  TextStyle(
              fontSize: 14.0,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                '${model.price} \$',
              ),
              const Spacer(),
              IconButton(
                  onPressed: (){
                  },
                  icon: const CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  )
              )
            ],
          ),

        ],
      ),
    ),
  );
}
