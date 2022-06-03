class UserTableHelper {
  static const tableName = 'users';
  static const id = 'id';
  static const fullName = 'fullName';
  static const email = 'email';
  static const isAuthenticated = 'isAuthenticated';

  static String create() {
    return '''CREATE TABLE $tableName (
      $id TEXT PRIMARY KEY,
      $fullName TEXT NOT NULL,
      $email TEXT NOT NULL,
      $isAuthenticated INTEGER NOT NULL
      )
    ''';
  }

  static String dropTable(){
    return 'DROP TABLE IF EXISTS $tableName';
  }
}
