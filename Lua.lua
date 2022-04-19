local start = tick()

if Loaded then return end 

--getgenv().identifyexecutor = function() return "Shitsploit" end

do -- UI Library.
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LunaaX0390/catxskakdka/main/ui.lua"))()
end

assert(library.AddTab, "The UI Library failed initialisation.\nPlease contact a Developer.")

--local EspLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidMasterX/scripts/main/esp_library.lua"))()
local EspLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/LunaaX0390/catxskakdka/main/esp.lua"))()
-- small fix to something 
EspLibrary.settings.enabled = false 
-- UId
local AimbotTab = library:AddTab("Legit")
local VisualsTab = library:AddTab("Render")
local WeaponsTab = library:AddTab("Mod")
local MiscTab = library:AddTab("Self")
local SettingsTab = library:AddTab("Settings")
local CreditsTab = library:AddTab("Info")

-- UI Columns (I hate the columns jan can kys) how many columns hmm
local AimbotColumn = AimbotTab:AddColumn()
local VisualsColumn = VisualsTab:AddColumn()
local VIsualsColumn2 = VisualsTab:AddColumn()
local WeaponsColumn = WeaponsTab:AddColumn()
local WeaponsColumn2 = WeaponsTab:AddColumn()
local MiscColumn = MiscTab:AddColumn()
local Misc2 = MiscTab:AddColumn()
local SettingsColumn = SettingsTab:AddColumn()
local CreditsColumn = CreditsTab:AddColumn()


-- UI Sections (I fucking hate this too)
local AimbotSection = AimbotColumn:AddSection("Aimbot & Slient")
local ESPSection = VisualsColumn:AddSection("ESP & Render")
local LightingSettings = VIsualsColumn2:AddSection("Worlds Self")
local Crosshair = VIsualsColumn2:AddSection("Crosshair Settings")
local WeaponsSection = WeaponsColumn:AddSection("Weapon Mods")
local KnifeAura = WeaponsColumn2:AddSection("Knife Aura")
local Grenades = WeaponsColumn2:AddSection("Grenades Mod")
local WeaponModel = WeaponsColumn:AddSection("Weapon Modle")
local MiscSection = MiscColumn:AddSection("Misc")
local SettingsSection = SettingsColumn:AddSection("Settings")
local CreditsSection = CreditsColumn:AddSection("Creater")
local CreditsSection2 = CreditsColumn:AddSection("Special Credits")
local CreditsSection3 = CreditsColumn:AddSection("UI Library")
local CreditsSection4 = CreditsColumn:AddSection("Discord Invite")
local createConfigs = SettingsColumn:AddSection("Create Configs")
local LoadConfigs = SettingsColumn:AddSection("Load Configs")
local LibrarySettings = SettingsColumn:AddSection("UI Settings")

Grenades:AddToggle({
    text = "Grenade TP",
    flag = "GrenadeTP",
}):AddSlider({
    text = "Blow Up Time",
    flag = "GrenadeBlowUpTime",
    min = 0,
    max = 5,
    float = .002,
})

MiscSection:AddToggle({
    text = "Bunny Hop",
    flag = "BunnyHop",
}):AddSlider({
    text = "Bunny Hop Speed",
    flag = "BunnyHopSpeed",
    min = 4,
    max = 70,
})

CreditsSection4:AddLabel("Nope Discord Links")
CreditsSection4:AddButton({
    text = "Copy Invite",
    callback = function()
        setclipboard("Nope Discord Links")
    end,
})

local Lighting = game:GetService("Lighting")
local OldBrightness = Lighting.Brightness
local OldAmbience = Lighting.Ambient


WeaponModel:AddToggle({
    text = "Rainbow Gun",
    flag = "RainbowGun",
    callback = function(value)
        library.flags.RainbowGun = value
    end,
})
WeaponModel:AddToggle({
    text = "Gun Color [Ignore Rbow]",
    flag = "GunColorOn",
    callback = function(value)
        library.flags.GunColorOn = value
    end,
})
WeaponModel:AddColor({
    text = "Gun Color",
    flag = "GunColor",
    callback = function(value)
        library.flags.GunColor = value
    end,
})
WeaponModel:AddToggle({
    text = "Weapon Transparency",
    flag = "WeaponTransparency",
    callback = function(value)
        library.flags.WeaponTransparency = value
    end,
})
WeaponModel:AddSlider({
    text = "Weapon Transparency",
    flag = "WeaponTransparencyValue",
    callback = function(value)
        library.flags.WeaponTransparencyValue = value
    end,
    min = 0,
    max = 1,
    float = 0.001,
})
WeaponModel:AddToggle({
    text = "Weapon Material On",
    flag = "WeaponMaterial",
    callback = function(value)
        library.flags.WeaponMaterial = value
    end,
})
WeaponModel:AddList({
    text = "Weapon Material",
    flag = "WeaponMaterialValue",
    values = {
        "Plastic",
        "Wood",
        "Slate",
        "Concrete",
        "CorrodedMetal",
        "DiamondPlate",
        "Foil",
        "Grass",
        "Ice",
        "Marble",
        "Granite",
        "Brick",
        "Pebble",
        "Sand",
        "Fabric",
        "SmoothPlastic",
        "Metal",
        "WoodPlanks",
        "Cobblestone",
        "Neon",
        "Glass",
        "ForceField",
    },
    callback = function(value)
        library.flags.WeaponMaterialValue = value
    end,
})


LightingSettings:AddToggle({
    text = "FullBright",
    flag = "FullBright",
    callback = function(value) library.flags.BrightnessOn = value end,
})

LightingSettings:AddToggle({
    text = 'Disco Mode',
    flag = 'RainbowAmbience',
    callback = function(value) library.flags.RainbowAmbience = value end,
})

