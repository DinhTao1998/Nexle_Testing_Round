abstract class StorageService{

  Future setValue(String name, String value);

  Future<String?>getValue(String name);

  Future removeValue(String name);

  Future clearAll();

  Future setValues (dynamic values);
}