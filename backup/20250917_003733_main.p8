pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

function _init()
	menu_items = {"start", "how to play"}
	selected_index = 1
	end

function _update()
	-- move selection up
	if (btnp(2)) then
	selected_index -= 1
	if selected_index < 1 then
	selected_index = #menu_items
	end
	end

	-- move selection down
	if (btnp(3)) then
	selected_index += 1
	if selected_index > #menu_items then
	selected_index = 1
	end
	end

	-- activate selected item
	if (btnp(4)) then -- 🅾️ (Z) key
	local selected = menu_items[selected_index]
	if selected == "start" then
	-- start the game
	printh("starting game...")
	-- replace this with actual game start code
	elseif selected == "how to play" then
	-- show instructions
	printh("showing instructions...")
	-- replace this with actual instructions screen
	end
	end
	end

	function _draw()
cls()
	centered_print("welcome to balls galore", 20)

	-- draw menu options
	for i, item in ipairs(menu_items) do
	local y = 40 + i * 10
	if i == selected_index then
	-- highlight selected item
	centered_print("➡️ " .. item, y, 7) -- color 7 = white
	else
	centered_print(item, y, 6) -- color 6 = gray
	end
	end

	centered_print("made by: evan mitchell", 100)
	end

function centered_print(text, y, col)
	col = col or 7 -- default to white
	local x = 64 - (#text * 4) / 2
print(text, x, y, col)
	end
