weapons.endraycast = function(pos, id)
	minetest.add_particlespawner(
		10, --amount
		0.1, --time
		{x=pos.x, y=pos.y, z=pos.z}, --minpos
		{x=pos.x, y=pos.y, z=pos.z}, --maxpos
		{x=-0,y=0,z=-0}, --minvel
		{x=0,y=0,z=0}, --maxvel
		{x=-5, y=-5, z=-5}, --minacc
		{x=5, y=5, z=5}, --maxacc
		1, --minexptime
		1, --maxexptime
		1, --minsize
		2, --maxsize
		true, --collisiondetection
		id or "tnt_smoke.png" --texture
	)
end

weapons.raycast = function(pos, dir, shooter)
	for i=1, 100 do
		pos = vector.add(pos, dir)
		
		local nn=minetest.get_node(pos).name
		nn = minetest.registered_nodes[nn]
		
		local objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)
		for k, obj in pairs(objs) do
			if obj~=shooter then
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "__builtin:item" then
						local damage = 15
						obj:punch(shooter, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=damage},
						}, nil)
						weapons.endraycast(pos)
						return
					end
				else
					local damage = 15
					obj:punch(shooter, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=damage},
					}, nil)
					weapons.endraycast(pos)
					return
				end
			end
		end
		
		if nn~=nil and nn.walkable~=false then
			print("bullet hit!")
			weapons.endraycast(pos, nn.tiles[1])
			return
		end
		
		--Bullet particles
		if math.random(5)==1 then
		for ii=1, 2 do
			minetest.add_particle({
				pos = vector.add(pos, vector.multiply(vector.divide(dir, 2), ii)),
				velocity = {x=0, y=0, z=0},
				acceleration = {x=0, y=0, z=0},
				expirationtime = 2,
				size = 1,
				collisiondetection = false,
				vertical = false,
				texture = "tnt_smoke.png",
			})
		end
		end
	end
end