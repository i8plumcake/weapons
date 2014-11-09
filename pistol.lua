minetest.register_tool("weapons:pistol", {
	description = "pistol",
	inventory_image = "weapons_pistol.png",
	on_use = function(itemstack, user, pointed_thing)
		-- local b = minetest.add_entity(vector.add(user:getpos(), {x=0,y=1.5,z=0}), "weapons:bullet")
		-- if b ~= nil then
			-- b:setvelocity(vector.multiply(user:get_look_dir(), 35))
		-- end
		local is=itemstack:to_table()
		
		if is.wear~=0 then
			is.wear = is.wear + 65535/5
			
			if is.wear>=65535 then
				is.wear = 0
			end
			
			weapons.raycast(vector.add(user:getpos(), {x=0,y=1.5,z=0}), user:get_look_dir(), user)
		end
		
		if is.wear==0 then
			if user:get_inventory():contains_item("main", "weapons:pistol_ct") then
				user:get_inventory():remove_item("main", "weapons:pistol_ct")
				is.wear=1
			end
		end
		
		return is
	end,
})

minetest.register_craftitem("weapons:pistol_ct", {
	description = "pistol 5-Bullet Cartrage",
	inventory_image = "weapons_pistol_ct.png",
})