import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/presentation/controller/register_bloc/register_bloc.dart';
import 'package:product_app/presentation/controller/register_bloc/register_event.dart';
import 'package:product_app/presentation/controller/register_bloc/register_state.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/services/service_locator.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/enum.dart';
import 'component/compenent.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    String emailLabel = 'E-Mail';

    var passwordController = TextEditingController();
    String passwordLabel = 'Password';

    var phoneController = TextEditingController();
    String phoneLabel = 'Phone';

    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context)=>sl<RegisterBloc>(),
      child: BlocBuilder<RegisterBloc,RegisterState>(
        builder: (context,state){
          return Scaffold(
            body:  SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.02,),
                        SizedBox(height: height*0.1,),
                        Text(
                          'Register',
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: mainColor),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Name must not be empty';
                              }
                            },
                            label: 'Name',
                            prefixIcon: Icons.person),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email address must not be empty';
                              }
                              return null;
                            },
                            label: emailLabel,
                            prefixIcon: Icons.email_outlined),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password must not be empty';
                              }
                              return null;
                            },
                            label: passwordLabel,
                            prefixIcon: Icons.lock),
                        SizedBox(
                          height:height*0.1 ,
                        ),
                        ConditionalBuilder(
                            condition:
                            state.userRegisterState == RequestState.loading,
                            builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    sl<RegisterBloc>().add(
                                        UserRegisterEvent(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,));
                                  }
                                },
                                text: 'Register'),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