LightingSettings:AddToggle({
    text = "Ambience",
    flag = "Ambience",
    callback = function(value) library.flags.Ambience = value end,
})
LightingSettings:AddColor({
    text = "Ambience Color",
    flag = "AmbienceColor",
    callback = function(value)
        if library.flags.Ambience then
            Lighting.Ambient = library.flags.AmbienceColor
        end
    end,
})

LibrarySettings:AddColor({
    text = "Accent Color",
    flag = "Menu Accent Color",
    callback = function(value)
        library.flags["Menu Accent Color"] = value
    end,
})

LoadConfigs:AddList({
    text = "Configs",
    skipflag = true,
    value = "",
    flag = "Config List",
    values = library:GetConfigs()
})
createConfigs:AddBox({text = "Config Name", skipflag = true});
createConfigs:AddButton({
    text = "Create",
    callback = function()
        library:GetConfigs()
        writefile(library.foldername .. "/" .. library.flags['Config Name'] .. library.fileext , "{}")
        library.options['Config List']:AddValue(library.flags['Config Name'])
        library:SaveConfig(library.flags['Config List'])
    end,
})
LoadConfigs:AddButton({
    text = "Load",
    callback = function()
        library:LoadConfig(library.flags['Config List'])
    end,
})
WeaponsSection:AddToggle({
    text = "No Gun Animations",
    flag = "NoAnim",
    callback = function(value) library.flags.NoAnim = value end
})
LoadConfigs:AddButton({
    text = "Save",
    callback = function()
        library:SaveConfig(library.flags['Config List'])
    end,
})
LoadConfigs:AddButton({
    text = "Delete",
    callback = function()
        delfile(library.foldername .. "/" .. library.flags['Config List'] .. library.fileext)
    end,
})
LoadConfigs:AddButton({
    text = "Set Default",
    callback = function()
        library:GetConfigs()
        writefile(library.foldername .. "/" .. "default" .. library.fileext , "{}")
        library.options['Config List']:AddValue("default")
        library:SaveConfig("default")
    end,
})

WeaponsSection:AddToggle({
    text = "No Gun Bob",
    flag = "NoGunBob",
    callback = function(value)
        library.flags.NoGunBob = value
    end,
})

MiscSection:AddToggle({
    text = "Custom Walkspeed",
    flag = "WalkspeedOn",
    callback = function(value)
        library.flags.WalkspeedOn = value
    end, 
}):AddSlider({
    text = "Walkspeed",
    flag = "Walkspeed",
    min = 10,
    max = 70,
    callback = function(value)
        library.flags.Walkspeed = value
    end, 
})

MiscSection:AddToggle({
    text = "Custom Jump Power",
    flag = "JumpPowerOn",
    callback = function(value)
        library.flags.JumpPowerOn = value
    end, 
}):AddSlider({
    text = "JumpPower",
    flag = "JumpPower",
    min = 2,
    max = 80,
    callback = function(value)
        library.flags.JumpPower = value
    end,
})


MiscSection:AddToggle({
    text = "No Fall Damage",
    flag = "NoFallDamage",
    callback = function(value)
        library.flags.NoFallDamage = value
    end,
})

MiscSection:AddToggle({
    text = "Kill Say",
    flag = "KillSay",
})
MiscSection:AddBox({
    text = "Kill Say Message",
    flag = "KillSayMsg",
    value = "Shows: msg..playername"
})

MiscSection:AddToggle({
    text = "Hitbox Extender",
    flag = "HitboxExtender",
}):AddSlider({
    text = "Hitbox Extender",
    flag = "HitboxExtenderValue",
    min = 0,
    max = 5,
    callback = function(value)
        library.flags.HitboxExtenderValue = value
    end,
})

WeaponsSection:AddToggle({
    text = "Spread Modifier",
    flag = "SpreadReduce",
    callback = function(value)
        library.flags.SpreadReduce = value
    end,
}):AddSlider({
    text = "Spread %",
    flag = "SpreadReduceValue",
    min = 0,
    max = 1,
    float = 0.001,
})

WeaponsSection:AddToggle({
    text = "Enable Recoil",
    flag = "RecoilOn",
    callback = function(value)
        library.flags.RecoilOn = value
    end,
})
WeaponsSection:AddToggle({
    text = "Custom Reload Speed",
    flag = "CustomReloadSpeed",
    callback = function(value) CustomReloadSpeed = value end,
})
WeaponsSection:AddToggle({
    text = "Custom Firerate",
    flag = "CustomFirerate",
    callback = function(value) CustomFirerate = value end,  
})
WeaponsSection:AddSlider({
    text = "Recoil %",
    flag = "NoRecoil",
    min = 0,
    max = 1,
    float = .001,
    callback = function(value)
        library.flags.NoRecoil = value
    end,
})
WeaponsSection:AddSlider({
    text = "Reload Speed",
    flag = "ReloadSpeed",
    min = 0,
    max = 1,
    float = .001,
    callback = function(value)
        library.flags.ReloadSpeed = value
    end,
})

WeaponsSection:AddSlider({
    text = "Firerate addition",
    flag = "FirerateAdition",
    min = 0,
    max = 2000, -- why would you even go to 2000? 
    callback = function(value)
        library.flags.FirerateAdition = value
    end,
})


KnifeAura:AddToggle({
    text = "Enabled",
    flag = "KnifeAura",
}):AddSlider({
    text = "Distance",
    flag = "KnifeAuraDistance",
    min = 1,
    max = 25,
})

KnifeAura:AddToggle({
    text = "Held Only",
    flag = "KnifeAuraHeld",
})

CreditsSection:AddLabel("Developed By : ! Luna#9115")
CreditsSection2:AddLabel("Obfuscated By : Boronide")
CreditsSection3:AddLabel("UI: From GITHUB")

