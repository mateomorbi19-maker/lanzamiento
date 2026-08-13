# Lanzamiento — TEOTEC

Landing de una sola página para la formación de agentes de IA en WhatsApp.

- `index.html` es autocontenido: CSS inline y el logo embebido como data URI. Se puede
  servir solo, sin nada al lado.
- `teotec-logo.png` es el logo recortado con fondo transparente (480×122, 29 KB).
  Está en el repo como fuente editable, pero la página **no lo carga desde acá**:
  usa la copia embebida. Si lo cambiás, hay que volver a embeberlo (ver abajo).
- Sin tracking, sin cookies, sin popups. La única dependencia externa son las fuentes
  de Google Fonts.
- Mobile first: el hero entra sin scroll desde 360×560 en adelante.

## Deploy

Es estático. Se sirve `index.html` tal cual desde la raíz. En Easypanel alcanza con
un servicio de tipo estático apuntando a este repo.

## Colores

Salen del logo, muestreados del archivo original:

| Token | Valor | Dónde |
|---|---|---|
| `--bg` | `#07101F` | fondo navy |
| `--blue` | `#1B6AFF` | extremo azul del degradado |
| `--cyan` | `#00E1FD` | extremo cian, acento principal |
| `--cta` | `#1F9DFF → #00E1FD` | botones |

El azul puro del logo (`#1B6AFF`) queda en 4.1:1 sobre el fondo, por debajo del
mínimo accesible para texto chico. Por eso se usa solo en degradados, bordes y
líneas, nunca en texto. El texto acentuado va en cian.

Todo está en `:root`, al principio del `<style>`.

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
para ubicarse rápido.

El link de WhatsApp aparece 4 veces (hero, precio, cierre y barra fija).
Si cambia el número o el mensaje, hay que reemplazarlo en los 4.

### Cambiar el logo

Va embebido en la variable CSS `--logo` de `:root`, una sola vez, y se reutiliza en
el hero y en el footer. Para reemplazarlo, convertí el PNG nuevo a base64 y pegá el
resultado dentro de `url("data:image/png;base64,…")`:

```bash
base64 -w0 teotec-logo.png
```
