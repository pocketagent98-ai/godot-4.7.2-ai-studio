# AI bridge (MCP server)

The bridge is [`godot-mcp-runtime`](https://github.com/Erodenn/godot-mcp-runtime) —
an MIT-licensed Model Context Protocol server that lets an AI assistant drive
Godot 4.x. It is **zero-footprint**: no addon is installed into your game project,
and nothing is left behind when the AI stops.

## How to connect

1. Install [Node.js](https://nodejs.org/) v20+.
2. Copy `mcp-config.example.json` into your AI client's MCP configuration and set
   `GODOT_PATH` to the absolute path of the Godot executable you downloaded in
   `../godot/`.
3. Restart the client and ask the assistant to call `check_project`. A Godot version
   string (e.g. `4.7.2.stable`) means you are connected.

You can also install it globally instead of using `npx`:

```bash
npm install -g godot-mcp-runtime
```

```json
{
  "mcpServers": {
    "godot": {
      "command": "godot-mcp-runtime",
      "env": { "GODOT_PATH": "/path/to/godot" }
    }
  }
}
```

## What it gives the AI

- **Headless editing** — create scenes, add/remove/move nodes, set properties,
  attach and validate GDScript, connect signals. No editor window required.
- **Runtime control** — run the project, take screenshots, read the live scene tree,
  simulate keyboard/mouse input, click UI elements, and execute GDScript inside the
  running game.

## Safety flags (optional)

The server executes GDScript inside your Godot process, so it ships a static-analysis
gate. Useful environment variables:

- `GODOT_MCP_STRICT=true` — block every risky operation (best for unattended runs).
- `GODOT_MCP_DISABLE_ELICITATION=true` — skip confirmation prompts for clients that
  cannot show them.

See the upstream project's `docs/security.md` for the full rule set.
