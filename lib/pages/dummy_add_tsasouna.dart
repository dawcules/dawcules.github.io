import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../data/database.dart';

final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class DummyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                child: Text('Etusivulle'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Container(
              width: 400,
              child: FormBuilder(
                key: _fbKey,
                //autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                        labelText: 'Tsasounan nimi',
                      ),
                      //onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.minLength(context, 8),
                        FormBuilderValidators.maxLength(context, 70),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                    FormBuilderTextField(
                      name: 'year',
                      decoration: InputDecoration(
                        labelText: 'Rakennusvuosi',
                      ),
                      //onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.integer(context),
                      ]),
                      keyboardType: TextInputType.number,
                    ),
                    FormBuilderTextField(
                      name: 'county',
                      decoration: InputDecoration(
                        labelText: 'Paikkakunta',
                      ),
                      //onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                    /* FormBuilderFilterChip(
                      name: 'filter_chip',
                      decoration: InputDecoration(
                        labelText: 'Select many options',
                      ),
                      options: [
                        FormBuilderFieldOption(
                            value: 'Test', child: Text('Test')),
                        FormBuilderFieldOption(
                            value: 'Test 1', child: Text('Test 1')),
                        FormBuilderFieldOption(
                            value: 'Test 2', child: Text('Test 2')),
                        FormBuilderFieldOption(
                            value: 'Test 3', child: Text('Test 3')),
                        FormBuilderFieldOption(
                            value: 'Test 4', child: Text('Test 4')),
                      ],
                    ), */
                    /* FormBuilderChoiceChip(
                        name: 'choice_chip',
                        decoration: InputDecoration(
                          labelText: 'Select an option',
                        ),
                        options: [
                          FormBuilderFieldOption(
                              value: 'Test', child: Text('Test')),
                          FormBuilderFieldOption(
                              value: 'Test 1', child: Text('Test 1')),
                          FormBuilderFieldOption(
                              value: 'Test 2', child: Text('Test 2')),
                          FormBuilderFieldOption(
                              value: 'Test 3', child: Text('Test 3')),
                          FormBuilderFieldOption(
                              value: 'Test 4', child: Text('Test 4')),
                        ],
                      ),
                      FormBuilderColorPickerField(
                        name: 'color_picker',
                        // initialValue: Colors.yellow,
                        colorPickerType: ColorPickerType.MaterialPicker,
                        decoration: InputDecoration(labelText: 'Pick Color'),
                      ),
                      FormBuilderChipsInput(
                        decoration: InputDecoration(labelText: 'Chips'),
                        name: 'chips_test',
                        onChanged: _onChanged,
                        initialValue: [
                          Contact('Andrew', 'stock@man.com',
                              'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
                        ],
                        maxChips: 5,
                        findSuggestions: (String query) {
                          if (query.isNotEmpty) {
                            var lowercaseQuery = query.toLowerCase();
                            return contacts.where((profile) {
                              return profile.name
                                      .toLowerCase()
                                      .contains(query.toLowerCase()) ||
                                  profile.email
                                      .toLowerCase()
                                      .contains(query.toLowerCase());
                            }).toList(growable: false)
                              ..sort((a, b) => a.name
                                  .toLowerCase()
                                  .indexOf(lowercaseQuery)
                                  .compareTo(b.name
                                      .toLowerCase()
                                      .indexOf(lowercaseQuery)));
                          } else {
                            return const <Contact>[];
                          }
                        },
                        chipBuilder: (context, state, profile) {
                          return InputChip(
                            key: ObjectKey(profile),
                            label: Text(profile.name),
                            avatar: CircleAvatar(
                              backgroundImage: NetworkImage(profile.imageUrl),
                            ),
                            onDeleted: () => state.deleteChip(profile),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          );
                        },
                        suggestionBuilder: (context, state, profile) {
                          return ListTile(
                            key: ObjectKey(profile),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(profile.imageUrl),
                            ),
                            title: Text(profile.name),
                            subtitle: Text(profile.email),
                            onTap: () => state.selectSuggestion(profile),
                          );
                        },
                      ),
                      FormBuilderDateTimePicker(
                        name: 'date',
                        // onChanged: _onChanged,
                        inputType: InputType.time,
                        decoration: InputDecoration(
                          labelText: 'Appointment Time',
                        ),
                        initialTime: TimeOfDay(hour: 8, minute: 0),
                        // initialValue: DateTime.now(),
                        // enabled: true,
                      ),
                      FormBuilderDateRangePicker(
                        name: 'date_range',
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2030),
                        format: DateFormat('yyyy-MM-dd'),
                        onChanged: _onChanged,
                        decoration: InputDecoration(
                          labelText: 'Date Range',
                          helperText: 'Helper text',
                          hintText: 'Hint text',
                        ),
                      ),
                      FormBuilderSlider(
                        name: 'slider',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.min(context, 6),
                        ]),
                        onChanged: _onChanged,
                        min: 0.0,
                        max: 10.0,
                        initialValue: 7.0,
                        divisions: 20,
                        activeColor: Colors.red,
                        inactiveColor: Colors.pink[100],
                        decoration: InputDecoration(
                          labelText: 'Number of things',
                        ),
                      ),
                      FormBuilderCheckbox(
                        name: 'accept_terms',
                        initialValue: false,
                        onChanged: _onChanged,
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I have read and agree to the ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('launch url');
                                  },
                              ),
                            ],
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.requireTrue(
                            context,
                            errorText:
                                'You must accept terms and conditions to continue',
                          ),
                        ]),
                      ),
                      
                      FormBuilderDropdown(
                        name: 'gender',
                        decoration: InputDecoration(
                          labelText: 'Gender',
                        ),
                        // initialValue: 'Male',
                        allowClear: true,
                        hint: Text('Select Gender'),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        items: genderOptions
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text('$gender'),
                                ))
                            .toList(),
                      ),
                      FormBuilderTypeAhead(
                        decoration: InputDecoration(
                          labelText: 'Country',
                        ),
                        name: 'country',
                        onChanged: _onChanged,
                        itemBuilder: (context, country) {
                          return ListTile(
                            title: Text(country),
                          );
                        },
                        controller: TextEditingController(text: ''),
                        initialValue: 'Uganda',
                        suggestionsCallback: (query) {
                          if (query.isNotEmpty) {
                            var lowercaseQuery = query.toLowerCase();
                            return allCountries.where((country) {
                              return country.toLowerCase().contains(lowercaseQuery);
                            }).toList(growable: false)
                              ..sort((a, b) => a
                                  .toLowerCase()
                                  .indexOf(lowercaseQuery)
                                  .compareTo(
                                      b.toLowerCase().indexOf(lowercaseQuery)));
                          } else {
                            return allCountries;
                          }
                        },
                      ),
                      FormBuilderRadioList(
                        decoration:
                            InputDecoration(labelText: 'My chosen language'),
                        name: 'best_language',
                        onChanged: _onChanged,
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        options: ['Dart', 'Kotlin', 'Java', 'Swift', 'Objective-C']
                            .map((lang) => FormBuilderFieldOption(
                                  value: lang,
                                  child: Text('$lang'),
                                ))
                            .toList(growable: false),
                      ),
                      FormBuilderTouchSpin(
                        decoration: InputDecoration(labelText: 'Stepper'),
                        name: 'stepper',
                        initialValue: 10,
                        step: 1,
                        iconSize: 48.0,
                        addIcon: Icon(Icons.arrow_right),
                        subtractIcon: Icon(Icons.arrow_left),
                      ),
                      FormBuilderRating(
                        decoration: InputDecoration(labelText: 'Rate this form'),
                        name: 'rate',
                        iconSize: 32.0,
                        initialValue: 1.0,
                        max: 5.0,
                        onChanged: _onChanged,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            print(_formKey.currentState.value);
                          } else {
                            print("validation failed");
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Reset",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState.reset();
                        },
                      ),
                    ), */
                  ],
                ),
              ),
            ),
            MaterialButton(
              child: Text('submit'),
              onPressed: () {
                if (_fbKey.currentState.saveAndValidate()) {
                  Database().saveFormItem(
                      _fbKey.currentState.value['name'],
                      _fbKey.currentState.value['year'],
                      _fbKey.currentState.value['county']);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
