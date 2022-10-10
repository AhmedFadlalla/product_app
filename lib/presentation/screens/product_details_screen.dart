import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:product_app/presentation/controller/Home/home_event.dart';
import 'package:product_app/presentation/screens/component/compenent.dart';

import '../../core/services/db_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/enum.dart';
import '../controller/Home/home_bloc.dart';
import '../controller/Home/home_state.dart';
class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({
    Key? key,
    required this.productId
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _count=1;

  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseHelper.database;
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (BuildContext context) => sl<HomeBloc>()..add(GetProductDataEvent(id: widget.productId)),
      child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch(state.productDataState){
              case RequestState.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestState.loaded:
                var product=state.productData;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(product!.title),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(IconlyBold.arrow_left),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  height: 200.0,
                                  enlargeCenterPage: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                  viewportFraction: 0.8,
                                  autoPlay: true),
                              items: product.images
                                  .map((item) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    image: DecorationImage(
                                        image: NetworkImage(item),fit: BoxFit.cover
                                    )
                                ),

                              ))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.05,),
                        const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Text(
                              "Description",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.01,),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                              product.description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.05,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Category : ${product.productCategory.name}",
                            style:const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.05,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Price : ${product.price} \$",
                            style:const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.1,),
                        Container(
                          width: double.infinity,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:Colors.grey.shade400,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed:(){

                                      _incrementCount();

                                  } ,
                                  icon: const Icon(IconlyBold.plus)
                              ),
                              Text("$_count"),
                              IconButton(
                                  onPressed:(){


                                      _decrementCount();


                                  } ,
                                  icon:  const Icon(IconlyBold.paper_negative)
                              ),

                              Text(
                                "${product.price * _count} \$",
                                style:const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.05,),
                        defaultButton(
                            function: (){
                              sl<HomeBloc>().add(
                                  AddProductToCartEvent(
                                      id: product.id,
                                      price: product.price*_count,
                                      title: product.title,
                                      description: product.description,
                                      image: product.images[0],
                                      category: product.productCategory.name));
                            },
                            text: 'Add To Cart',

                        )

                      ],
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


  void _incrementCount(){
   setState(() {
     _count++;
   });

  }
  void _decrementCount(){
     setState(() {
       _count--;
     });
  }


}
