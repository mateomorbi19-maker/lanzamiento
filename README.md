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

Es estático: no hay build step ni dependencias, se sirve `index.html` tal cual.

El repo trae un `Dockerfile` (nginx alpine + `nginx.conf`) porque el servicio de
Easypanel está configurado con método de build **Dockerfile**. El contenedor
escucha en el **puerto 80**, así que el servicio en Easypanel tiene que apuntar ahí.

Si en algún momento cambiás el método de build a *Static* o *Nixpacks*, el
`Dockerfile` deja de usarse y se puede borrar junto con `nginx.conf`.

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

Están marcados en rojo dentro de la página para que no se escapen. Quedan 2:

| Dónde | Qué falta |
|---|---|
| Preguntas | `[PLACEHOLDER]` — cuánto tiempo lleva |
| Preguntas | `[PLACEHOLDER]` — qué pasa si me trabo |

Ya están cargados:

- **Cierre del precio fundador:** 17 de agosto de 2026 a las 00:00. Si la fecha se
  mueve, hay que cambiar el texto y también el atributo `datetime` del `<time>`.
- **Lo que se cobra una implementación:** `$2.000 - $3.300`, en el bloque de precio.

Buscar `PLACEHOLDER` en `index.html`. Cuando estén todos completos se puede borrar
la regla `.ph` del `<style>`, o dejarla: sin placeholders no pinta nada.

## Editar

Cada sección arranca con un comentario HTML (`<!-- HERO -->`, `<!-- PRECIO -->`, etc.)
para ubicarse rápido.

El link de WhatsApp aparece 4 veces (hero, precio, cierre y barra fija).
Si cambia el número o el mensaje, hay que reemplazarlo en los 4. El mensaje
precargado va URL-encodeado: hoy es `Me gustaría ingresar a la formación`.

### Cambiar el logo

Va embebido en la variable CSS `--logo` de `:root`, una sola vez, y se reutiliza en
el hero y en el footer. Para reemplazarlo, convertí el PNG nuevo a base64 y pegá el
resultado dentro de `url("data:image/png;base64,…")`:

```bash
base64 -w0 teotec-logo.png
```
