import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:high_five/utill/Constants/const_color.dart';

class InputField extends StatelessWidget {
  final double width;
  final double height;
  final String? labelText;
  final Color hintColor;
  final TextInputType inputType;
  final VoidCallback? onCall;
  final bool isPassword;
  final String? suffixPath;
  final bool? isDense;
  final Color? textColor;
  final Color? labelColor;
  final Color? iconColor;
  final TextEditingController? textEditingController;
  const InputField({
    Key? key,
    this.width = double.infinity,
    this.height = 50,
    this.textColor,
    this.labelColor,
    this.iconColor,
    this.labelText,
    this.suffixPath,
    this.hintColor = Colors.grey,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.textEditingController,
    this.onCall,
    this.isDense = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool isPassVisibility = true.obs;

    return isPassword
        ? Obx(
            () => SizedBox(
              height: height,
              width: width,
              child: TextFormField(
                obscureText: isPassVisibility.value,
                controller: textEditingController,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor),
                decoration: InputDecoration(
                  isDense: isDense,
                  labelText: labelText,
                  labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: labelColor),
                  suffixIcon: IconButton(
                    onPressed: isPassword
                        ? () {
                            isPassVisibility.value = !isPassVisibility.value;
                          }
                        : onCall,
                    icon: isPassVisibility.value
                        ? Icon(
                            Icons.visibility,
                            color: iconColor,
                            size: 25,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: iconColor,
                            size: 20,
                          ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstColors.onPrimaryColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          )
        : suffixPath != null
            ? TextFormField(
                controller: textEditingController,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor),
                decoration: InputDecoration(
                  isDense: isDense,
                  labelText: labelText,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: labelColor,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImageIcon(
                      AssetImage(suffixPath!),
                      color: iconColor,
                      size: 10,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )
            : TextFormField(
                controller: textEditingController,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor),
                decoration: InputDecoration(
                  isDense: isDense,
                  labelText: labelText,
                  labelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: labelColor),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              );
  }
}
