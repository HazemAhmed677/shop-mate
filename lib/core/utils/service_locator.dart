import "package:get_it/get_it.dart";
import "package:shop_mate/core/utils/api_class.dart";
import "package:shop_mate/features/home/data/repo/home_repo_impl.dart";
import "package:shop_mate/features/search/data/repo/search_repo_impl.dart";

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton(ApiClass());
  getIt.registerSingleton(
    HomeRepoImpl(
      apiClass: getIt.get<ApiClass>(),
    ),
  );
  getIt.registerSingleton(
    SearchRepoImpl(
      apiClass: getIt.get<ApiClass>(),
    ),
  );
}
