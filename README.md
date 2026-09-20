# swi_core

The layer the two SWI apps share: `swi_dashboard` (back office) and `swi`
(field app).

```yaml
dependencies:
  swi_core:
    path: ../swi_core
```

## What is in here

| Area | What it holds |
|---|---|
| `network` | `Result`, the Dio consumer, the request runner, and the exception-to-message mapping |
| `constants` | Icons, colours, spacing, sizes, messages |
| `helpers` | Money and date formatting, navigation extensions, list maths, validators |
| `logging` | `AppLog`, silent in release |
| `widgets` | Widgets that carry no app state |

## What is not, and why

Anything that reads app configuration or app state: the Dio interceptor (auth
token, locale, navigation on 401), the API executor (it shows dialogs), the
themes, the asset paths, and the font families. Those differ per app by
design, and a package that reached for them would not be a package.

## Rules

- Nothing here imports from either app. The one-way dependency is the point.
- Nothing here logs unconditionally; `AppLog` is wrapped in `kDebugMode`.
- A widget that needs to know about theme or state takes it as a parameter, or
  reads it off the widget tree — never from a provider.
