# Rick & Morty Explorer

Este example muestra cómo consumir `remote_data_kit` con una estructura por
capas:

- `app/`: configuración de la aplicación y composición de dependencias.
- `features/characters/data/`: acceso remoto y adaptación de la respuesta API.
- `features/characters/domain/`: entidad, contrato del repositorio y caso de uso.
- `features/characters/presentation/`: página y widgets de la interfaz.

La página depende del caso de uso y del contrato del repositorio, no del cliente
HTTP. Para ejecutar el example, abre esta carpeta y ejecuta `flutter run`.
