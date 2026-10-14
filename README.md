# Godot 4.7.2 + AI Studio

A ready-to-use setup that pairs the **Godot 4.7.2 game engine** with an **AI bridge**
(Model Context Protocol server), so an AI assistant can build and drive a Godot game
the way a person would — add and move nodes, write and attach GDScript, drop in
assets, run the game, look at it, and fix what is wrong.

- **Engine:** Godot 4.7.2 stable (18 August 2026), official builds.
- **AI bridge:** [`godot-mcp-runtime`](https://github.com/Erodenn/godot-mcp-runtime) (MIT) — a
  zero-footprint MCP server. No addon is committed into your game project; it is
  injected while the AI is working and removed when it stops.

---

## What the AI can actually do here

Through the bridge an AI assistant gets tools for:

| Area | Examples |
|------|----------|
| Project | read project settings, list/search files, check the engine version |
| Scenes | create scenes, open/instance scenes, save, get the scene tree |
| Nodes | add / delete / rename / move / reparent nodes, set any property, connect signals |
| Scripts | create, read, edit and attach GDScript, validate it |
| Assets | load textures/resources into nodes, create resources |
| Run & inspect | run the project, take screenshots, read the live scene tree, simulate keys/mouse, run GDScript inside the running game |

In short: the AI writes the game **and** checks its own work by running it.

---

## Quick start

### 1. Get the engine

Either download the Godot 4.7.2 build from this repo's **Releases** page, or run a
script (it fetches the official build into `godot/`):

```bash
# Linux / macOS
bash godot/download-godot.sh
```
```powershell
# Windows (PowerShell)
./godot/download-godot.ps1
```

### 2. Install the AI bridge

You need [Node.js](https://nodejs.org/) v20 or newer. Nothing else — the bridge
runs on demand with `npx`.

Add this to your AI client's MCP config (see `ai-bridge/mcp-config.example.json`):

```json
{
  "mcpServers": {
    "godot": {
      "command": "npx",
      "args": ["-y", "godot-mcp-runtime"],
      "env": {
        "GODOT_PATH": "/absolute/path/to/Godot_v4.7.2-stable_linux.x86_64"
      }
    }
  }
}
```

Works with any MCP-capable client — Claude Code, Claude Desktop, Cursor, and others.

### 3. Point it at the sample project and ask the AI to build

Open `sample-game/` (or any Godot project). Ask the assistant to call
`check_project` — if it returns a Godot version string, you are connected.

---

## Repository layout

```
.
├── godot/                  Engine download scripts + notes
│   ├── download-godot.sh
│   └── download-godot.ps1
├── ai-bridge/              MCP server config + how the bridge works
│   ├── mcp-config.example.json
│   └── README.md
├── sample-game/            A tiny playable Godot project to experiment on
│   ├── project.godot
│   ├── main.tscn
│   └── scripts/player.gd
└── docs/
    └── HOW_IT_WORKS.md     Architecture of the engine + bridge
```

## Notes and limits

- The engine binaries are large (75 MB Linux / 83 MB Windows). They are published as
  **release assets** rather than committed to git, which keeps the repository light
  and cloneable. The download scripts fetch the exact same official files.
- The AI bridge does not replace human play-testing. It can confirm that a scene
  loads, a button responds and a script runs without errors — it cannot tell you
  whether the game is *fun*.
- Godot is licensed under the MIT License. The AI bridge (`godot-mcp-runtime`) is
  also MIT. See `LICENSE` and each upstream project for details.
