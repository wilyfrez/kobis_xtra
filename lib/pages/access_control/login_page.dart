import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kobis_xtra/common/Big_text.dart';
import 'package:kobis_xtra/common/custom_button.dart';
import 'package:kobis_xtra/common/theme_helper.dart';
import 'package:kobis_xtra/pages/food_pages/food_category_detail.dart';
import 'package:kobis_xtra/pages/food_pages/popular_food_detail.dart';
import 'package:kobis_xtra/pages/widgets/headericonwidget.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../common/small_text.dart';
import '../../utils/dimensions.dart';
import '../food_pages/food_category.dart';
import 'forgot_password_page.dart';
import '../home_screen/main_food_page.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => Focus.of(context).unfocus(),
        child: Scaffold(
          body: BlocConsumer <AuthCubit,AuthState> (
            listener: (context, state) {

              if (state is AuthLoginError) {
                ScaffoldMessenger.of (context)..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(state.errorMessage!),
                  ));
              }
              if (state is AuthLoginSuccess) {
                _formKey.currentState!.reset();
                Navigator.push(context, MaterialPageRoute
                  (builder: (_) => MainFoodPage()
                 ));
              }

            },
            builder: ( context, state) => _buildLoginPage(),
          ),
          )
        ),
      );


  }

Widget _buildLoginPage() {
    return Scaffold(
              backgroundColor: Colors.white,
               body: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                SizedBox(height: 60,),
               SizedBox(
               height: 150,
               child: HeaderIconWidget(), //let's create a common header widget
    ),
            SafeArea(
                child:FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
               child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                  child: Column(
                  children: [
                      BigText(text: "Welcome Back!", color: Colors.black,size: 35,),
                  SmallText( text:
                     "Let's get you something...", color: Colors.black26, size: 15,
                     ),
                const SizedBox(height: 20.0),
                 Column(
                   children: [
                 Container(
                  child: FormBuilderTextField(
                    textInputAction: TextInputAction.next,
                    name: 'email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.match(
                            context, r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]',
                            errorText: "Please enter a valid email")
                      ]),

                      decoration:
                  ThemeHelper().textInputDecoration(
                      'Email', 'Enter your email')
                ),
                  decoration : ThemeHelper().inputBoxDecorationShadow(),
               ),

                  const SizedBox(height: 30.0),
                  Container(
                    child: FormBuilderTextField(
                      name:'password',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.match(context, r'^.{6,}$',
                            errorText: "Minimum 6 Character are required.")
                      ]),
                      obscureText: true,
                      decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                    ),
                    decoration: ThemeHelper().inputBoxDecorationShadow(),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,20),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push( context, MaterialPageRoute( builder: (context) => const ForgotPasswordPage()), );
                      },
                      child: BigText( text: 'Forgot Password?', color: Colors.black54, size: Dimensions.font20,),
                      ),
                    ),
                  ],
                  ),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                       child: Text('Sign In'.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                     ),
                      LoginButton(  onPressed: () async{
                         if (_formKey.currentState!.validate()) {
                           final authCubit = BlocProvider.of<AuthCubit>(context);
                           await authCubit.login(
                             _formKey.currentState!.fields['email']!.value,
                             _formKey.currentState!.fields['password']!.value
                           );
                         }
                       },
                     ),

                     Container(
                       margin: EdgeInsets.fromLTRB(10,20,10,20),
                       child: Text.rich(
                           TextSpan(
                               children: [
                                  TextSpan(text: "Don't have an account? "),
                                 TextSpan(
                                   text: 'Create',
                                   recognizer: TapGestureRecognizer()
                                     ..onTap = (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                                     },
                                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                 ),
                               ]
                           )
                       ),
                     ),

                  ]))))])));

}


  Future<bool> _onWillPop() async{
    return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: BigText( text: 'Exit Application', color: Colors.black),
            content: SmallText( text: 'Are you sure', color: Colors.black54),
            actions: <Widget>[
              TextButton(
            onPressed:() {
                 SystemNavigator.pop();},
                      child: BigText( text: 'YES', color: Colors.red),
        ),
              TextButton(
                onPressed:() {
                  Navigator.of(context).pop();},
                child:BigText( text: 'NO', color: Colors.black54),
              ),
       ]
    ),
  )) ??false;
  }
  }


  class LoginButton extends StatelessWidget {
   final Function onPressed;

   const LoginButton ({ Key? key, required this.onPressed}) : super (key: key);

  @override
  Widget build(BuildContext context) {
      return CustomButton(
          onPressed: onPressed,
          child: BlocConsumer <AuthCubit, AuthState> (
              builder: (context, state) {
          if ( state is AuthLoginLoading) {
          return kloaderbtn;
          } else {
          return Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: BigText( text: 'SIGN IN', color: Colors.white),
          );
          }},
          listener: (context, state) {},
          ));

  }

  }







