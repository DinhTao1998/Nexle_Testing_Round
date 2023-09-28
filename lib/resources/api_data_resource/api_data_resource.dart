class DataResource{
  static final DataResource _dataResource = DataResource._internal();
  DataResource._internal();
  static DataResource get instance => _dataResource;

  static const String API_GET_LIST_CATEGORY = '/categories';
  static const String API_SIGN_UP = '/auth/signup';
  static const String API_SIGN_IN = '/auth/signin';

}
