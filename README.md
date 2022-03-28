# <img src="csv_reader_icon.png" alt="exemple gif" width="50" />   CSV Reader

[![Build Status](https://travis-ci.com/samuel-cavalcanti/csv_reader.svg?branch=main)](https://travis-ci.com/samuel-cavalcanti/csv_reader)
[![codecov](https://codecov.io/gh/samuel-cavalcanti/csv_reader/branch/main/graph/badge.svg?token=Y6NVA8K14K)](https://codecov.io/gh/samuel-cavalcanti/csv_reader)
[![Codemagic build status](https://api.codemagic.io/apps/6240883f66f743aa32535ca4/6240883f66f743aa32535ca3/status_badge.svg)](https://codemagic.io/apps/6240883f66f743aa32535ca4/6240883f66f743aa32535ca3/latest_build)

Aplicativo Android para __APENAS__ visualizar arquivos Comma-Separated-Values (CSV).
Esse aplicativo foi criado com as finalidades
- Examinar o funcionamento do
[flutter channel](https://flutter.dev/docs/development/platform-integration/platform-channels) no android  
- Ter um aplicativo para visualizar no smart phone o arquivo gerado pelo [FindByColor](https://play.google.com/store/apps/details?id=cavalcanti.samuel.findbycolor2&hl=en_US&gl=US)
- Testar o CI/CD do [codermagic.io](https://codemagic.io/)

## Para rodar testes

```sh
flutter test
```


## Exemplo de demostração

<p align="center">
  <img src="docs/output.gif" alt="exemple gif"/>
</p>



## Descobertas

- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
Command line Application que simplifica a atualização do ícone do app, no entanto a qualidade de código desse package é muito abaixo, arquitetura quase nula, testes unitários questionáveis.

- [Flutter Provider](https://pub.dev/packages/provider)
wrapper em cima do InheritedWidget que facilitou a arquitetura do app

- [Flutter File Picker](https://pub.dev/packages/file_picker)
Código entendível,razoável arquitetura , agora possuí testes automatizados em parte do código.