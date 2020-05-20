import 'package:aura_patient/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _patientNameController;
  GlobalKey<FormState> _formKey;
  String name;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _patientNameController = TextEditingController();
    name = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            child: _getTextBox(),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text('Fetch data'),
            onPressed: fetchData,
          ),
        ],
      ),
    );
  }

  _getTextBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: TextFormField(
        controller: _patientNameController,
        onSaved: (value) {
          name = value;
        },
        validator: (value) {
          if (value.isEmpty)
            return 'Please enter a valid name';
          else
            return null;
        },
        maxLines: null,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            hintText: 'Enter the patient\'s name'),
        cursorColor: Colors.black,
      ),
    );
  }

  fetchData() {
    bool val = _formKey.currentState.validate();
    if (val) {
      _formKey.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            name: name,
          ),
        ),
      );
    }
  }
}
