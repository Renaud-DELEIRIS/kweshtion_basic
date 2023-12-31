import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kweshtion_basic/config/app_router.dart';

class CreateViewModel extends ChangeNotifier {
  final GlobalKey<FormBuilderState> formKey;

  CreateViewModel({
    required this.formKey,
  });

  void onPost(BuildContext context) {
    // TODO Post the kwesh
    // Answer controller is a string with comma or linebreak separated answers
    // remove white spaces*
    AutoRouter.of(context).push(AuthRootRoute());
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
    Navigator.pop(context);
  }

  bool get isValid =>
      formKey.currentState != null ? formKey.currentState!.isValid : false;
}
