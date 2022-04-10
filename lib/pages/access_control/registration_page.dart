import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kobis_xtra/common/theme_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kobis_xtra/pages/widgets/headericonwidget.dart';
import 'package:kobis_xtra/utils/dimensions.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../common/Big_text.dart';
import '../../common/small_text.dart';
import '../home_screen/main_food_page.dart';

class RegistrationPage extends  StatefulWidget{
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
             SizedBox(
              height: 120,
              child: HeaderIconWidget(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Username', 'Enter your Username'),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.match(
                                  context, r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$",
                                  errorText: "Name can only be alphabets!"),
                            ]),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.match(
                                  context, r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]',
                                  errorText: "Please enter a valid email")
                            ]),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.match(context, r'^.{6,}$',
                                  errorText: "Minimum 6 Character are required.")
                            ]),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShadow(),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    SmallText( text: 'I accept all terms and conditions',size: 15, color: Colors.grey),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme
                                        .of(context)
                                        .errorColor, fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(
                              context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  40, 10, 40, 10),
                              child: BigText( text: 'REGISTER', color: Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (
                                            context) => const MainFoodPage()
                                    ),
                                        (Route<dynamic> route) => false
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        SmallText( text: 'or create account using social media', size: 15, color: Colors.grey),
                        const SizedBox(height: 25.0),
                        const SocialSignIn()
                          ]
                          ),

                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );


  }
}


  class SocialSignIn extends StatelessWidget {

  const SocialSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
  IconButton(
  onPressed: () async {
  final authCubit = BlocProvider.of<AuthCubit>(context);
  await authCubit.googleAuth();
  },
  icon: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {},
  builder: (context, state) {
  if (state is AuthGoogleLoading) {
  return const SizedBox(
  height: 20.0,
  width: 20.0,
  child: CircularProgressIndicator(
  strokeWidth: 1.5,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  ),
  );
  } else {
  return Image.asset("assets/images/KCicon.png",
    height: 38,
    width: 38,);
  }
  },
  ),
  ),
  const SizedBox(width: 15.0),
  IconButton(
  onPressed: () async {
  final authCubit = BlocProvider.of<AuthCubit>(context);
  authCubit.facebookAuth;
  },
  icon: BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {},
  builder: (context, state) {
  if (state is AuthFBLoading) {
  return const SizedBox(
  height: 20.0,
  width: 20.0,
  child: CircularProgressIndicator(
  strokeWidth: 1.5,
  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  ),
  );
  } else {
  return const Icon(
    FontAwesomeIcons.facebook,
    color: Colors.blue,
  );
  }
  },
  ),
  ),
    const SizedBox(width: 15.0),
    IconButton(
      onPressed: () async {
        final authCubit = BlocProvider.of<AuthCubit>(context);
        await authCubit.googleAuth();
      },
      icon: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthGoogleLoading) {
            return const SizedBox(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            );
          } else {
            return Image.asset("assets/images/googleicon.png",
              height: 38,
              width: 38,);
          }
        },
      ),
    ),
  ],
  );
  }
  }
