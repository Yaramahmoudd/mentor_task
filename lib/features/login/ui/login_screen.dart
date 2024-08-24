import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_task/core/helpers/spacing.dart';
import 'package:mentor_task/core/theming/colors.dart';
import 'package:mentor_task/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:mentor_task/features/login/ui/widgets/terms_and_conditions_text.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBlue,
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                ColorsManager.mainBlue,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0001,0.2 ,0.4],
            ),),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(50),
                Text(
              'Mentor Academy',
              style: TextStyles.font32WhiteRegular.copyWith(fontFamily: 'Pacifico'),
            ),
                Container(
                  margin: EdgeInsets.only(top: 60),
                  height: MediaQuery.of(context).size.height,
                  width: (double.infinity).w,
                  padding:  EdgeInsets.only(
                    top: 20.h,
                    left: 15.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      )),
                  child: Padding(
                    padding:  EdgeInsets.only(right:20.w, top: 10.h, bottom:20.h, left: 10.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              //Image.asset('assets/images/profile.png',width: 100,height: 100,),
                              Text(
                                'login',
                                style:
                                TextStyles.font35BlackRegular.copyWith(fontFamily: 'Pacifico'),
                              ),
                              verticalSpace(25),
                              const AppTextFormField(
                                hintText: 'Email',
                              ),
                              verticalSpace(18),
                              AppTextFormField(
                                hintText: 'Password',
                                isObscureText: isObscureText,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isObscureText = !isObscureText;
                                      });
                                    },
                                    child: Icon(isObscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                              ),
                              verticalSpace(18),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                'Forgot Password?',
                                style: TextStyles.font13BlueRegular,
                              )),
                              verticalSpace(24),
                              AppTextButton(
                                buttonText: 'Login',
                                textStyle: TextStyles.font20WhiteMedium,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.withOpacity(.8),
                                    ColorsManager.mainBlue,
                                    Colors.purple.withOpacity(.8),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.009,0.5 ,1],
                                ),
                                onPressed: () {},
                              ),
                              verticalSpace(18),
                              TermsAndConditionsText(),
                              verticalSpace(40),
                              DontHaveAccountText(),
                            ],
                          )
                        ],
                      ),
                    ),
                  
                ),
                      ),
              ],
            ),
          ),
        ),
      ));
  }
}