ESPSection:AddToggle({
    text = "Enabled",
    state = true,
    callback = function(state)
        EspLibrary.settings.enabled = state
    end
}):AddSlider({
    text = "Refresh Rate",
    min = 0,
    max = 1000,
    value = 5,
    suffix = "ms",
    callback = function(state)
        EspLibrary.settings.refreshrate = state
    end
})

ESPSection:AddToggle({
    text = "Team Check",
    state = false,
    callback = function(state)
        EspLibrary.settings.teamcheck = state
    end
})

ESPSection:AddToggle({
    text = "Team Color",
    state = true,
    callback = function(state)
        EspLibrary.settings.teamcolor = state
    end
})

ESPSection:AddToggle({
    text = "Names",
    state = true,
    callback = function(state)
        EspLibrary.settings.names = state
    end
}):AddColor({
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.namescolor = state
    end
})


ESPSection:AddToggle({
    text = "Names Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.namesoutline = state
    end
})

ESPSection:AddToggle({
    text = "Distance",
    state = true,
    callback = function(state)
        EspLibrary.settings.distance = state
    end
}):AddColor({
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.distancecolor = state
    end
})

ESPSection:AddToggle({
    text = "Distance Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.distanceoutline = state
    end
})

ESPSection:AddToggle({
    text = "Boxes",
    state = true,
    callback = function(state)
        EspLibrary.settings.boxes = state
    end
}):AddColor({
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.boxescolor = state
    end
})

ESPSection:AddToggle({
    text = "Boxes Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.boxesoutline = state
    end
})

ESPSection:AddToggle({
    text = "Boxes Fill",
    state = false,
    callback = function(state)
        EspLibrary.settings.boxesfill = state
    end
}):AddColor({
    color = Color3.new(1, 1, 1),
    trans = 0.5,
    flag = "boxesfillclr",
    callback = function(state)
        EspLibrary.settings.boxesfillcolor = state
        EspLibrary.settings.boxesfilltrans = library.flags["boxesfillclr Transparency"]
    end
})

local Healthbars = ESPSection:AddToggle({
    text = "Healthbars",
    state = false,
    callback = function(state)
        EspLibrary.settings.healthbars = state
    end
})

Healthbars:AddColor({
    color = Color3.new(0, 1, 0),
    callback = function(state)
        EspLibrary.settings.healthbarscolor = state
    end
})

Healthbars:AddSlider({
    text = "X Offset",
    min = 0,
    max = 10,
    value = 2,
    callback = function(state)
        EspLibrary.settings.healthbarsoffset = state
    end
})

ESPSection:AddToggle({
    text = "Healthbars Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.healthbarsoutline = state
    end
})

local Tracers = ESPSection:AddToggle({
    text = "Tracers",
    state = false,
    callback = function(state)
        EspLibrary.settings.tracers = state
    end
})

Tracers:AddColor({
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.tracerscolor = state
    end
})

Tracers:AddList({
    values = { "Top", "Left", "Right", "Bottom", "Center", "Mouse" },
    value = "Bottom",
    callback = function(state)
        EspLibrary.settings.tracersorigin = state
    end
})

ESPSection:AddList({
    text = "Text Font",
    values = { "UI", "System", "Plex", "Monospace" },
    value = "UI",
    callback = function(state)
        EspLibrary.settings.textfont = Drawing.Fonts[state]
    end
})

ESPSection:AddSlider({
    text = "Text Font Size",
    min = 13,
    max = 18,
    value = 18,
    suffix = "px",
    callback = function(state)
        EspLibrary.settings.textsize = state
    end
})

Crosshair:AddToggle({
    text = "Enabled",
    flag = "crosshairOn",
    callback = function(value)
        library.flags.crosshairOn = value
    end,
})
Crosshair:AddSlider({
    text = "Size",
    flag = "crosshairSize",
    min = 1,
    max = 50,
    callback = function(value)
        library.flags.crosshairSize = value
    end,
})
Crosshair:AddSlider({
    text = "Transparency",
    flag = "crosshairTransparency",
    min = 0,
    max = 1,
    float = .1,
    callback = function(value)
        library.flags.crosshairTransparency = value
    end,
})


Crosshair:AddColor({
    text = "Color",
    flag = "crosshairColor",
    callback = function(value)
        library.flags.crosshairColor = value
    end,
})

SettingsSection:AddBind({
    text = "Toggle UI",
    key = "RightShift",
    callback = function() library:Close() end,
})

AimbotSection:AddToggle({
    text = "Enabled",
    flag = "AimbotOn",
    callback = function(value)
        library.flags.AimbotOn = value
    end,
})

AimbotSection:AddList({
    text = "Aimbot Mode",
    flag = "AimbotMode",
    values = {
        "Silent",
        "Mouse",
    },
})
AimbotSection:AddSlider({
    text = "Silent Aim Headshot %",
    flag = "SilentAimHeadshotChance",
    min = 0,
    max = 100,
})

AimbotSection:AddToggle({
    text = "Visible Check",
    flag = "VisibleCheck",
    callback = function(value)
        library.flags.VisibleCheck = value
    end,
})
AimbotSection:AddToggle({
    text = "Highlight Target",
    flag = "HighlightTarget",
    callback = function(value)
        EspLibrary.settings.aimtarget_on = value
    end,
}):AddColor({
    flag = "aimtarget_color",
    callback = function(value)
        EspLibrary.settings.aimtarget_color = value
    end,
})

