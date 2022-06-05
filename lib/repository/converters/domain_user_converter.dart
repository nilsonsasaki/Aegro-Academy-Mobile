import 'package:seeds_catalog/data/database/models/database_user_model.dart';
import 'package:seeds_catalog/service/http/models/http_user_model.dart';
import 'package:seeds_catalog/ui/models/exceptions/domain_user_model.dart';

mixin DomainUserConverter {
  HttpUserModel toHttpUserModel(DomainUserModel user) {
    return HttpUserModel(
        id: user.id, fullName: user.fullName, email: user.email);
  }

  DatabaseUserModel toDataBaseUserModel(DomainUserModel user) {
    return DatabaseUserModel(
        id: user.id,
        fullName: user.fullName,
        email: user.email,
        isAuthenticated: user.isAuthenticated);
  }
}
