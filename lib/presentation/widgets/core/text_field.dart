import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validationError,
    this.validationText = "Need add amount of funds",
    this.height,
    this.nextFocus,
    this.focus,
    this.maxLines,
    this.padding,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double? height;
  final FocusNode? nextFocus;
  final FocusNode? focus;
  final int? maxLines;
  final EdgeInsets? padding;
  final bool validationError;
  final String validationText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: padding,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSizes.radius)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                    BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: TextFormField(
                  autofocus: false,
                  focusNode: focus,
                  maxLines: maxLines,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingSmall,
                    ),
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                  controller: controller,
                  onEditingComplete: () {
                    nextFocus?.requestFocus();
                  },
                ),
              ),
            ),
            const SizedBox(width: AppSizes.paddingSmall),
            const Text(
              "EUR",
              style: TextStyle(fontSize: AppSizes.fontSizeLarge),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
          child: validationError && controller.text.isEmpty
              ? Text(
                  validationText,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
