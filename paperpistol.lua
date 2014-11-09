minetest.register_tool("weapons:paperpistol", {
	description = "Paper Pistol",
	inventory_image = "weapons_paperpistol.png",
	on_use = function(itemstack, user, pointed_thing)
		-- local b = minetest.add_entity(vector.add(user:getpos(), {x=0,y=1.5,z=0}), "weapons:bullet")
		-- if b ~= nil then
			-- b:setvelocity(vector.multiply(user:get_look_dir(), 35))
		-- end
		local is=itemstack:to_table()
		
		is.wear = is.wear + 65535/9
		
		if is.wear>=65535 then
			is = {name="default:paper", count=1}
		end
		
		weapons.raycast(vector.add(user:getpos(), {x=0,y=1.5,z=0}), user:get_look_dir(), user)
		
		return is
	end,
})