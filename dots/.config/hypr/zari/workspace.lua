hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*"
    },
    fullscreen_state = "0 0",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    -- Fix some dragging issues with XWayland
    no_focus = true,
})

-- # IntelliJ IDEA Menus
-- windowrulev2 = float, title:^(win.*)$

-- Workspace
hl.workspace_rule({
    workspace = "s[true]",
    gaps_in = 50,
    gaps_out = 150,
})

hl.workspace_rule({
    workspace = "special:productivity",
    gaps_in = 50,
    gaps_out = 150,
})

hl.workspace_rule({
    workspace = "special:spotify",
    gaps_in = 50,
    gaps_out = 150,
})

hl.workspace_rule({
    workspace = "special:github",
    gaps_in = 50,
    gaps_out = 150,
})

hl.workspace_rule({
    workspace = "special:tablet",
    gaps_in = 50,
    gaps_out = 150,
})

hl.workspace_rule({
    workspace = "special:pavu",
    gaps_in = 50,
    gaps_out = 150,
})

hl.workspace_rule({
    workspace = "special:files",
    gaps_in = 50,
    gaps_out = 150,
})

-- from https://wiki.hypr.land/configuring/code-snippets/#launching-programs-on-workspace-creation, modified by me

local workspace_programs = {
    ["special:productivity"] = { "super-productivity &", {} },
    ["special:spotify"]      = { "GLFW_IM_MODULE=ibus kitty --class Spotify ncmpcpp &", {} },
    ["special:github"]       = { "zen-browser --new-window https://github.com &", {} },
    ["special:tablet"]       = { "otd-gui", {} },
    ["special:pavu"]         = { "pavucontrol", {} },
    ["special:files"]        = { "nautilus", {} },
}

hl.on("workspace.created", function(ws)
    local program = workspace_programs[ws.name]
    if program == nil then
        return
    end

    args = table.insert(program[2], { workspace = ws.name })

    hl.exec_cmd(program[1], { workspace = ws.name })
end
)