AimbotSection:AddToggle({
    text = "Show FOV",
    flag = "ShowFOV",
    callback = function(value)
        library.flags.ShowFOV = value
    end,
})
AimbotSection:AddToggle({
    text = "FOV Follow Barrel",
    flag = "FOVFollowBarrel",
    callback = function(value)
        library.flags.FOVFollowBarrel = value
    end,
})
AimbotSection:AddSlider({
    text = "FOV",
    flag = "FOV",
    min = 5,
    max = 600,
    callback = function(value)
        library.flags.FOV = value
    end,
})
AimbotSection:AddSlider({
    text = "FOV Transparency",
    flag = "FOVTransparency",
    min = 0,
    max = 1,
    float = .001,
    callback = function(value)
        library.flags.FOVTransparency = value
    end,
})
AimbotSection:AddSlider({
    text = "FOV Lines",
    flag = "FOVRadius",
    min = 4,
    max = 60,
    value = 15,
    callback = function(value)
        library.flags.FOVRadius = value
    end,
})
library.flags.FOVRadius = 15
AimbotSection:AddSlider({
    text = "FOV Circle Thickness",
    flag = "FOVThickness",
    min = 1,
    max = 20,
    callback = function(value)
        library.flags.FOVThickness = value
    end,
})
AimbotSection:AddSlider({
    text = "Smoothness",
    flag = "AimSmoothness",
    min = 2,
    max = 80,
    float = .01,
    callback = function(value)
        library.flags.AimSmoothness = value
    end,
})
AimbotSection:AddColor({
    text = "FOV Color",
    flag = "FOVColor",
    value = Color3.fromRGB(255, 255, 255),
    callback = function(value)
        library.flags.FOVColor = value
    end,
})
AimbotSection:AddList({
    text = "Target Part",
    flag = "TargetPart",
    values = {
        "Head",
        "Torso",
        "Left Leg",
        "Right Leg",
        "Left Arm",
        "Right Arm",
        "Random",
    },
    value = "Head",
    callback = function(value)
        library.flags.TargetPart = value
    end,
})
library.flags.TargetPart = "Head"


AimbotSection:AddList({
    text = "Aim Key",
    values = {
        "Left Mouse Button",
        "Right Mouse Button",
    },
    value = "Right Mouse Button",
    flag = "AimKey",
    callback = function(value)
        if value == "Left Mouse Button" then
            library.flags.AimKey = Enum.UserInputType.MouseButton1
        elseif value == "Right Mouse Button" then
            library.flags.AimKey = Enum.UserInputType.MouseButton2
        end
    end,
})
library.flags.AimKey = Enum.UserInputType.MouseButton2

AimbotSection:AddDivider()


-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Cache
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local ViewportCenter = Camera.ViewportSize/2
library.flags.Closest = nil 
-- Libraries
getgenv().Libraries = loadstring(game:HttpGet("https://raw.githubusercontent.com/LunaaX0390/catxskakdka/main/lib.lua"))()
getgenv().Hooks = Libraries.Hooks
getgenv().DrawingObjectManager = Libraries.Drawings

animations = {}

-- Framework
getgenv().client = {}; do
    local gc = getgc(true)  
    for i = #gc, 1, -1 do
        local v = gc[i]
        local type = type(v)
        if type == 'function' then
            if debug.getinfo(v).name == "loadmodules" then
                client.loadmodules = v
            end
        end 
        if type == "table" then
            if (rawget(v, 'send')) then
                client.network = v
            elseif (rawget(v, 'basecframe')) then
                client.camera = v
            elseif (rawget(v, "gammo")) then
                client.gamelogic = v
            elseif (rawget(v, "getbodyparts")) then
                client.replication = v
                client.replication.bodyparts = debug.getupvalue(client.replication.getbodyparts, 1)
            elseif (rawget(v, "updateammo")) then
                client.hud = v
            elseif (rawget(v, "setbasewalkspeed")) then
                client.char = v
            elseif (rawget(v, "getscale")) then
                client.uiscaler = v
            end
            if rawget(v, 'player') then
                print("Got animation")
                table.insert(animations, v)
            end
        end
    end
end

local ChatGame = LocalPlayer.PlayerGui:WaitForChild("ChatGame")
local GlobalChat = ChatGame:WaitForChild("GlobalChat")
local MsgerMain = ReplicatedStorage.Misc:WaitForChild("MsgerMain")

function client:console(Message)
    local Msger = MsgerMain:Clone()
	Msger.Text = "[Luna Client Noity Console]: "
	Msger.TextColor3 = Color3.fromRGB(95, 158, 160)
	Msger.Msg.Text = Message
	Msger.Parent = GlobalChat
	Msger.Msg.Position = UDim2.new(0, Msger.TextBounds.x / client.uiscaler.getscale(), 0, 0)
end

client:console("Script loading, be patient...")
if identifyexecutor then
	executor = identifyexecutor():lower()
	local supported = false
	if executor:find("ware") then
        client:console("Detected Exector Normal Loading The GUI")
		supported = true
	elseif executor:find("synapse") then
        client:console("Detected Exector Synapse Loading The GUI")
		supported = true
	elseif executor:find("krnl") then
        client:console("Detected Exector KRNL Loading The GUI")
	    supported = true
    elseif executor:find("trigon") then
        client:console("Detected Exector Trigon Loading The GUI (Sometime Its Will Bugs)")
	    supported = true
	end
	if not supported then
		client:console("Your Exector Doesn't Support Luna GUI.")
        client:console("Please Use Other Exector Paid : Synapse | Free : KRNL")
		return
	end
end
-- !! CANCER BELOW !! --
c_assert = function(val,msg)
    if val == nil then
        LocalPlayer:Kick(msg)
    end
end

c_assert(client.network, "Could not find network module\nReport this to a developer.")
c_assert(client.camera, "Could not find camera module\nReport this to a developer.")
c_assert(client.gamelogic, "Could not find gamelogic module\nReport this to a developer.")
c_assert(client.replication, "Could not find replication module\nReport this to a developer.")
c_assert(client.hud, "Could not find hud module\nReport this to a developer.")
c_assert(client.char, "Could not find char module")
c_assert(client.loadmodules, "Could not find loadmodules function\nReport this to a developer.")
c_assert(client.replication.bodyparts, "Could not find bodyparts table\nReport this to a developer.")
-- !! CANCER OVER !! --

