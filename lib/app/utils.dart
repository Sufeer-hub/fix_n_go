import 'package:fixn_go/services/api_services.dart';
import 'package:fixn_go/services/database_service.dart';
import 'package:fixn_go/services/user_service.dart';

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

NavigationService get navigationService => locator<NavigationService>();
ApiService get apiservice => locator<ApiService>();
DatabaseService get databaseService => locator<DatabaseService>();
UserService get userService => locator<UserService>();
