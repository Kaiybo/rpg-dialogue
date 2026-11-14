-- Test runner: lua5.1 tests/run.lua [spec-name-filter]
-- Runs every tests/*_spec.lua. Exit code 1 if anything fails.
local ROOT = arg[0]:match("^(.*)/tests/run%.lua$") or "."
package.path = ROOT .. "/tests/?.lua;" .. package.path

require("wowmock")
Loader = require("loader")

local passed, failed, current = 0, 0, ""
local failures = {}

function describe(name, fn)
  local prev = current
  current = (prev ~= "" and (prev .. " > ") or "") .. name
  fn()
  current = prev
end

function it(name, fn)
  local ok, err = pcall(fn)
  if ok then
    passed = passed + 1
  else
    failed = failed + 1
    failures[#failures + 1] = current .. " > " .. name .. "\n    " .. tostring(err)
  end
end

local function fmt(v)
  if type(v) == "string" then return string.format("%q", v) end
  return tostring(v)
end

function eq(actual, expected, msg)
  if actual ~= expected then
    error((msg and (msg .. ": ") or "") .. "expected " .. fmt(expected) .. ", got " .. fmt(actual), 2)
  end
end

function ok(v, msg)
  if not v then error(msg or "expected a true value", 2) end
end

-- Text as the player reads it: topic links (|H...|h) and their colour codes removed.
function plain(s)
  if type(s) ~= "string" then return s end
  s = s:gsub("|Hrpgdtopic:[^|]*|h(.-)|h", "%1")
  return (s:gsub("|c%x%x%x%x%x%x%x%x(.-)|r", "%1"))
end

function contains(haystack, needle, msg)
  haystack = plain(haystack)
  if type(haystack) ~= "string" or not haystack:find(needle, 1, true) then
    error((msg and (msg .. ": ") or "") .. "expected " .. fmt(haystack) .. " to contain " .. fmt(needle), 2)
  end
end

local filter = arg[1]
local specs = {}
local p = io.popen('ls "' .. ROOT .. '/tests"')
for name in p:lines() do
  if name:match("_spec%.lua$") and (not filter or name:find(filter, 1, true)) then specs[#specs + 1] = name end
end
p:close()
table.sort(specs)

for _, name in ipairs(specs) do
  local chunk, err = loadfile(ROOT .. "/tests/" .. name)
  if not chunk then
    failed = failed + 1
    failures[#failures + 1] = name .. ": " .. err
  else
    describe(name:gsub("_spec%.lua$", ""), chunk)
  end
end

for _, f in ipairs(failures) do print("FAIL " .. f) end
print(string.format("%d passed, %d failed", passed, failed))
os.exit(failed == 0 and 0 or 1)
