import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kweshtion_basic/views/widgets/inputs/input.widget.dart';

class KweshDetailsWidget extends StatefulWidget {
  const KweshDetailsWidget({Key? key}) : super(key: key);

  @override
  _KweshDetailsWidgetState createState() => _KweshDetailsWidgetState();
}

class _KweshDetailsWidgetState extends State<KweshDetailsWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 325,
          padding: const EdgeInsets.all(16),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputWidget(
                      name: 'username',
                      labelText: 'Nom d utilisateur',
                      errorText: 'le nom d utilisateur est obligatoire',
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    InputWidget(
                      name: 'email',
                      labelText: 'E-mail',
                      errorText: 'l email est obbligatoire',
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    InputWidget(
                      name: 'password',
                      labelText: 'Mot de passe',
                      errorText: 'Mot de passe est obligatoire',
                      secure: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text('test')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
