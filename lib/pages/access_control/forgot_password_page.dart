import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kobis_xtra/common/theme_helper.dart';
import 'package:kobis_xtra/pages/widgets/headericonwidget.dart';
import 'package:kobis_xtra/pages/widgets/headerwidgets.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../common/Big_text.dart';
import '../../common/custom_button.dart';
import '../../common/small_text.dart';
import 'login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap: () => Focus.of(context).unfocus(),
          child: Scaffold(
            body: BlocConsumer <AuthCubit,AuthState> (
              listener: (context, state) {
                if (state is AuthForgotPasswordError) {
                  ScaffoldMessenger.of (context)..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(state.err!),
                      backgroundColor: Colors.red,
                    ));
                }
                if (state is AuthForgotPasswordSuccess) {
                  ScaffoldMessenger.of (context)..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(content: Text('Reset link has been sent to your email'),
                      backgroundColor: Colors.green,
                    ));
                  Navigator.of(context).pop();

                }
              },
              builder: ( context, state) {
                if (state is AuthDefault) {
                  return _buildForgotPasswordPage();
                }
                  else if (state is AuthForgotPasswordLoading) {
                    return loader();
                }
                  else if (state is AuthForgotPasswordSuccess) {
                     return _buildForgotPasswordPage();
                }
                  else {
                    return _buildForgotPasswordPage();
                }
              },
            ),
          )
      );


  }
Widget _buildForgotPasswordPage() {
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
                child: FormBuilder(
                  key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText( text: 'Forgot Password?', color: Colors.black, size: 30,),
                            SizedBox(height: 10,),
                        SmallText( text: 'Enter the email address associated with your account', color: Colors.black54, size: 15,),
                            SizedBox(height: 10,),
                            SmallText( text: 'We will email you a verification link to check your authenticity', color: Colors.grey),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                        Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                decoration: ThemeHelper().textInputDecoration("Email", "Enter your email"),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.match(
                                      context, r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]',
                                      errorText: "Please enter a valid email")
                                ]),

                              ),
                              decoration: ThemeHelper().inputBoxDecorationShadow(),
                            ),
                            const SizedBox(height: 40.0),
                                SendLinkButton(onPressed: () async {
                                  if(_formKey.currentState!.validate()) {
                                     final authCubit = BlocProvider.of<AuthCubit>(context);
                                     await authCubit.forgotPassword(
                                         _formKey.currentState!.fields['email']!.value);
                                  }}),
                            const SizedBox(height: 30.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "Remember your password? "),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const LoginPage()),
                                        );
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])],
                  )),
                    )
              )
                  ]
              )));
}

Widget loader() {
    return const Center( child: CircularProgressIndicator(),);
}


}

class SendLinkButton extends StatelessWidget {
  final Function onPressed;

  const SendLinkButton({ Key? key, required this.onPressed}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPressed: onPressed,
       child: Padding(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
    child:  BigText( text: 'Send Link', color: Colors.white),
    ),
    );
  }


}
