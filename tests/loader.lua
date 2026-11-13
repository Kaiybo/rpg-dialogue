-- Loads an addon folder the way the client would: read the TOC, run each Lua file
-- with (addonName, ns). XML files are skipped (Bindings.xml is loaded by the client).
local Loader = {}

local ROOT = (arg and arg[0] and arg[0]:match("^(.*)/tests/[^/]+$")) or "."
Loader.ROOT = ROOT

function Loader.TocFiles(addon)
  local path = ROOT .. "/" .. addon .. "/" .. addon .. ".toc"
  local fh = assert(io.open(path, "r"), "missing TOC: " .. path)
  local files, meta = {}, {}
  for line in fh:lines() do
    line = line:gsub("\r", "")
    local k, v = line:match("^##%s*([%w%-_]+)%s*:%s*(.-)%s*$")
    if k then
      meta[k] = v
    elseif line:match("%S") and not line:match("^#") then
      files[#files + 1] = (line:gsub("\\", "/"):gsub("^%s+", ""):gsub("%s+$", ""))
    end
  end
  fh:close()
  return files, meta
end

-- Runs every Lua file in the addon's TOC. Returns the addon's private namespace.
function Loader.Load(addon, ns)
  ns = ns or {}
  local files = Loader.TocFiles(addon)
  for _, f in ipairs(files) do
    if f:match("%.lua$") then
      local chunk = assert(loadfile(ROOT .. "/" .. addon .. "/" .. f))
      chunk(addon, ns)
    end
  end
  return ns
end

-- Registers a content pack addon with the mock client (so the core can discover and
-- load it on demand).
function Loader.RegisterPack(addon)
  local _, meta = Loader.TocFiles(addon)
  local entry = { name = addon, meta = meta, lod = meta.LoadOnDemand == "1" }
  entry.load = function() Loader.Load(addon) end
  table.insert(Mock.state.addons, entry)
  return entry
end

-- Fresh client + core addon, logged in. Returns ns.
function Loader.Boot(opts)
  opts = opts or {}
  Mock.Reset()
  _G.RPGDialogueDB, _G.RPGDialogueCharDB, _G.RPGDialogueAPI = opts.db, opts.char, nil
  for _, pack in ipairs(opts.packs or {}) do Loader.RegisterPack(pack) end
  if opts.setup then opts.setup(Mock.state) end
  local ns = Loader.Load("RPGDialogue")
  Mock.Fire("ADDON_LOADED", "RPGDialogue")
  Mock.Fire("PLAYER_LOGIN")
  Mock.Fire("PLAYER_ENTERING_WORLD", true, false)
  Mock.RunTimers()
  return ns
end

return Loader
