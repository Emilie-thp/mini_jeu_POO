#this class is related to the creation, life points and attack for a given player
class Player

attr_accessor :name, :life_points

#to initialize variables
	def initialize(name)
		@name = name
		@life_points = 10
	end

#to display the life points number of a player
	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

#to reduce life points according to the received damage
	def gets_damage(damage)
			@life_points -= damage
			if @life_points <= 0  then 
				@life_points = 0 #to prevent life_points to go in negativ
				puts "Le joueur #{@name} a été tué"
			end
	end

#to perform the attack thanks to the next method also
	def attacks(player_attacked)
		puts "#{@name} attaque #{player_attacked.name},"
		damage_received = compute_damage #use of method compute_damage to calculate the number of damage
		puts "#{@name} défonce la tronche de #{player_attacked.name} et lui inflige #{damage_received} points de dommage"
		player_attacked.gets_damage(damage_received)
	end

#to select the damage with a random dice
	def compute_damage
    return rand(1..6)
  end

end #end of class


#class to simulate an real human (heritated from Player class)
class HumanPlayer < Player

attr_accessor :weapon_level
	
	#idem class Player
	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	#idem class Player
	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	#idem class Player with the damage increased by the weapon_level
	def compute_damage
    rand(1..6) * @weapon_level
  end

	#to look for a weapon
  def search_weapon
  	level = rand(1..6)
  	puts "Tu as trouvé une arme de niveau #{level}"
  	if level > @weapon_level then #compare the result of dice with the previous weapon_level
  		@weapon_level = level
  		puts "Cette arme est bien plus balaise, tu l'échanges avec l'autre !"
  		else puts "Fuck... elle n'est pas mieux que ton arme actuelle, poubelle..."
  	end
  end

  #to look for a health pack
  def search_health_pack
  	pack = rand(1..6)
  	if pack == 1 then 
  		puts "Tu n'as rien trouvé, tu as toujours #{@life_points} points de vie."
  		elsif pack == [2..5] then 
  			if @life_points+50 >= 100 then #another if loop to check if max life_points is 100 
  				@life_points = 100
  				else @life_points += 50
  			end
  		puts "Bravo, tu as trouvé un pack de 50 points de vie !"
  		puts "Tu as désormais #{@life_points} points de vie."
  		else 
  			if @life_points+80 >= 100 #another if loop to check if max life_points is 100
  				then @life_points = 100
  				else @life_points += 80
  			end
  		puts "Waow, tu as trouvé un pack de +80 points de vie !"
  		puts "Tu as désormais #{@life_points} points de vie."
  	end
  end

end #end of class
