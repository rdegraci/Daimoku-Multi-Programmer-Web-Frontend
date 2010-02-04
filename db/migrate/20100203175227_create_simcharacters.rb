class CreateSimcharacters < ActiveRecord::Migration
  def self.up
    create_table :simcharacters do |t|

      t.column :name, :string   #first last
      t.column :simplayer_id, :integer  #Player
      t.column :uniqueid, :text     #Used for identity

      t.column :cclass, :string # Fighter, Cleric, etc
      t.column :race, :string #Human, etc
      t.column :description, :text   #in game description

      # character level      
      t.column :level, :integer
       
      t.column :experience, :integer  #current max
      t.column :exp, :integer	      #current
 
      t.column :armorclass, :integer  #current max
      t.column :ac, :integer          #current        

      t.column :hitpoints, :integer
      t.column :hp, :integer          #current

      t.column :speed, :integer
      t.column :sp, :integer	      #current

      ################################### 
      # RPG attribs 3 to 18 (average is 10)
      # used to modify rolls
      t.column :constitution, :integer
      t.column :size, :integer
      t.column :dexterity, :integer
      t.column :strength, :integer

      t.column :intelligence, :integer
      t.column :wisdom, :integer
      t.column :charisma, :integer

      ####################################

      t.column :moneybag, :integer      #money in the wallet

      #
      # NPCs and Mobs have Anger, Fear, and Happiness
      #
      #all three should add to 99.99 at all times
      t.column :anger, :float           #33.33
      t.column :fear,  :float           #33.33
      t.column :happiness, :float       #33.33

      # Hunger, breathing, thirst, sex, sleep, homeostatis, and excretion will modulate the FEAR index
      #
      # if > 0 then fear goes UP (because the basic needs of life of the NPC/Mob are threatened)
      # FEAR would increase over time, perhaps 3.0 points every 5 seconds
      #
      # Hunger, thirst, sleep, excretion, sex? can be scheduled or modulated by the actions of other NPCs/Mobs or the Player(s)
      # Once satisfied, these quickly decay over time... perhaps -5 every 5 seconds
      # 
      # Max 100
      # 
      t.column :hunger, :float          # 0 not hungry
      t.column :breathing, :float       # 0 not suffocating
      t.column :thirst, :float          # 0 not thirsty
      t.column :sex,    :float          # 0 no wish to procreate
      t.column :sleep,  :float          # 0 no need to sleep
      t.column :homeostatis, :float     # unused
      t.column :excretion, :float       # 0 no need to excrete

      #scripts
      t.column :hungerscript, :text	#activated when hunger reaches 30
      t.column :breathscript, :text	#activated when breathing reeaches 30
      t.column :thirstscript, :text	#activated when thirst reaches 30
      t.column :sexscript, :text	# activated at 30
      t.column :sleepscript, :text      # activated at 30
      t.column :homeostasisscript, :text #unused?
      t.column :excretionscript, :text #activated at 30            

      # Safety modulates the FEAR and ANGER index i.e
      #
      # Each of these have a Max value of 100.00 and normally be set at 75 
      #
      # if  0<30 then anger goes up (+3 per 5 seconds), fear goes down (-3 per 5 seconds)
      # if  31<50 then fear goes up (+3 per 5 seconds), happiness goes down (-3 per 5 seconds)
      # if  51<100 then fear,anger go down (-3 per 5 seconds), happiness goes up (+3 per 5 seconds)
      #        
      # personalsafety, financialsafety, healthsafety, accidentsafety can be 
      # scheduled or modulated by the actions of other NPCs/Mobs or the Player(s) 
      # when satisfied, these should reset to 75 
      #
      t.column :personalsafety, :float  # 0 means vagrant or threatened
      t.column :financialsafety, :float # 0 means beggar or robbed
      t.column :healthsafety, :float    # 0 means hospite care or physically attacked
      t.column :accidentalsafety, :float # 0 means no health insurance  or bad luck

      #scripts 

      # The script should check the values of personalsafety, financialsafety, healthsafety, accidentsafety
      # to determine what action(s) the NPC/Mob will do 
      t.column :angerscript, :text      #activated when anger is more than 66.66

      # The script should check the values of Hunger, thirst, sleep, excretion, sex? 
      # to determine what action(s) the NPC/Mob will do     
      t.column :fearscript, :text       #activated when fear is more than 66.66

      # The script should contain actions that the NPC/MOB would normally do when happy ;)
      t.column :happyscript, :text      #activated when happiness is more than 66.66
      t.timestamps
    end
  end

  def self.down
    drop_table :simcharacters
  end
end
