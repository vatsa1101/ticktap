import 'package:hive_flutter/hive_flutter.dart';

class LocalDb {
  static Box? data;

  static Future init() async {
    await Hive.initFlutter();
    data = await Hive.openBox("data");
  }

  static int get successfulTaps {
    return data?.get("successfulTaps") ?? 0;
  }

  static Future addSuccessfulTap() async {
    if (data != null) {
      await data!.put('successfulTaps', successfulTaps + 1);
    }
  }

  static Future clearSuccessfulTaps() async {
    if (data != null) {
      await data!.delete("successfulTaps");
    }
  }

  static Future clearData() async {
    if (data != null) {
      await data!.clear();
    }
  }
}
