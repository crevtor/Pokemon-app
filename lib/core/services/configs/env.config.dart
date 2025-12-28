enum Environment { development, production }

extension EnvironmentExtension on Environment {
  static const _baseUrls = {
    Environment.production: EnvironmentConfig.liveBaseUrl,
    Environment.development: EnvironmentConfig.devBaseUrl,
  };

  String get baseUrl => _baseUrls[this]!;

  bool get isStaging => this == Environment.development;
}

class EnvironmentConfig {
  /// Update this line of code to change environments
  static Environment environment = Environment.production;

  static String get baseUrl => environment.baseUrl;

  static const liveBaseUrl = String.fromEnvironment("liveApiBaseUrl", defaultValue: "https://pokeapi.co/");

  static const devBaseUrl = String.fromEnvironment("devApiBaseUrl", defaultValue: "");
}
