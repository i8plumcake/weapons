minetest.register_tool("weapons:ak47", {
	description = "AK47",
	inventory_image = "weapons_ak47.png",
	on_use = function(itemstack, user, pointed_thing)
		-- local b = minetest.add_entity(vector.add(user:getpos(), {x=0,y=1.5,z=0}), "weapons:bullet")
		-- if b ~= nil then
			-- b:setvelocity(vector.multiply(user:get_look_dir(), 35))
		-- end
		local is=itemstack:to_table()
		if is.metadata=="on" then
			is.metadata=""
		else
			is.metadata="on"
		end
		
		if is.wear==0 then
			if user:get_inventory():contains_item("main", "weapons:ak47_ct") then
				user:get_inventory():remove_item("main", "weapons:ak47_ct")
				is.wear=1
			end
		end
		return is
	end,
})

minetest.register_craftitem("weapons:ak47_ct", {
	description = "AK47 100-Bullet Cartrage",
	inventory_image = "weapons_ak47_ct.png",
})

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 0.25 then
		for _,p in ipairs(minetest.get_connected_players()) do
			local w = p:get_wielded_item()
			if w~=nil and w:is_empty()==false and w:get_name()=="weapons:ak47" and w:get_metadata()=="on" and w:get_wear()~=0 then
				weapons.raycast(vector.add(p:getpos(), {x=0,y=1.5,z=0}), p:get_look_dir(), p)
				local wear = w:get_wear()
				wear = wear + 65535/100
				w = w:to_table()
				if wear>=65535 then
					wear = 0
					w.metadata = nil
				end
				w.wear = wear
				p:set_wielded_item(w)
			end
		end
	end
end)