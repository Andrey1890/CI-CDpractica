# CI-CDpractica

## OpenCode local

OpenCode esta instalado localmente en `.tools/` y se ejecuta desde PowerShell. Las credenciales del proveedor de IA se guardan fuera del repositorio.

Desde la raiz del repositorio:

```powershell
.\opencode-dev.ps1 -Prompt "Implementa una pagina de inicio y anade pruebas. Revisa el diff antes de terminar."
```

El script:

1. Crea una rama `opencode/...`.
2. Ejecuta OpenCode con las reglas de `AGENTS.md`.
3. Comprueba el diff.
4. Pide confirmacion antes de hacer commit y push.

El push activa `.github/workflows/auditoria.yml`. El runner self-hosted debe estar registrado y online con la etiqueta `auditor`.

## Primer uso

Configura un proveedor de modelos con:

```powershell
.\.tools\opencode\opencode.cmd auth login
```

Tambien puedes abrir la interfaz interactiva:

```powershell
.\.tools\opencode\opencode.cmd
```

No guardes API keys, tokens ni archivos `.env` en Git.
