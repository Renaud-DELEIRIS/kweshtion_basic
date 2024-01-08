import 'package:flutter/material.dart';
import 'package:kweshtion_basic/viewmodels/auth.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/auth/auth_provider.widget.dart';
import 'package:provider/provider.dart';

class AuthLayout extends StatelessWidget {
  // decalare a builder child
  final Function(BuildContext context, AuthViewModel authViewModel) child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Scaffold(
            body: ChangeNotifierProvider<AuthViewModel>(
              create: (context) => AuthViewModel(),
              builder: (context, _) {
                final vm = Provider.of<AuthViewModel>(context);
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 36.0,
                      left: 36,
                      bottom: 16,
                      top: 70,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthProviderWidget(),
                        child(context, vm),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            top: -80,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(99)),
                color: Colors.grey.shade700.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            left: -80,
            top: 0,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(99)),
                color: Colors.grey.shade700.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
