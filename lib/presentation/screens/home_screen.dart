import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/presentation/controller/Home/home_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../core/services/service_locator.dart';
import '../controller/Home/home_state.dart';
import 'cart_screen.dart';
import 'component/all_categories.dart';
import 'component/all_product.dart';
import 'component/compenent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    var height=MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context)=>sl<HomeBloc>(),
      child: BlocBuilder<HomeBloc,HomeState>(
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(
                title: const Text("Home"),
                leading: IconButton(onPressed: (){}, icon:const Icon(IconlyBold.category)),
                actions: [
                  IconButton(onPressed: (){
                    navigateTo(context, const CartScreen());
                  }, icon:const Icon(Icons.shopping_cart))
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultSearchField(
                          controller: searchController,
                          type: TextInputType.text,
                        label: "Search",
                        validator: (value){
                            if(value.isEmpty){
                              return "search must not be empty";

                            }
                            return null;
                        }, suffixIcon: IconlyLight.search,
                      ),
                      SizedBox(height: height*0.02),
                      const Text(
                          "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                        ),
                      ),
                      SizedBox(height: height*0.02),
                      const AllCategories(),
                      SizedBox(height: height*0.02),
                      const Text(
                        "Products",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      SizedBox(height: height*0.002),
                      const AllProducts()

                    ],
                  ),
                ),
              ),

            );
          }
      ),

    );
  }
}
