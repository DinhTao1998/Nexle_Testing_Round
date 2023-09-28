class ClientServiceConfig{
  const ClientServiceConfig._internal();
  static const String  getBaseUrl = '$_METHOD://$_BASE_URL';
  static const int connectTimeout = 30000;
  static const int  receiveTimeout = 30000;
  static const int  sendTimeout = 30000;


  static const String _METHOD = 'http';
  static const String _BASE_URL = 'streaming.nexlesoft.com:3001';

  static bool get ssl => _METHOD == 'https'?true:false;

}