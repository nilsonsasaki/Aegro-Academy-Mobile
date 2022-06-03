class SeedsTableHelper {
  static const tableName = 'seeds';
  static const id = 'id';
  static const name = 'name';
  static const manufacturer = 'manufacturer';
  static const manufacturedAt = 'manufacturedAt';
  static const expiresIn = 'expiresIn';
  static const createdAt = 'createdAt';
  static const userId = 'userId';
  static const lastUpdated = 'lastUpdated';
  static const wasUploaded = 'wasUploaded';

  static String createTable() {
    return '''CREATE TABLE $tableName (
      $id TEXT PRIMARY KEY,
      $name TEXT NOT NULL,
      $manufacturer TEXT NOT NULL,
      $manufacturedAt TEXT NOT NULL,
      $expiresIn TEXT NOT NULL,
      $createdAt TEXT NOT NULL,
      $userId TEXT NOT NULL,
      $lastUpdated TEXT,
      $wasUploaded INTEGER NOT NULL
      )
    ''';
  }

  static String dropTable(){
    return 'DROP TABLE IF EXISTS $tableName';
  }
}
