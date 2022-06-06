
abstract class UserRepository {

  Future<void> saveUser(String email);

  Future<String> getSavedUser();

  Future<void> createUser(String fullName, String email);

  Future<void> authenticateUser(String email);

}