local rl = require('raylib')
local gui = require('raygui')

local screenWidth = 800
local screenHeight = 450

rl.InitWindow(screenWidth, screenHeight, "raygui + raylib LuaJIT Example")
rl.SetTargetFPS(60)

local buttonClicked = false

while not rl.WindowShouldClose() do
    rl.BeginDrawing()
    rl.ClearBackground({r=30, g=30, b=30, a=255})

    gui.GuiGroupBox({x=100, y=100, width=300, height=200}, "Hello raygui!")
    gui.GuiLabel({x=120, y=150, width=260, height=30}, buttonClicked and "Button was clicked!" or "Please click the button below.")
    if gui.GuiButton({x=150, y=200, width=200, height=40}, "Click Me") == 1 then
        buttonClicked = true
    end

    rl.EndDrawing()
end

rl.CloseWindow()
