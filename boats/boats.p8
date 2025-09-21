pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- main
function _init()
	init_boat()
end

function _update()
	update_boat()
end

function _draw()
	draw_world()
	draw_boat()
end
-->8
-- boat
function init_boat()
	directions={
		"n",
		"nw",
		"w",
		"sw",
		"s",
		"se",
		"e",
		"ne",
	}
	boat={
		health=10,
		direction_index="1",
		x=64,
		y=64,
		velocity=0,
		speed=0,
		sprite=1,
		first_sprite=1,
		last_sprite=8
	}
end

function update_boat()
	if (btnp(⬆️)) boat.speed+=1
	if (btnp(⬇️)) boat.speed-=1
	if (boat.speed<0) boat.speed=0
	if (boat.speed>3) boat.speed=3

	if (btnp(➡️)) then
		boat.direction_index-=1
		boat.sprite-=1
		if (boat.direction_index<1) boat.direction_index=8
		if (boat.sprite<1) boat.sprite=8
	end
	if (btnp(⬅️)) then
		boat.direction_index+=1
		boat.sprite+=1
		if (boat.direction_index>8) boat.direction_index=1
		if (boat.sprite>8) boat.sprite=1
	end
	
	if (boat.velocity!=boat.speed) then
		if (boat.velocity>boat.speed) boat.velocity-=0.1
		if (boat.velocity<boat.speed) boat.velocity+=0.1
	end
	
	if (directions[boat.direction_index]=="n") boat.y-=boat.velocity
	if (directions[boat.direction_index]=="s") boat.y+=boat.velocity
	if (directions[boat.direction_index]=="w") boat.x-=boat.velocity
	if (directions[boat.direction_index]=="e") boat.x+=boat.velocity

	if (directions[boat.direction_index]=="ne") then
		boat.x+=boat.velocity
		boat.y-=boat.velocity
	elseif (directions[boat.direction_index]=="nw") then
		boat.x-=boat.velocity
		boat.y-=boat.velocity
	elseif (directions[boat.direction_index]=="se") then
		boat.x+=boat.velocity
		boat.y+=boat.velocity
	elseif (directions[boat.direction_index]=="sw") then
		boat.x-=boat.velocity
		boat.y+=boat.velocity
	end
end

function draw_boat()
	spr(boat.sprite,boat.x,boat.y)
end
-->8
-- world
function draw_world()
	cls(12)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000440000000000000000000000044400044440000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700004444000044400000447440000744400044440000444000044744000004440000000000000000000000000000000000000000000000000000000000
00077000004774000044770004477440004774400077770000447700044774400077440000000000000000000000000000000000000000000000000000000000
00077000007777000047744004477440004477000047740000477440044774400447740000000000000000000000000000000000000000000000000000000000
00700700004444000007444000447440004440000044440000074440044744000444700000000000000000000000000000000000000000000000000000000000
00000000004444000000444000000000000000000004400000004440000000000444000000000000000000000000000000000000000000000000000000000000
