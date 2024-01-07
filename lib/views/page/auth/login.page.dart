import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kweshtion_basic/config/app_router.dart';
import 'package:kweshtion_basic/viewmodels/auth.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/auth/auth.layout.dart';
import 'package:kweshtion_basic/views/widgets/create/textinput.widget.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: (context, vm) => Center(
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              TextinputWidget(
                required: true,
                label: "Username",
                name: "username",
                maxLines: 1,
                hint: "Enter your username",
              ),
              TextinputWidget(
                required: true,
                label: "Password",
                name: "password",
                maxLines: 1,
                obscureText: true,
                hint: "Enter your password",
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: const Text("Log In"),
              ),
              // Do not have an account
              TextButton(
                  onPressed: () {
                    AutoRouter.of(context).navigate(RegisterRoute());
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    minimumSize: const Size(0, 0),
                    foregroundColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.8),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
