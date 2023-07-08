import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldPasswordWidget extends StatefulWidget {
  const TextFormFieldPasswordWidget({
    super.key,
    this.label,
    this.hint,
    this.icon,
    this.controller,
  });
  final String? label;
  final String? hint;
  final Icon? icon;
  final TextEditingController? controller;
  // final String? Function(String? value)? validator;

  @override
  State<TextFormFieldPasswordWidget> createState() =>
      _TextFormFieldPasswordWidgetState();
}

class _TextFormFieldPasswordWidgetState
    extends State<TextFormFieldPasswordWidget> {
  bool obsecuretext = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label!,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: TextFormField(
              validator: (val) {
                if (val!.isEmpty) {
                  return 'يرجى ادخال كلمة المرور';
                }
                if (val.length < 6) {
                  return 'ستة محارف على الأقل';
                }
                return null;
              },
              controller: widget.controller,
              obscureText: obsecuretext,
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
                    borderSide: const BorderSide(width: 1)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff1ea1a7))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff1ea1a7), width: 2)),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(12),
                prefixIcon: widget.icon,
                suffixIcon: IconButton(
                  icon: Icon(
                    obsecuretext ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xff1ea1a7),
                  ),
                  onPressed: () {
                    setState(() {
                      obsecuretext = !obsecuretext;
                    });
                  },
                ),
                hintText: widget.hint,
                hintTextDirection: TextDirection.rtl,
                hintStyle: const TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
        ],
      ),
    );
  }
}


// focusedErrorBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xff1ea1a7))),
                  
