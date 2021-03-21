import 'package:flutter/material.dart';
import '../data/database.dart';

//final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class DummyForm extends StatefulWidget {
  @override
  _DummyFormState createState() => _DummyFormState();
}

class _DummyFormState extends State<DummyForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  //bool _obscurePassword;
  //TextEditingController _emailController;
  TextEditingController _nameController;
  TextEditingController _yearController;
  TextEditingController _countyController;
  TextEditingController _longController;
  TextEditingController _latController;

  @override
  void initState() {
    super.initState();
    //_obscurePassword = true;
    //_emailController = TextEditingController();
    _nameController = TextEditingController();
    _yearController = TextEditingController();
    _countyController = TextEditingController();
    _longController = TextEditingController();
    _latController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kirjaa uusi Tsasouna'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: _buildLoginForm(),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.always,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tsasounan nimi',
                  filled: true,
                  isDense: true,
                ),
                controller: _nameController,
                validator: (value) => _validateRequired(value, 'Nimi')),
            SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Paikkakunta',
                  filled: true,
                  isDense: true,
                ),
                controller: _countyController,
                validator: (value) => _validateRequired(value, 'Paikkakunta')),
            SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Valmistumisvuosi',
                  filled: true,
                  isDense: true,
                ),
                controller: _yearController,
                validator: (value) =>
                    _validateNumber(value, 'Valmistumisvuosi')),
            SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pituusaste',
                  filled: true,
                  isDense: true,
                ),
                controller: _longController,
                validator: (value) => _validateNumber(value, 'Pituusaste')),
            SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Leveysaste',
                  filled: true,
                  isDense: true,
                ),
                controller: _latController,
                validator: (value) => _validateNumber(value, 'Leveysaste')),
            SizedBox(
              height: 12,
            ),
            /* TextFormField(
              decoration: InputDecoration(
                labelText: 'Sähköpostiosoite',
                filled: true,
                isDense: true,
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: _validateEmail,
            ), */
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                child: Text('LÄHETÄ'), onPressed: _validateFormAndSubmit),
          ],
        ),
      ),
    );
  }

  String _validateRequired(String val, fieldName) {
    if (val == null || val == '') {
      return '$fieldName on pakollinen tieto';
    }
    return null;
  }

  String _validateNumber(String value, fieldName) {
    if (value == null || value == '') {
      return '$fieldName on pakollinen tieto';
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" ei ole sallittu luku';
    }
    return null;
  }

/*   String _validateEmail(String value) {
    if (value == null || value == '') {
      return 'Syötä sähköpostiosoite';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  } */

  void _validateFormAndSubmit() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState.validate()) {
      print('Form is valid');
      Database().saveFormItem(
        _nameController.text,
        _yearController.text,
        _countyController.text,
        _longController.text,
        _latController.text,
        //_emailController.text,
      );
    } else {
      // show validation errors
      // setState forces our [State] to rebuild
      setState(() {});
    }
  }
}
