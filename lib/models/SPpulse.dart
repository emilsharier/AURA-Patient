class SpModel {
  double _spo2, _pulseRate;

  SpModel();

  String get spo2 => _spo2.toString();
  String get pulseRate => _pulseRate.toString();

  SpModel.fromString(String list) {
    List<String> temp = list.split(',');
    this._spo2 = double.parse(temp.elementAt(1));
    this._pulseRate = double.parse(temp.elementAt(0));
  }
}