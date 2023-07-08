import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.label,
    this.hint,
    this.onTap,
    this.icon,
    this.keyboaredtype,
    this.controller,
    this.validator,
    this.maxlines = 1,
  });
  final String? label;
  final String? hint;
  final int? maxlines;
  final Function()? onTap;

  final Icon? icon;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  // قيمة بوليانية مشان كلمة السر لا تنسى
  final TextInputType? keyboaredtype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              maxLines: maxlines,
              onTap: onTap,
              textAlign: TextAlign.start,
              validator: validator,
              controller: controller,
              keyboardType: keyboaredtype,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Color(0xff1ea1a7), width: 1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        // color: Color(0xff1ea1a7),
                        width: 1)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff1ea1a7))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff1ea1a7), width: 2)),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(12),
                prefixIcon: icon,
                //
                hintText: hint,
                hintTextDirection: TextDirection.rtl,
                hintStyle: const TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 4.0,
          // ),
        ],
      ),
    );
  }
}

// focusedErrorBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xff1ea1a7))),
