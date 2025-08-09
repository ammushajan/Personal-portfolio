import 'package:ammu_portfolio/resources/strings.dart';
import 'package:ammu_portfolio/core/models/header_model.dart';

//[headerList] is a list of [HeaderModel] objects that represent the headers
List<HeaderModel> headerList = [
  HeaderModel(title: Strings.homeLabel, route: '/'),
  HeaderModel(title: Strings.projectsLabel, route: '/projects'),
  HeaderModel(title: Strings.contactLabel, route: '/contact'),
];
