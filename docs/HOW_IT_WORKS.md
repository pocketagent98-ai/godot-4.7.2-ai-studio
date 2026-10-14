# How it works

```
  AI assistant (MCP client)
        |  stdio (JSON-RPC)
        v
  godot-mcp-runtime  (Node.js MCP server, run via npx)
        |  spawns / attaches
        v
  Godot 4.7.2  ->  your game project
```

1. Your AI client starts the MCP server (`npx -y godot-mcp-runtime`) and passes it
   the path to the Godot executable through `GODOT_PATH`.
2. The assistant calls tools such as `create_scene`, `add_node`, `attach_script` or
   `update_property`. The server performs the edit headlessly — it writes the
   `.tscn` / `.gd` files directly, so it is fast and needs no editor window.
3. To *check its work*, the assistant calls `run_project`. The server injects a
   transient `McpBridge` autoload, launches the game, and opens a loopback-only
   socket. It can then screenshot the viewport, read the live scene tree, simulate
   input, click UI, and run GDScript against the running game.
4. When the assistant calls `stop_project` (or the game exits), the bridge is removed.
   Nothing is committed into your project.

## Why an MCP bridge and not "just a chat box"

A chat assistant alone can write code but cannot *see* the game. The bridge gives it
eyes and hands: it can look at the running game, act on it, and confirm the result.
That feedback loop — edit, run, observe, fix — is what turns "the AI wrote some
GDScript" into "the AI built a working game".

## Extending it

- Add more MCP tools by following the upstream project's guide.
- Keep gameplay assets (sprites, audio, fonts) inside `sample-game/` or your own
  project folder; the assistant can load them into nodes through the bridge.
