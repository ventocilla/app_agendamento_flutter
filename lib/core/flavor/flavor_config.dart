class FlavorConfig {
  FlavorConfig({
    required this.flavor,
    required this.baseurl,
    required this.appId,
    required this.restKey,
  });
  final AppFlavor flavor;
  final String baseurl;
  final String appId;
  final String restKey;
}

enum AppFlavor { dev, prd }
