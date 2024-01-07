import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kweshtion_basic/constants/kwesh.constant.dart';
import 'package:kweshtion_basic/viewmodels/create.viewmodel.dart';
import 'package:kweshtion_basic/views/widgets/create/textinput.widget.dart';
import 'package:provider/provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreatePage extends StatefulWidget {
  final String? category;
  const CreatePage({
    super.key,
    this.category,
  });

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateViewModel>(
      create: (context) => CreateViewModel(
        formKey: _formKey,
      ),
      builder: (context, child) {
        final vm = Provider.of<CreateViewModel>(context);
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: FormBuilder(
                  key: _formKey,
                  initialValue: const {
                    'question': '',
                    'answers': '',
                    'days': '',
                    'anonymous': false
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Create a kweshtion",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Close button
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),

                      if (widget.category != null)
                        Text(
                          "You are about to publish in ${widget.category}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      const SizedBox(height: 20),

                      TextinputWidget(
                        name: "question",
                        required: true,
                        textInputAction: TextInputAction.next,
                        label: "Question",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.maxLength(
                            KweshConstant.QUESTION_MAX_LENGTH,
                          ),
                          FormBuilderValidators.minLength(
                            KweshConstant.QUESTION_MIN_LENGTH,
                          ),
                          (value) {
                            if (value!.endsWith("?")) return null;
                            return "Question should finish with a '?'";
                          }
                        ]),
                        autofocus: true,
                        hint: "Question",
                        maxLines: 1,
                        helperText: "Eg: What is the meaning of life?",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),

                      const SizedBox(height: 10),

                      // Text area of 6 lines for answers
                      TextinputWidget(
                        name: "answers",
                        maxLines: 6,
                        label: "Answers",
                        required: true,
                        hint:
                            "Answers (up top 6 total, separated by commas or new lines)",
                        helperText: "Eg: 42, Le voyage spatial, etc",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          (val) {
                            // Get if there is between 2 and 6 answers
                            final List<String> answers = val
                                .toString()
                                .split(RegExp(r'[\n,]'))
                                .map((e) => e.trim())
                                .where((element) => element.isNotEmpty)
                                .toList();

                            if (answers.length < 2 || answers.length > 6) {
                              return "There must be between 2 and 6 answers";
                            }
                            return null;
                          },
                          (val) {
                            // Check if there is no answer with too many characters
                            final List<String> answers = val
                                .toString()
                                .split(RegExp(r'[\n,]'))
                                .map((e) => e.trim())
                                .where((element) => element.isNotEmpty)
                                .toList();

                            for (final answer in answers) {
                              if (answer.length >
                                  KweshConstant.ANSWER_MAX_LENGTH) {
                                return "An answer can't have more than ${KweshConstant.ANSWER_MAX_LENGTH} characters";
                              }
                            }
                            return null;
                          }
                        ]),
                      ),

                      const SizedBox(height: 10),

                      TextinputWidget(
                        name: "days",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        label: "Days to vote",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.min(1),
                          FormBuilderValidators.max(31),
                        ]),
                        required: false,
                        hint: "Let empty to be infinite",
                        keyboardType: TextInputType.number,
                      ),

                      FormBuilderSwitch(
                        name: "anonymous",
                        title: const Text(
                          "Is anonymous",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        activeColor: Colors.amber.shade700,
                        subtitle: const Text(
                          "Your username wont appear on the kwesh",
                        ),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade700,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 36,
                                  vertical: 6,
                                )),
                            onPressed: vm.isValid ? () => vm.onPost() : null,
                            child: const Text("Post"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
