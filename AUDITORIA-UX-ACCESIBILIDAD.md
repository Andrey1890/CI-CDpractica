# Auditoria UX y accesibilidad

**Proyecto:** `hola mundo`
**Fecha:** 2026-09-04
**Alcance:** `hola mundo/index.html`, `hola mundo/styles.css`, `hola mundo/script.js`
**Agente:** auditor UX/accesibilidad

## Resumen

La pagina tiene una identidad visual clara, una estructura semantica simple y un comportamiento responsive bien encaminado. No se detectaron bloqueos estructurales en el HTML. Hay dos ajustes prioritarios antes de considerar la experiencia plenamente accesible: mejorar el contraste de textos pequenos y definir estados de foco visibles para futuras interacciones.

## Hallazgos

### A-01 | Contraste insuficiente en textos de acento

**Prioridad:** Alta

Los textos `.eyebrow` usan `#ff704b` sobre `#f4f0e7`. El texto blanco de `figcaption` usa `#ff704b` como fondo. Estos pares pueden quedar por debajo de WCAG 2.2 AA para texto normal y pequeno.

**Impacto UX:** Las etiquetas y la descripcion de la fotografia pueden ser dificiles de leer para personas con baja vision o en pantallas con brillo reducido.

**Recomendacion:** Oscurecer el naranja para texto pequeno o reservar el naranja actual para superficies decorativas. Validar los pares con una herramienta de contraste antes de publicar.

### A-02 | No hay estilos de foco visibles

**Prioridad:** Media

La pagina no contiene controles interactivos propios en este momento, pero el proyecto puede incorporar enlaces, botones o controles en futuras iteraciones. No existe una regla global `:focus-visible`.

**Impacto UX:** Una persona que navega con teclado podria perder la ubicacion actual cuando aparezcan elementos interactivos.

**Recomendacion:** Añadir un indicador de foco visible con `:focus-visible` y no eliminar el outline por defecto sin reemplazo equivalente.

### A-03 | Dependencia de una imagen externa

**Prioridad:** Media

El retrato se carga desde Wikimedia Commons. La pagina conserva el texto alternativo, pero si el recurso remoto falla el contenido principal pierde su señal visual.

**Impacto UX:** La experiencia puede variar por disponibilidad de red, bloqueo de terceros o cambios en la URL.

**Recomendacion:** Alojar una copia autorizada dentro del sitio y mantener el `alt` descriptivo. Conservar la atribucion correspondiente si la licencia lo exige.

### A-04 | Movimiento decorativo correctamente mitigado

**Prioridad:** Informativa

Las animaciones de entrada y hover tienen una mitigacion mediante `prefers-reduced-motion: reduce`.

**Resultado:** Buen patron de accesibilidad. Debe mantenerse en futuras animaciones.

## Fortalezas observadas

- `lang="es"`, `charset` y `viewport` estan declarados.
- Hay un unico `h1` y los bloques principales usan `h2` con `aria-labelledby`.
- La imagen tiene dimensiones declaradas, `alt` descriptivo y evita parte del desplazamiento visual.
- El layout tiene un breakpoint movil y usa medidas fluidas.
- El contenido no depende de JavaScript para mostrarse.
- El pie de pagina y los datos del jugador siguen siendo comprensibles sin la animacion.

## Novedades

- Se incorporo este informe para dejar trazabilidad de la auditoria.
- La auditoria queda separada de la futura automatizacion de configuracion.
- El sitio mantiene el diseño editorial y la adaptacion movil existentes.

## Verificacion pendiente

- Medir contraste con una herramienta WCAG 2.2 AA.
- Probar teclado, zoom al 200% y lector de pantalla.
- Probar la pagina con la imagen remota bloqueada.
- Confirmar la ejecucion del workflow cuando el runner `auditor` este registrado y online.

## Veredicto

**Aprobado con observaciones.** La pagina puede continuar a revision, pero A-01 debe resolverse antes de afirmar conformidad AA completa.
