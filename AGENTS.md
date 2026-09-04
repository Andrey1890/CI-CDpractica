# AGENTS.md

## Rol

OpenCode trabaja como agente de desarrollo local. Implementa las instrucciones del usuario en una rama propia y deja los cambios listos para la auditoria de GitHub Actions.

## Reglas

- No expongas ni leas secretos, tokens, claves privadas o archivos `.env`.
- No hagas `git push --force`, no borres ramas y no modifiques `main` directamente.
- Antes de terminar, revisa el diff y ejecuta las pruebas o comprobaciones disponibles.
- Mantén los cambios pequeños y relacionados con la instruccion recibida.
- Si falta contexto o una instruccion puede causar perdida de datos, detente y pregunta.
- El script local publica la rama; la auditoria se ejecuta en GitHub Actions cuando recibe el push.

## Futuro agente de configuracion

La automatizacion de infraestructura y configuracion se anadira como un agente separado, con permisos explicitos y revision mediante pull request. No realices cambios de infraestructura por defecto.
