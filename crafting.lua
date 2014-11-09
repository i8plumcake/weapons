minetest.register_craftitem("weapons:gunbarrel", {
	description = "Gun Barrel",
	inventory_image = "weapons_gunbarrel.png"
})
minetest.register_craft({
	output = 'weapons:gunbarrel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'', '', ''},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_craftitem("weapons:bullet25", {
	description = "25 Pack Bullet",
	inventory_image = "weapons_bullet25.png"
})
minetest.register_craft({
	output = 'weapons:bullet25',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', ''},
		{'tnt:gunpowder', 'tnt:gunpowder', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', ''},
	}
})


minetest.register_craftitem("weapons:gunhandle", {
	description = "Gun Handle",
	inventory_image = "weapons_gunhandle.png"
})
minetest.register_craft({
	output = 'weapons:gunhandle',
	recipe = {
		{'',					'',				''						},
		{'default:steel_ingot', 'default:stick', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:stick', 'default:steel_ingot'},
	}
})

minetest.register_craftitem("weapons:gunfc", {
	description = "Gun Firing Chamber",
	inventory_image = "weapons_gunfc.png"
})
minetest.register_craft({
	output = 'weapons:gunfc',
	recipe = {
		{'default:steel_ingot',		'default:steel_ingot',				'default:steel_ingot'},
		{'',						'default:mese_crystal_fragment',	'default:steel_ingot'},
		{'default:steel_ingot',		'default:steel_ingot',				'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'weapons:ak47',
	recipe = {
		{'',					'',						'default:mese_crystal_fragment'},
		{'weapons:gunbarrel',	'weapons:gunbarrel',	'weapons:gunfc'},
		{'',					'weapons:gunhandle',	'weapons:gunhandle'},
	}
})

minetest.register_craft({
	output = 'weapons:pistol',
	recipe = {
		{'',	'',						''},
		{'',	'weapons:gunbarrel',	'weapons:gunfc'},
		{'',	'',						'weapons:gunhandle'},
	}
})

minetest.register_craft({
	output = 'weapons:pistol_ct 5',
	recipe = {
		{'weapons:bullet25',},
		{'tnt:gunpowder',},
	}
})

minetest.register_craft({
	output = 'weapons:ak47_ct',
	recipe = {
		{'default:steel_ingot',	'weapons:bullet25',	'default:steel_ingot'},
		{'weapons:bullet25',	'tnt:gunpowder',	'weapons:bullet25'},
		{'default:steel_ingot',	'weapons:bullet25',	'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'weapons:papermesh',
	recipe = {
		{'',	'',	''},
		{'',	'',	''},
		{'default:paper',	'default:paper',	'default:paper'},
	}
})

minetest.register_craft({
	output = 'weapons:paperpistol',
	recipe = {
		{'weapons:papermesh',	'weapons:papermesh',	'weapons:papermesh'},
		{'					',	'tnt:gunpowder',		'weapons:papermesh'},
		{'weapons:papermesh',	'weapons:papermesh',	'weapons:papermesh'},
	}
})