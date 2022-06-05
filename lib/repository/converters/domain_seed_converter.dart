import 'package:seeds_catalog/service/http/models/http_seed_model.dart';
import 'package:seeds_catalog/ui/models/domain_seed_model.dart';

mixin DomainSeedConverter {

  HttpSeedModel toHttpSeedModel(DomainSeedModel seed) {
    return HttpSeedModel(id: seed.id,
        name: seed.name,
        manufacturer: seed.manufacturer,
        manufacturedAt: seed.manufacturedAt,
        expiresIn: seed.expiresIn,
        createdAt: seed.manufacturedAt,
        userId: seed.userId);
  }
}