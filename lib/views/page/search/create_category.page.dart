import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kweshtion_basic/views/widgets/create/textinput.widget.dart';

@RoutePage()
class CreateCategoryPage extends StatelessWidget {
  CreateCategoryPage({Key? key, @QueryParam("name") this.name})
      : super(key: key);
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final String? name;
  // TODO Pass category name in pros
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "Crée votre catégorie",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            // TODO DEFAULT NAME
            "name": name ?? "",
          },
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 96,
                    child: Stack(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Todo FILE INPUT
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: const Size(0, 0),
                          ),
                          child: CircleAvatar(
                            radius: 48,
                            foregroundImage: const NetworkImage("url"),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(64),
                                  border: Border.all(
                                    width: 2,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "- No violent content",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "- No violent content",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "- No violent content",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextinputWidget(
                name: "name",
                required: true,
                textInputAction: TextInputAction.next,
                label: "Category name",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofocus: true,
                hint: "Football",
                maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => {
                      // Todo create category
                      // if echec pop context
                      // If success navigate to the category and open create kwesh
                    },
                    child: const Text("Crée la category"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
