
class AppConfigs {
  final String apiBaseUrl;

  AppConfigs({this.apiBaseUrl});

  factory AppConfigs.fromJson(Map<String, dynamic> json) => appConfigsFromJson(json);
}

AppConfigs appConfigsFromJson(Map<String, dynamic> json) {
  return AppConfigs(apiBaseUrl: json["apiBaseUrl"] as String);
}