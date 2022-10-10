import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:product_app/domain/entities/base_product_cart_data.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/enum.dart';
import '../controller/Home/home_bloc.dart';
import '../controller/Home/home_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (BuildContext context) => sl<HomeBloc>()..add(GetProductsFromCartEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch(state.productCartDataState){
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                var products=state.productCartData;
                return Scaffold(
                  appBar: AppBar(
                    title:const Text("My Cart"),
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
  Widget buildProductItem(BaseProductCartData model,context)=>Container(
    child:Row(
      children: [
        Image(image:
        NetworkImage(model.image),
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
  );
}
