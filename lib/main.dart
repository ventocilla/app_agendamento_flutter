import 'package:app_agendamento_flutter/app.dart';
import 'package:app_agendamento_flutter/core/flavor/flavor_config.dart';

void main() {
  boostrap(FlavorConfig(
    flavor: AppFlavor.prd,
    baseurl: 'www.google.com.br',
    appId: '',
    restKey: '',
  ));
}
