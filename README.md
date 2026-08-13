# Lanzamiento — TEOTEC

Landing de una sola página para la formación de agentes de IA en WhatsApp.

- Un único archivo: `index.html`. CSS inline en `<style>`, sin frameworks, sin build.
- Sin tracking, sin cookies, sin popups. La única dependencia externa son las fuentes de Google Fonts.
- Mobile first: el hero (título, bajada, precio y botón) entra sin scroll desde 360×560 en adelante.

## Deploy

Es estático. Se sirve `index.html` tal cual desde la raíz. En Easypanel alcanza con
un servicio de tipo estático apuntando a este repo.

## Antes de publicar: completar los [PLACEHOLDER]

Están marcados en rojo dentro de la página para que no se escapen. Son 6:

| Dónde | Qué falta |
|---|---|
| Costos | `[PLACEHOLDER USD/mes]` — costo del VPS |
| Costos | `[PLACEHOLDER]` — cuánto se consume en créditos de la API de Claude |
| Precio | `[PLACEHOLDER]` — cuánto se cobra una implementación |
| Preguntas | `[PLACEHOLDER DÍA Y HORA]` — hasta cuándo dura el precio fundador |
| Preguntas | `[PLACEHOLDER]` — cuánto tiempo lleva |
| Preguntas | `[PLACEHOLDER]` — qué pasa si me trabo |

Buscar `PLACEHOLDER` en `index.html`. Cuando estén todos completos se puede borrar
la regla `.ph` del `<style>`, o dejarla: sin placeholders no pinta nada.

## Editar

Cada sección arranca con un comentario HTML (`<!-- HERO -->`, `<!-- PRECIO -->`, etc.)
para ubicarse rápido. Los colores y tipografías están como variables al principio
del `<style>`, en `:root`.

El link de WhatsApp aparece 4 veces (hero, precio, cierre y barra fija).
Si cambia el número o el mensaje, hay que reemplazarlo en los 4.
