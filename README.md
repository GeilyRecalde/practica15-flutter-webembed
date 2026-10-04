# Hoja de Vida: Web + Flutter (cv_flutter_wrapper)

**Asignatura:** Desarrollo de Aplicaciones Móviles – UPEC
**Integrante:** Geily Yamilex Recalde Cuzco

## 1. Estructura del repositorio
- `web/` → HTML5, CSS3 y JS de la hoja de vida (Mobile-First)
- `cv_flutter_wrapper/` → proyecto Flutter con WebView

## 2. Capturas
(Pega aquí: web en el navegador del celular, app Flutter en el emulador, tema oscuro, botón compartir)

## 3. Cuadro comparativo: Nativo (Android Studio) vs Embebido (Flutter + WebView)
| Aspecto | Nativo Android | Web embebida en Flutter |
| --- | --- | --- |
| Base de código | Solo Android (Kotlin/Java, XML) | Una web reutilizable en Android, iOS y navegador |
| Rendimiento | Mayor: renderiza directo con widgets del sistema | Menor: carga un motor web dentro de la app |
| Experiencia de usuario | Animaciones y gestos 100 % nativos | Cercana a nativa, pero con scroll y transiciones de navegador |
| Acceso a hardware | Total | Solo mediante Flutter (compartir, etc.) |
| Mantenimiento | Actualizar requiere nueva versión de la app | Con la Opción B se actualiza sin republicar la app |
| Offline | Sí | Sí con Opción A (assets); no con Opción B |

## 4. Conclusiones
1. Se transformó la hoja de vida nativa en una web responsiva con HTML5 semántico, CSS Flexbox/Grid y JavaScript (filtros, desplegables y validación de formulario).
2. Se integró la web en Flutter con `webview_flutter`, usando controles nativos (recargar, tema, compartir), cumpliendo el enfoque de contenedor híbrido.
3. El enfoque embebido mejora la mantenibilidad y la reutilización de código entre plataformas, mientras que el nativo ofrece mejor rendimiento y acceso completo al dispositivo.

## 5. Bibliografía
- Flutter. (2025). *Flutter documentation*. https://docs.flutter.dev
- Flutter Team. (2025). *webview_flutter*. https://pub.dev/packages/webview_flutter
- Mozilla. (2025). *MDN Web Docs*. https://developer.mozilla.org/es/
