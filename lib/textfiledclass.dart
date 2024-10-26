import 'package:flutter/material.dart';

class TextFieldClass extends StatelessWidget {
  final String returnCondition1;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  const TextFieldClass({
    super.key,
    required this.returnCondition1,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return returnCondition1;
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfffedf3f5),
          prefixIcon: Icon(icon),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  final String name;

  const NameTextField({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
