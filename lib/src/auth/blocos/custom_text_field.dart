import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icone;
  final String label;
  final bool isSecret;

  const CustomTextField({
    super.key,
    required this.icone,
    required this.label,
    this.isSecret = false
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isOculto = false;

  @override
  void initState() {
    super.initState();
    isOculto = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          obscureText: isOculto,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icone),
            suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isOculto = !isOculto;
                    });
                  },
                  icon: Icon(
                    isOculto ? Icons.visibility : Icons.visibility_off
                  ),
                )
              : null,
            labelText: widget.label,
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          style: const TextStyle(fontSize: 13),
        ),
    );
  }
}