-- Functions
function client:IsAlive(player)
    if client.replication.bodyparts[player] and client.replication.bodyparts[player].head then
        return true 
    end
    return false
end

function client:getplayerhealth(player)
    return client.hud:getplayerhealth(player) --whats so hard about typing .hud extra | stfu
end

function client:HasProperty(Object, Property)
    local success, error = pcall(function()
        local a = Object[Property]
    end)
    return success
end

function client:GetGun()
    for i,v in pairs(Camera:GetChildren()) do
        if client.char.alive then 
            if v.Name == client.gamelogic.currentgun.name then
                return v 
            end
        end
    end
    return nil 
end 

function client:IsVisible(player)
    if client:IsAlive(player) and client.replication.bodyparts[player] then
        local HeadPos = client.replication.bodyparts[player].head.Position
        local Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.p, HeadPos - Camera.CFrame.p), {
            workspace.Ignore,
            workspace.Players,
            workspace.Terrain,
            Camera
        })
        return Hit == nil 
    end
    return false
end

function client:GetCorners(Size, CF)
    local Corners = {}
    Corners["TopLeft"] = (CF * CFrame.new(Size.X, Size.Y, 0)).p
    Corners["TopRight"] = (CF * CFrame.new(-Size.X, Size.Y, 0)).p
    Corners["BottomLeft"] = (CF * CFrame.new(Size.X, -Size.Y, 0)).p
    Corners["BottomRight"] = (CF * CFrame.new(-Size.X, -Size.Y, 0)).p
    return Corners
end

function client:GetBoundingBox(Bodyparts)
	local Size = Bodyparts.torso.Size * Vector3.new(1, 1.5)
	local BoxCorners = self:GetCorners(Size, Bodyparts.torso.CFrame)

	return {
		TopLeft = Camera:WorldToViewportPoint(BoxCorners.TopLeft),
		TopRight = Camera:WorldToViewportPoint(BoxCorners.TopRight),
		BottomLeft = Camera:WorldToViewportPoint(BoxCorners.BottomLeft),
		BottomRight = Camera:WorldToViewportPoint(BoxCorners.BottomRight),
	}
end


function client:HandleChams(player)
    RunService:BindToRenderStep("Chams", 1, function()
        
    end)
end


function client:CreateCrosshairRenderstep()
    local Vertical = DrawingObjectManager:NewDrawing("Crosshair_1", "Line")
    local Horizontal = DrawingObjectManager:NewDrawing("Crosshair_2", "Line")

    RunService:BindToRenderStep("Crosshair", 1, function()
        Vertical.Visible = library.flags.crosshairOn 
        Horizontal.Visible = library.flags.crosshairOn
        Vertical.Color = library.flags.crosshairColor
        Horizontal.Color = library.flags.crosshairColor
        Vertical.Transparency = library.flags.crosshairTransparency
        Horizontal.Transparency = library.flags.crosshairTransparency

        Vertical.From = Vector2.new(ViewportCenter.X, ViewportCenter.Y - library.flags.crosshairSize)
        Vertical.To = Vector2.new(ViewportCenter.X, ViewportCenter.Y + library.flags.crosshairSize)
        Horizontal.From = Vector2.new(ViewportCenter.X - library.flags.crosshairSize, ViewportCenter.Y)
        Horizontal.To = Vector2.new(ViewportCenter.X + library.flags.crosshairSize, ViewportCenter.Y)
    end)
end

function client:PredictMovement(player, strength)
    if client:IsAlive(player) then
    
    end
end

function client:PlayerOnScreen(player)
    if client:IsAlive(player) then
        local Pos, OnScreen = Camera:WorldToViewportPoint(client.replication.bodyparts[player].head.Position)
        local RealMouseLocation = UserInputService:GetMouseLocation()
        local Distance = library.flags.FOV
        local IsInFOV = false 
        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
        if Dist < Distance then 
            Distance = Dist
            IsInFOV = true
        end
        return {OnScreen = OnScreen, IsInFOV = IsInFOV}
    end
end

