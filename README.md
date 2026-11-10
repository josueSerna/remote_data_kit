# remote_data_kit

Paquete de Dart para facilitar el consumo de APIs REST mediante solicitudes HTTP.

## Características

- Cliente HTTP reutilizable con Dio.
- Solicitudes GET.
- Parámetros de consulta.
- Manejo de errores personalizado.
- Modelo genérico para respuestas paginadas.

## Instalación

Agrega la dependencia en el archivo `pubspec.yaml` de tu proyecto:

```yaml
dependencies:
  remote_data_kit:
    path: ../remote_data_kit
```

> Actualmente, el paquete se utiliza mediante una ruta local.

## Uso

Importa el paquete:

```dart
import 'package:remote_data_kit/remote_data_kit.dart';
```

### Crear un cliente

```dart
final client = ApiClient(
  baseUrl: 'https://rickandmortyapi.com/api/',
);
```

### Realizar una petición GET

```dart
final response = await client.get(
  'character',
  queryParameters: {
    'page': 1,
  },
);
```

### Manejar errores

```dart
try {
  final response = await client.get('character');
} on ApiException catch (error) {
  print(error.message);
  print(error.statusCode);
}
```

### Manejar respuestas paginadas

```dart
final result = PaginatedResponse<Character>.fromJson(
  response as Map<String, dynamic>,
  Character.fromJson,
);
```

`Character` es un modelo definido por el desarrollador de la aplicación.

## Ejemplo

El proyecto incluye una aplicación Flutter dentro de la carpeta `example`, que utiliza Rick and Morty API para mostrar personajes y navegar entre páginas.

Para ejecutarla:

```bash
cd example
flutter pub get
flutter run
```

## Versionamiento

El paquete utiliza versionamiento semántico:

- **Patch:** correcciones de errores.
- **Minor:** nuevas funcionalidades compatibles.
- **Major:** cambios incompatibles.

## Tecnologías

- Dart
- Flutter
- Dio

## Autor

Josué Serna
