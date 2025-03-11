# Reto Seek: Flutter App

Esta aplicación móvil, desarrollada en Flutter, permite a los usuarios escanear códigos QR de manera rápida y eficiente utilizando la cámara del dispositivo. El procesamiento nativo optimiza el rendimiento, garantizando una experiencia fluida en dispositivos iOS y Android. La aplicación está diseñada para ofrecer un escaneo preciso y rápido, permitiendo a los usuarios acceder a enlaces, obtener información o realizar diversas acciones a través de los códigos QR escaneados.

- [x] **Implementación de arquitectura limpia.**
- [x] **Gestión de estado con BLoC** 
- [x] **Uso de microfrontends en un monorepo.** 
- [x] **Integración con código nativo (Android e iOS) usando Pigeon.**: Modulo Scanner QR
- [x] **Aplicación compilable para Android e iOS.** Modulo Scanner QR
- [ ] **Inclusión de pruebas unitarias**

## Funcionalidades y Mejoras Pendientes
- [ ] **Feature Authentication**
- [ ] **Desarrollo Test**
- [ ] **Despliegue automatizado**
- [ ] **Falvors**

## Requisitos previos

Asegúrate de tener las siguientes herramientas instaladas en tu máquina:

- **Flutter 3.27.4**: Si no tienes Flutter instalado, sigue las instrucciones de instalación en la [documentación oficial de Flutter](https://flutter.dev/docs/get-started/install).
- **Android Studio / Xcode**: Necesitarás Android Studio (para Android) o Xcode (para iOS) para emular o construir la aplicación.
- **Dart SDK 3.6.2**: Flutter incluye el SDK de Dart, por lo que solo necesitarás Flutter para desarrollar.

## Instalación

Sigue estos pasos para clonar el repositorio y configurar el proyecto:

1. **Clona el repositorio**:
    ```bash
    git clone https://github.com/preppuciano/reto-seek.git
    cd reto-seek
    ```

2. **Instala las dependencias**:
    Flutter utiliza `pub` para gestionar las dependencias. Ejecuta el siguiente comando para instalar todas las dependencias necesarias:
    ```bash
    flutter pub get
    ```

3. **Instala las dependencias de los modulos y packages**:
    Utiliza Melos:
    ```bash
    dart run melos bootstrap
    ```

    Esto instalará las dependencias de forma automatica de los modulos (microfront) y packages.

## Ejecución

### Para correr la app en un dispositivo/emulador:

1. **Inicia un emulador de Android** o conecta un dispositivo físico.

2. **Ejecuta la aplicación**:
    ```bash
    flutter run
    ```

    Esto lanzará la app en el emulador o en el dispositivo conectado.

### Para correr la app en un simulador de iOS (solo en macOS):

1. **Inicia un simulador de iOS** desde Xcode o ejecuta el siguiente comando:
    ```bash
    open -a Simulator
    ```

2. **Ejecuta la aplicación en el simulador**:
    ```bash
    flutter run
    ```

## Construir para producción

Para crear una versión de producción de la aplicación, usa los siguientes comandos:

### Android:
```bash
flutter build apk --release
```

## Demostración
- [Video demo IOS](https://github.com/preppuciano/reto-seek/blob/main/docs/RPReplay_Final1741693667.MP4).
- [APK android](https://github.com/preppuciano/reto-seek/blob/main/docs/app-release.apk).