function client:InitAimbot()
    local MouseDown = false
    UserInputService.InputBegan:Connect(function(key)
        if key.UserInputType == library.flags.AimKey then
            MouseDown = true
        end
    end)

    UserInputService.InputEnded:Connect(function(key)
        if key.UserInputType == library.flags.AimKey then
            MouseDown = false
        end
    end)

    local Circle = DrawingObjectManager:NewDrawing("Aimbot_Circle", "Circle")
    local Closest
    local ClosestPosition
    local OnScreen, ScreenPos = nil,nil
    RunService:BindToRenderStep("Aimbot", 1, function()
        CharAlive = client.char.alive
        if client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then
            Barrel = client.gamelogic.currentgun.barrel
        else
            Barrel = nil
        end
        Circle.NumSides = library.flags.FOVRadius
        Circle.Thickness = library.flags.FOVThickness
        Circle.Color = library.flags.FOVColor
        Circle.Radius = library.flags.FOV
        Circle.Transparency = library.flags.FOVTransparency
        Circle.Color = library.flags.FOVColor
        Circle.Visible = library.flags.ShowFOV
        if client.char.alive and client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then 
            if library.flags.FOVFollowBarrel then
                local Pos, OnScreen = Camera:WorldToViewportPoint(client.gamelogic.currentgun.barrel.CFrame * Vector3.new(0, 0, -10))
                Circle.Position = Vector2.new(Pos.X, Pos.Y)
            else
                Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
            end
        else
            Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        end
        if library.flags.AimbotOn and client.char.alive then
            local Distance = library.flags.FOV
            local Bodyparts
            local RealMouseLocation
            if library.flags.FOVFollowBarrel then
                local Pos = Camera:WorldToViewportPoint(client.gamelogic.currentgun.barrel.CFrame * Vector3.new(0, 0, -10))
                RealMouseLocation = Vector2.new(Pos.X, Pos.Y) --cba changing variable name + ratio
            else
                RealMouseLocation = UserInputService:GetMouseLocation()
            end
            if RealMouseLocation ~= nil then
                for i,v in pairs(Players:GetPlayers()) do
                    if (v ~= LocalPlayer) and (v.Team ~= LocalPlayer.Team) and client:IsAlive(v) then
                        Bodyparts = client.replication.bodyparts[v]
                        local Pos, OnScreen = Camera:WorldToViewportPoint(Bodyparts.head.Position)
                        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
                        if Dist < Distance then
                            Distance = Dist
                            Closest = v
                            EspLibrary.settings.aimtarget = v 
                        end
                    end
                end
                local ScreenPos, OnScreen = nil, nil
                if Closest and client.replication.bodyparts[Closest] then 
                    local ClosestParts = client.replication.bodyparts[Closest]
                    if library.flags.TargetPart == "Head" then
                        ClosestPosition = ClosestParts.head.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.head.Position)
                    elseif library.flags.TargetPart == "Torso" then
                        ClosestPosition = ClosestParts.torso.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.torso.Position)
                    elseif library.flags.TargetPart == "Left Arm" then
                        ClosestPosition = ClosestParts.larm.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.larm.Position)
                    elseif library.flags.TargetPart == "Right Arm" then
                        ClosestPosition = ClosestParts.rarm.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.rarm.Position)
                    elseif library.flags.TargetPart == "Left Leg" then
                        ClosestPosition = ClosestParts.lleg.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.lleg.Position)
                    elseif library.flags.TargetPart == "Right Leg" then
                        ClosestPosition = ClosestParts.rleg.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.rleg.Position)
                    elseif library.flags.TargetPart == "Random" then
                        local Parts = { -- garbage code
                            ClosestParts.head,
                            ClosestParts.torso,
                            ClosestParts.larm,
                            ClosestParts.rarm,
                            ClosestParts.lleg,
                            ClosestParts.rleg
                        }
                        local Part = Parts[math.random(1, #Parts)]
                        ClosestPosition = Part.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(Part.Position)
                    end
                    if library.flags.AimbotMode == "Silent" then
                        if math.random(1,100) < library.flags.SilentAimHeadshotChance then
                            ClosestPosition = ClosestParts.head.Position
                        else
                            ClosestPosition = ClosestParts.torso.Position
                        end
                    end
                    if OnScreen and library.flags.AimbotMode == "Mouse" and MouseDown then
                        local Smoothing = math.clamp(library.flags.AimSmoothness, 3, 100) 
                        local X = ((ScreenPos.X) - (Mouse.X)) / Smoothing
                        local Y = ((ScreenPos.Y) - (Mouse.Y)) / Smoothing 
                        if library.flags.VisibleCheck and not client:IsVisible(Closest) then
                            return
                        end
                        mousemoverel(X, Y)
                    end
                end
            end
        end
    end)
    local Old
    Old = hookmetamethod(game, "__index", function(Self, Key)
        if library.flags.AimbotMode == "Silent" and client.char.alive then
            if Key == "CFrame" and not checkcaller() then
                if client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then
                    if Self == client.gamelogic.currentgun.barrel or Self == client.gamelogic.currentgun.aimsightdata[1].sightpart then
                        if Closest and ClosestPosition then
                            if getcallingscript().Name == "RenderSteppedRunner" then
                                local PlayerOnScreen = client:PlayerOnScreen(Closest)
                                if PlayerOnScreen and PlayerOnScreen.OnScreen then
                                    local OnScreen = PlayerOnScreen.OnScreen
                                    local IsInFOV = PlayerOnScreen.IsInFOV
                                    local Position = Self.Position
                                    if IsInFOV and OnScreen then
                                        if library.flags.VisibleCheck and not client:IsVisible(Closest) then
                                            return Old(Self, Key)
                                        end
                                        local CFramePosition = CFrame.new(Position, ClosestPosition)
                                        return CFramePosition
                                    end 
                                end
                            end
                        end
                    end
                end
            end 
        end
        return Old(Self, Key)
    end)
end

for i,v in pairs(animations) do
   if v.player then 
        local old_player = v.player
        v.player = function(a, b)
            print("Successfully overwritten function??")
            if client.char.alive and client.gamelogic.currentgun and library.flags.NoAnim then
                print("passed the first check?")
                if client.gamelogic.currentgun.type ~= "KNIFE" then
                    for i,v in pairs(client.gamelogic.currentgun.data.animations) do
                        print("Looped through",v)
                        if b == v then
                            return function() end
                        end
                    end
                end
            end
            return old_player(a,b)
        end
    end
end


function client:SolveVector3(Vector)
    if library.flags.NoRecoil == 0 then
        return Vector3.new()
    else
        return Vector * library.flags.NoRecoil 
    end
end 

function client:Weapons()
    local vec = Vector3.new()
    local SolveVector3 = function(vector)return client:SolveVector3(vector) end
    local loadgun = debug.getupvalue(client.loadmodules, 6)
    local modifydata = debug.getupvalue(loadgun, 1)
    debug.setupvalue(loadgun, 1, function(...)
        retv = modifydata(...)
        v1 = retv
        if library.flags.CustomFirerate then
            if type(retv.firerate) == 'number' then
                retv.firerate = retv.firerate + library.flags.FirerateAdition
            end
        end

        if library.flags.RecoilOn then
            v1.rotkickmin = SolveVector3(v1.rotkickmin)
            v1.rotkickmax = SolveVector3(v1.rotkickmax)
            v1.transkickmin = SolveVector3(v1.transkickmin)
            v1.transkickmax = SolveVector3(v1.transkickmax)
            --v1.camkickmin = SolveVector3(v1.camkickmin)
            --v1.camkickmax = SolveVector3(v1.camkickmax)
            --v1.camkickspeed = 0;
            v1.aimrotkickmin = SolveVector3(v1.aimrotkickmin)
            v1.aimrotkickmax = SolveVector3(v1.aimrotkickmax)
            v1.aimtranskickmin = SolveVector3(v1.aimtranskickmin)
            v1.aimtranskickmax = SolveVector3(v1.aimtranskickmax)
            v1.aimcamkickmin = SolveVector3(v1.aimcamkickmin)
            v1.aimcamkickmax = SolveVector3(v1.aimcamkickmax)
            --v1.aimcamkickspeed = 0;
            --v1.modelkickspeed = 0;
            --v1.modelrecoverspeed = 0;
            --v1.modelkickdamper = 0.0;
            --v1.aimkickmult = 0.0;
        end
        if library.flags.SpreadReduce then
            v1.hipfirespread = v1.hipfirespread * library.flags.SpreadReduceValue;
            v1.hipfirestability = v1.hipfirestability * library.flags.SpreadReduceValue;
            v1.hipfirespreadrecover = v1.hipfirespreadrecover * library.flags.SpreadReduceValue;
        end
        if library.flags.CustomReloadSpeed then
            local anim = v1.animations
            if anim.tacticalreload then
                v1.animations.tacticalreload.resettime = library.flags.ReloadSpeed
                v1.animations.tacticalreload.stdtimescale = library.flags.ReloadSpeed
                v1.animations.tacticalreload.timescale = library.flags.ReloadSpeed
            elseif anim.reload then
                v1.animations.reload.resettime = library.flags.ReloadSpeed 
                v1.animations.reload.stdtimescale = library.flags.ReloadSpeed
                v1.animations.reload.timescale = library.flags.ReloadSpeed 
            elseif anim.pullbolt then
                v1.animations.pullbolt.stdtimescale = library.flags.ReloadSpeed
                v1.animations.pullbolt.timescale = library.flags.ReloadSpeed
                v1.animations.pullbolt.resettime = library.flags.ReloadSpeed
            end
        end
        return retv
    end)
    local gunbob = debug.getupvalue(loadgun, 58)
    debug.setupvalue(loadgun, 58, function(...)
        if library.flags.NoGunBob then 
            return CFrame.new()
        end
        return gunbob(...)
    end)
end
library.flags.GunColor = Color3.fromRGB(255,255,255)
function client:MiscLoop()
    Lighting:GetPropertyChangedSignal("Brightness"):Connect(function(v)
        if library.flags.BrightnessOn then
            Lighting.Brightness = 1000
            Lighting.GlobalShadows=false
        else
            Lighting.Brightness = OldBrightness
            Lighting.GlobalShadows=true
        end
    end)
    
    local GameGui = LocalPlayer.PlayerGui.MainGui:WaitForChild("GameGui")

    GameGui.Killfeed.ChildAdded:Connect(function(c)
        repeat task.wait() until c.Text ~= "Shedletsky"
        if library.flags.KillSay then
            if c.Text == LocalPlayer.Name then
                local Victim = c.Victim.Text
                if Victim == LocalPlayer.Name then
                    return
                end
                local Msg = library.flags.KillSayMsg..Victim or "You killed "..Victim
                client.network:send("chatted", Msg)
            end
        end
    end)
    
    function closest()
        local Distance = math.huge
        local Closest
        local Bodyparts
        local AimPart
        local RealMouseLocation = UserInputService:GetMouseLocation()
        local Pos, OnScreen = nil, nil
        local Autowallable = false 
        local inFOV = false 
        for i,v in pairs(Players:GetPlayers()) do
            if (v ~= LocalPlayer) and (v.Team ~= LocalPlayer.Team) and client.replication.bodyparts[v] and client.replication.bodyparts[v].head then
                Bodyparts = client.replication.bodyparts[v]
                -- Bulletcheck arguments : Origin, Target, Trajectory, Acceleration, Penetration Depth 
                local Pos2, OnScreen2 = Camera:WorldToScreenPoint(Bodyparts.head.Position)
                local Dist = (Vector2.new(Pos2.X, Pos2.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
                if Dist < Distance then
                    AimPart = Bodyparts['head']
                    Distance = Dist
                    Closest = v
                    inFOV = true 
                    Pos, OnScreen = Pos2, OnScreen2
                end
            end
        end
        return {Closest = Closest, OnScreen = OnScreen, Part = AimPart, InFOV = inFOV}
    end


    local oldsend = client.network.send
    equipped = 1
    client.network.send = function(self, name, ...)
        if name == "falldamage" and library.flags.NoFallDamage then
            return 
        end
        
        if name == "equip" then 
            equipped = ...
        end
        
        if name == "newgrenade" and library.flags.GrenadeTP then
            local args = {...}
            if args[2].blowuptime then args[2].blowuptime=library.flags.GrenadeBlowUpTime end
            local ClosestPlayer = closest()
            if not ClosestPlayer or not ClosestPlayer.Closest or not ClosestPlayer.Part then return old(self, data, ...) end
            for i,v in pairs(args[2].frames) do
                if v ~= args[2].frames[1] then
                    if ClosestPlayer.OnScreen then
                        if v.p0 then
                            v.p0 = ClosestPlayer.Part.Position
                        end
                    end
                end
            end
        end
        return oldsend(self, name, ...)
    end
    
    
    SpaceDown = false
    UserInputService.InputBegan:Connect(function(key)
        if key.KeyCode == Enum.KeyCode.Space then
            SpaceDown = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(key)
        if key.KeyCode == Enum.KeyCode.Space then
            SpaceDown = false
        end
    end)


    RunService:BindToRenderStep("Misc", 1, function()
            if library.flags.HitboxExtender then
            for i,v in pairs(Players:GetPlayers()) do
                if client:IsAlive(v) and client.replication.bodyparts[v] and client.replication.bodyparts[v].head and client.char.alive then
                    local bp = client.replication.bodyparts[v]
                    local hbv = library.flags.HitboxExtenderValue
                    bp.head.Size = Vector3.new(hbv,hbv,hbv)
                    bp.torso.Size = Vector3.new(hbv,hbv,hbv)
                    bp.lleg.Size = Vector3.new(hbv,hbv,hbv)
                    bp.rleg.Size = Vector3.new(hbv,hbv,hbv)
                    bp.larm.Size = Vector3.new(hbv,hbv,hbv)
                    bp.rarm.Size = Vector3.new(hbv,hbv,hbv)
                end
            end
        end 

        if library.flags.WalkspeedOn then
            client.char:setbasewalkspeed(library.flags.Walkspeed)
        end
        if not library.flags.Ambience and library.flags.FullBright then
            Lighting.Ambient = Color3.fromRGB(255,255,255)
            Lighting.Brightness = 1000
        end
        if library.flags.FullBright then
            Lighting.Brightness = 1000
            Lighting.Ambient = Color3.fromRGB(255,255,255)
        end
        if not library.flags.FullBright and library.flags.Ambience then
            Lighting.Ambient = library.flags.AmbienceColor
        elseif not library.flags.FullBright and not library.flags.Ambience and not library.flags.RainbowAmbience then
            Lighting.Ambient = OldAmbience
        end
        if library.flags.Ambience then
            Lighting.Ambient = library.flags.AmbienceColor
        end
        
        if library.flags.KnifeAura and client.char.alive then
            if library.flags.KnifeAuraHeld then
                if client.gamelogic.currentgun.type ~= "KNIFE" then
                    return
                end
            end
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
                    if client:IsAlive(v) and client.replication.bodyparts[v] then
                        local Closest 
                        local Distance = library.flags.KnifeAuraDistance
                        local Dist = (client.replication.bodyparts[v].head.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Dist < Distance then
                            Dist = Distance
                            oldsend(client.network, "equip", 3) -- thx iray for telling me this
                            client.network:send("knifehit", client.replication.getplayerhit(client.replication.bodyparts[v].head), tick(), "Head")
                            client.network:send("equip", equipped) 
                        end
                    end
                end
            end
        end
        if SpaceDown and client.char.alive and library.flags.BunnyHop then
            client.char:setbasewalkspeed(library.flags.BunnyHopSpeed)
            client.char:jump(4)
        elseif not SpaceDown and client.char.alive and not library.flags.WalkspeedOn then
            client.char:setbasewalkspeed(12)
        end
    end)
    spawn(function()
        while wait() do
            local gun = client:GetGun()
            if (gun ~= nil) and (client.char.alive) then
                for i,v in pairs(gun:GetDescendants()) do
                    if not v.Name:find("TheBarrel") and not v.Name:find("IronGlow") and not v.Name:find("SightMark") and not v.Name:find("TheBarrel2") and v ~= client.gamelogic.currentgun.barrel then
                        if client:HasProperty(v, "Color") then
                            if library.flags.GunColorOn and library.flags.RainbowGun then
                                pcall(function()
                                    if v.Material ~= Enum.Material.Glass then
                                        v.Color = library.flags.GunColor
                                    end
                                end)
                            elseif library.flags.GunColorOn and not library.flags.RainbowGun then
                                pcall(function()
                                    if v.Material ~= Enum.Material.Glass then
                                        v.Color = library.flags.GunColor
                                    end
                                end)
                            elseif not library.flags.GunColorOn and library.flags.RainbowGun then
                                pcall(function()
                                    if v.Material ~= Enum.Material.Glass then
                                        local hue = tick() % 3/3
                                        v.Color = Color3.fromHSV(hue,1,1)
                                    end
                                end)
                            end
                        end 
                        if client:HasProperty(v, "Material") and library.flags.WeaponMaterial then
                            pcall(function()
                                if v.Material ~= Enum.Material.Glass then
                                    v.Material = Enum.Material[library.flags.WeaponMaterialValue]
                                end    
                            end)
                        end
                        if client:HasProperty(v, "Transparency") and library.flags.WeaponTransparency then
                            pcall(function()
                                if v.Material ~= Enum.Material.Glass then
                                    v.Transparency = library.flags.WeaponTransparencyValue
                                end
                            end)
                        end
                    end 
                end
            end
        end
    end)

    spawn(function()
        while wait() do
            if library.flags.RainbowAmbience and not library.flags.Ambience then
                local hue = tick() % 2/2
                local Color = Color3.fromHSV(hue,1,1)
                Lighting.Ambient = Color
            end
        end
    end)

    
    local oldjump = client.char.jump
    client.char.jump = function(tbl, jp)
        if library.flags.JumpPowerOn then
            return oldjump(tbl, library.flags.JumpPower)
        end
        return oldjump(tbl, jp)
    end
end

function client:init()
    client:MiscLoop()
    client:CreateCrosshairRenderstep()
    client:InitAimbot()
    client:Weapons()

    EspLibrary:Init()
    EspLibrary.settings.limitdistance = false

    function EspLibrary:GetHealth(Player)
        return client.hud:getplayerhealth(Player)
    end

    function EspLibrary:GetCharacter(Player)
        local Character = client.replication.getbodyparts(Player)

        return Character and Character.torso.Parent, Character and Character.torso
    end
end



library.flags['Menu Accent Color'] = Color3.fromRGB(95, 158, 160)
library:Init()
client:init()
if isfile("Luna_Config/default.cfg") then
    library:LoadConfig("default")
end 

client:console("Welcome User : "..game.Players.LocalPlayer.DisplayName)
client:console("Lunaa GUI Has Loaded On Your Game | Time Was Loaded On : " ..os.date("%A")..", "..os.date("%B")..", "..os.date("%Y")..", "..os.date("%X"))
client:console("Successfully Loaded The Lunaa GUI ROBLOX ID : "..game.Players.LocalPlayer.UserId)

library:selectTab(library.tabs[6])
