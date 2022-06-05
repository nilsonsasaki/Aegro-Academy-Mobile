import 'package:seeds_catalog/service/http/models/http_user_model.dart';
import 'package:seeds_catalog/ui/models/exceptions/domain_user_model.dart';

mixin HttpUserConverter {

  DomainUserModel toDomainUserModel(HttpUserModel user) {
    return DomainUserModel(
        id: user.id,
        fullName: user.fullName,
        email: user.email,
        isAuthenticated: true);
  }
}
