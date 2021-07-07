class Contactlist {
  late String _name;
  late String _number;
  late String _releation;
  List<Contacts> _results = [];
  Contactlist.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    List<Contacts> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Contacts result = Contacts(parsedJson['contacts'][i]);
      temp.add(result);
    }
    _results = temp;
  }
  List<Contacts> get contactdata => _results;
}

class Contacts {
  late String _name;
  late String _number;
  late String _releation;
  Contacts(data) {
    _name = data['name'];
    _number = data['number'];
    _releation = data['releation'];
  }
  String get name => _name;
  String get number => _number;
  String get releation => _releation;
}
