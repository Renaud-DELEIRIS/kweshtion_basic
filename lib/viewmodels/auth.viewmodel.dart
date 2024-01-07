import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

  void onPost(GlobalKey<FormBuilderState> formKey) {
    // TODO Post the kwesh
    // Answer controller is a string with comma or linebreak separated answers
    // remove white spaces
    return;

    final String answers = formKey.currentState!.fields['answers']!.value;
    print(answers);
    // List<String> answers = _answerController.text
    //     .split(RegExp(r'[\n,]'))
    //     .map((e) => e.trim())
    //     .where((element) => element.isNotEmpty)
    //     .toList();
    // If answers.length < 2 ou > 6 toast error

    // if (answers.length < 2 || answers.length > 6) {
    //   // TODO Toast error
    //   return;
    // }
  }

  void onCancel(BuildContext context) {
    AutoRouter.of(context).pop();
  }
}
