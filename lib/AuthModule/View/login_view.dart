import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/View/Components/auth_input_field.dart';
import 'package:high_five/AuthModule/View/Components/loginbg.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/View/inbox_view.dart';
import 'package:high_five/utill/Constants/const_color.dart';

final double height = Get.height;
final double width = Get.width;

class LoginView extends StatelessWidget {
  final AuthVM authVM = AuthVM();
  LoginView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: height * 0.45,
                  width: width * 0.8,
                  child: CustomPaint(
                    painter: LoginBGTop(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: height * 0.35,
                  width: width * 0.6,
                  child: CustomPaint(
                    painter: LoginBGBottom(),
                  ),
                ),
              ),

              ///--------------Google 3---------------///
              Positioned(
                top: height * 0.65,
                left: 1,
                right: 1,
                child: _buildGoogleSignUp(),
              ),

              // ///---------------Move To SignIn Btn 4----------------///
              // Positioned(
              //   top: height * 0.25,
              //   left: 1,
              //   right: 1,
              //   child: Align(
              //     child: authVM.isCreateNew.value
              //         ? Container(
              //             height: 50,
              //             width: 390,
              //             margin: const EdgeInsets.symmetric(horizontal: 120),
              //             decoration: BoxDecoration(
              //               borderRadius: const BorderRadius.vertical(
              //                 top: Radius.circular(10),
              //               ),
              //               color: ConstColors.primaryColor,
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: ConstColors.onPrimaryColor
              //                       .withOpacity(0.5),
              //                   blurRadius: 5,
              //                   spreadRadius: 1.5,
              //                 )
              //               ],
              //             ),
              //             alignment: Alignment.bottomCenter,
              //             padding: const EdgeInsets.only(bottom: 20),
              //             child: TextButton(
              //               onPressed: () {
              //                 authVM.isCreateNew.value = false;
              //               },
              //               child: Text(
              //                 "Sign In",
              //                 style: TextStyle(
              //                   color: ConstColors.onPrimaryColor,
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             ),
              //           )
              //         : null,
              //   ),
              // ),
              // ///---------------Create New Btn 2----------------///
              // Positioned(
              //   top: 80   + 350  ,
              //   left: 1  ,
              //   right: 1  ,
              //   child: Align(
              //     child: !authVM.isCreateNew.value
              //         ? Container(
              //             height: 50  ,
              //             width: 290  ,
              //             margin: const EdgeInsets.symmetric(horizontal: 80),
              //             decoration: BoxDecoration(
              //               borderRadius: const BorderRadius.vertical(
              //                 bottom: Radius.circular(10),
              //               ),
              //               color: ConstColors.primaryColor,
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: ConstColors.onPrimaryColor
              //                       .withOpacity(0.5),
              //                   blurRadius: 5,
              //                   spreadRadius: 1.5,
              //                 )
              //               ],
              //             ),
              //             alignment: Alignment.bottomCenter,
              //             padding: const EdgeInsets.only(bottom: 20),
              //             child: TextButton(
              //               onPressed: () {
              //                 authVM.isCreateNew.value = true;
              //               },
              //               child: Text(
              //                 "Create Account",
              //                 style: TextStyle(
              //                   color: ConstColors.onPrimaryColor,
              //                   fontSize: 18  ,
              //                   fontWeight: FontWeight.w500,
              //                 ),
              //               ),
              //             ),
              //           )
              //         : null,
              //   ),
              // ),

              // ///---------------Create Account Form 5----------------///
              // Positioned(
              //   top: 80   + 50  ,
              //   left: 1  ,
              //   right: 1  ,
              //   child: Align(
              //     child: authVM.isCreateNew.value
              //         ? _buildSignUpForm(width)
              //         : null,
              //   ),
              // ),

              // ///-----------SignIn 1--------------///
              Positioned(
                top: height * 0.2,
                left: 1,
                right: 1,
                child: _buildSignInForm(width),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildSignUpForm(double width) {
  //   return Container(
  //     height: 350,
  //     width: 390,
  //     margin: const EdgeInsets.symmetric(horizontal: 40),
  //     padding: const EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       color: ConstColors.primaryColor,
  //       boxShadow: [
  //         BoxShadow(
  //           color: ConstColors.onPrimaryColor.withOpacity(0.5),
  //           // offset: const Offset(5, 5),
  //           blurRadius: 5,
  //           spreadRadius: 1.5,
  //         )
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           'SIGN UP',
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         const SizedBox(height: 10),
  //         InputField(
  //           height: 50,
  //           width: width,
  //           inputType: TextInputType.visiblePassword,
  //           // textEditingController: TextEditingController(),
  //           labelText: 'Name',
  //         ),
  //         const SizedBox(height: 10),
  //         InputField(
  //           height: 50,
  //           width: width,
  //           inputType: TextInputType.visiblePassword,
  //           // textEditingController: TextEditingController(),
  //           labelText: 'Email',
  //         ),
  //         const SizedBox(height: 10),
  //         InputField(
  //           height: 45,
  //           width: width,
  //           isPassword: true,
  //           inputType: TextInputType.visiblePassword,
  //           // textEditingController: TextEditingController(),
  //           labelText: 'Password',
  //         ),
  //         const SizedBox(height: 10),
  //         Expanded(
  //           child: Center(
  //             child: TextButton(
  //               onPressed: () {
  //                 Get.offAll(
  //                   () => InboxView(),
  //                   transition: Transition.rightToLeft,
  //                   duration: const Duration(
  //                     milliseconds: 300,
  //                   ),
  //                 );
  //               },
  //               child: Text(
  //                 'SignUp',
  //                 style: TextStyle(
  //                   color: ConstColors.onPrimaryColor,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSignInForm(double width) {
    return Container(
      height: height * 0.4,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ConstColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: ConstColors.onPrimaryColor.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1.5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SIGN IN',
            style: TextStyle(
              color: ConstColors.onPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 35),
          InputField(
            height: 50,
            width: width,
            inputType: TextInputType.visiblePassword,
            textColor: ConstColors.onPrimaryColor,
            labelText: 'Email',
          ),
          const SizedBox(height: 30),
          InputField(
            height: 50,
            width: width,
            isPassword: true,
            inputType: TextInputType.visiblePassword,
            textColor: ConstColors.onPrimaryColor,
            iconColor: ConstColors.onPrimaryColor,
            labelText: 'Password',
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Passsword?',
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.offAll(
                    () => InboxView(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                  );
                },
                child: Text(
                  'Let\'s Start',
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGoogleSignUp() {
    return Container(
      height: 50,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ConstColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: ConstColors.onPrimaryColor.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1.5,
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          await authVM.signInWithGoogle();

          Get.off(
            () => InboxView(),
            transition: Transition.rightToLeft,
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google.png',
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 10),
            Text(
              "Google",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
