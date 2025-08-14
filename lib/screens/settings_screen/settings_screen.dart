import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yolo_trap_app/bluetooth/messages.dart';
import 'package:yolo_trap_app/caches/settings_cache.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ButtonStyle startStyle = OutlinedButton.styleFrom(
    textStyle: TextStyle(fontSize: 14, color: Colors.green[400]),
    backgroundColor: Colors.transparent,
  );

  final ButtonStyle stopStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 14, color: Colors.red[400]),
    backgroundColor: Colors.transparent,
  );

  SettingsMessage? settings;

  @override
  void initState() {
    di<SettingsCache>().getSettings().then((s) => setState(() => settings = s));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Settings"),
      ),
      body:
          settings == null
              ? Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.0),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              )
              : Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        //key: _emailFieldKey,
                        name: 'maxsessions',
                        decoration: const InputDecoration(
                          labelText: 'Max Sessions (2 - 20)',
                        ),
                        initialValue: settings!.maxSessions.toString(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          } else {
                            String source = value.trim();
                            int? intValue = int.tryParse(value);
                            if(intValue != null) {
                              if(intValue <2 || intValue > 20) {
                                return 'Please enter a value between 2 and 20';
                              }
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'minscore',
                        decoration: const InputDecoration(
                          labelText: 'Min score (0.0 - 1.0)',
                        ),
                        initialValue: settings!.minScore.toString(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          } else {
                            String source = value.trim();
                            double? doubleValue = double.tryParse(source);
                            if(doubleValue != null) {
                              if(doubleValue < 0 || doubleValue > 1.0) {
                                return 'Please enter a value between 0.0 and 1.0';
                              }
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 80),

                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: OutlinedButton(
                              style: stopStyle,
                              onPressed: () => Navigator.pop(context),
                              child:  Text('Cancel'),
                            ),
                          ),

                          Spacer(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: OutlinedButton(
                              style: startStyle,
                              onPressed: () {
                                if(_formKey.currentState?.saveAndValidate() == true) {
                                  var minScore = double.tryParse(_formKey.currentState!.value["minscore"]);
                                  var maxSessions = int.tryParse(_formKey.currentState!.value["maxsessions"]);
                                  SettingsMessage newSettings = SettingsMessage(
                                      settings!.trapName,
                                      settings!.wifiSsid,
                                      settings!.wifiPassword,
                                      settings!.wifiEnabled,
                                      maxSessions!,
                                      minScore!
                                  );
                                  di<SettingsCache>().changeSettings(newSettings);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Save'),
                            ),
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

/*MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              // Validate and save the form values
              _formKey.currentState?.saveAndValidate();
              debugPrint(_formKey.currentState?.value.toString());

              // On another side, can access all field values without saving form with instantValues
              _formKey.currentState?.validate();
              debugPrint(_formKey.currentState?.intantValue.toString());
            }
            child: const Text('Cancel'),
          ),*/
