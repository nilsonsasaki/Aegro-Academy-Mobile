import 'package:flutter_test/flutter_test.dart';
import 'package:seeds_catalog/service/http/http_user_service.dart';

void main(){

  const rightEmail = 'nilsonsasaki@gmail.com';

  test('test correct authentication', () async{
    final userService = HttpUserService();
    final response = await userService.authenticateUser(rightEmail);
    expect(response, true);
  });
}