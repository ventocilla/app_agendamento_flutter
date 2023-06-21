import 'package:app_agendamento_flutter/app.dart';
import 'package:app_agendamento_flutter/core/flavor/flavor_config.dart';

void main() {
  boostrap(FlavorConfig(
    flavor: AppFlavor.dev,
    baseurl: 'https://parseapi.back4app.com/functions',
    appId: '7dtZvj7DXFRzhcuRy5q8Y5KNTBeHJPjnKPDdB26e',
    restKey: '70dbXHQiGosPXaawxvDUYVaBudfNyrwa24M31t7Q',
  ));
}
