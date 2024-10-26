import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:untitled12/textfiledclass.dart';
import 'Homepage.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Quick Delivery at ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'your'),
                      TextSpan(
                        text: ' Doorstep',
                        style: TextStyle(color: Color(0xFFFE5150)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),

              const NameTextField(name: 'First name'),
              TextFieldClass(
                returnCondition1: "Please enter your first name",
                controller: firstNameController,
                icon: Icons.person,
                hintText: "Type Your First Name",
              ),

              const NameTextField(name: 'Last name'),
              TextFieldClass(
                returnCondition1: "Please enter your last name",
                controller: lastNameController,
                icon: Icons.person,
                hintText: "Type Your Last Name",
              ),

              const NameTextField(name: 'Phone number'),
              TextFieldClass(
                returnCondition1: "Please enter your phone number",
                controller: phoneNumberController,
                icon: Icons.phone,
                hintText: "Type Your Phone Number",
              ),

              const NameTextField(name: 'Email'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return "Invalid email address";
                    }

                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xfffedf3f5),
                    prefixIcon: const Icon(Icons.email),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
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
                    hintText: 'Type Your email',
                  ),
                ),
              ),

              // إدخال كلمة المرور
              const NameTextField(name: 'Password'),
              TextFieldClass(
                returnCondition1: "Please enter your password",
                controller: passwordController,
                icon: Icons.lock,
                hintText: "Type Your Password",
              ),

              const SizedBox(height: 20),

              // زر التسجيل
              SizedBox(
                height: 60,
                width: 300,
                child: GradientElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    }
                  },
                  style: GradientElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF68989),
                        Color(0xFFFE5150),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
