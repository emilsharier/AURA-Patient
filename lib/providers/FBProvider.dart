import 'package:aura_patient/models/SPpulse.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class FBProvider extends ChangeNotifier {
  List<SpModel> _models = [];

  double _avgSPO2 = 0.0;
  double _avgPulseRate = 0.0;

  DatabaseReference db;

  Map<dynamic, dynamic> _temp = Map<dynamic, dynamic>();

  //Getters
  List<SpModel> get models => _models;
  String get avgSPO2 => _avgSPO2.toString();
  String get avgPulseRate => _avgPulseRate.toString();

  FBProvider() {
    db = FirebaseDatabase.instance.reference();
    db.child('HR | SpO2').once().then((value) {
      _temp = value.value;
      _models.clear();
      _temp.forEach((key, value) {
        _models.add(SpModel.fromString(value));
        // print(value);
      });
      double s1 = 0, s2 = 0;
      _models.forEach((element) {
        s1 += double.parse(element.spo2);
        s2 += double.parse(element.pulseRate);
      });

      _avgSPO2 = s1 / _models.length;
      _avgPulseRate = s2 / _models.length;

      notifyListeners();
    });
  }

  fetchLatestSPO2() {
    if (_models.isEmpty)
      return 'Loading';
    else
      return _models.last.spo2;
  }

  fetchLatestPulse() {
    if (_models.isEmpty)
      return 'Loading';
    else
      return _models.last.pulseRate;
  }
}
