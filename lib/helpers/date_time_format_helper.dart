import 'package:intl/intl.dart';

class DateTimeFormatHelper{
  const DateTimeFormatHelper._internal();
  static DateTimeFormatHelper get instance => const DateTimeFormatHelper._internal();

  DateTime ?convertStringToDateTime(String dateTime,String format){
    try{
     return DateFormat(format).parse(dateTime);
    }catch(e){
      return null;
    }
  }

  String ?convertDateTimeToString(DateTime dateTime,String format){
    try{
      return DateFormat(format).format(dateTime);
    }catch(e){
      return null;
    }
  }

  String ?changeDateTimeFormat(String dateTime,String currentFormat,String newFormat){
    try{
      return convertDateTimeToString(convertStringToDateTime(dateTime, currentFormat)!, newFormat);
    }catch(e){
      return null;
    }
  }
}