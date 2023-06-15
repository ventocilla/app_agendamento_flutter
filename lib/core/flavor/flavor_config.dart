class FlavorConfig {
  final String baseurl;
  final AppFlavor flavor;
  FlavorConfig({required this.baseurl, required this.flavor});
}

enum AppFlavor { dev, prd }
