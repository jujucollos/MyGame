io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")

local myGUI = require("GUI")
local grouTest
local groupPlay1
local width = love.graphics.getWidth( )
local count_day = 0
local choice_map = 1
local choice_value = 1
local pos_x_text_day = -336
local pos_y_text_day = 126

TailleMap = 12
TailleCase = 8
TailleSet = 16*10

Tilemap = {}
Tilemap[1] = {}
Tilemap[2] = {}


Tilemap[1][1] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[1][2] = { 4,17,20,20,20,20,20,20,20,20,16,4 }
Tilemap[1][3] = { 4,22,14,24,14,14,23,14,24,12,21,4 }
Tilemap[1][4] = { 4,22,14,14,14,14,14,14,15,6,18,4 }
Tilemap[1][5] = { 4,22,23,14,14,24,14,18,4,6,4,4 }
Tilemap[1][6] = { 4,22,14,14,21,15,18,4,4,6,4,4 }
Tilemap[1][7] = { 4,19,12,15,18,4,4,17,20,8,16,4 }
Tilemap[1][8] = { 4,4,6,4,4,4,17,14,23,14,21,4 }
Tilemap[1][9] = { 4,17,8,20,16,4,19,14,14,14,21,4 }
Tilemap[1][10]= { 4,22,14,24,10,5,5,9,14,23,21,4 }
Tilemap[1][11]= { 4,19,15,15,18,4,4,19,15,15,18,4 }
Tilemap[1][12]= { 4,4,4,4,4,4,4,4,4,4,4,4 }

Tilemap[2][1] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][2] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][3] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][4] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][5] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][6] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][7] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][8] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][9] = { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][10]= { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][11]= { 4,4,4,4,4,4,4,4,4,4,4,4 }
Tilemap[2][12]= { 4,4,4,4,4,4,4,4,4,4,4,4 }

animation_tank_b = {}
animation_tank_b.frame = 1
animation_tank_b.image = nil
animation_tank_b.frames = {}

animation_tank_r = {}
animation_tank_r.frame = 1
animation_tank_r.image = nil
animation_tank_r.frames = {}

animation_infantry_b = {}
animation_infantry_b.frames = {}
animation_infantry_b.frame = 1
animation_infantry_b.image = nil

animation_infantry_r = {}
animation_infantry_r.frames = {}
animation_infantry_r.frame = 1
animation_infantry_r.image = nil

animation_helico_b = {}
animation_helico_b.frames = {}
animation_helico_b.frame = 1
animation_helico_b.image = nil

animation_helico_r = {}
animation_helico_r.frames = {}
animation_helico_r.frame = 1
animation_helico_r.image = nil


Select = {}
Select.c = 1
Select.l = 1

listUnit = {}

font_normale = {}
font_big = {}

-- Les sols 

TERRAIN_PLAIN = 1
TERRAIN_MOUNTAIN = 2
TERRAIN_FOREST = 3
TERRAIN_WATER = 4
TERRAIN_PONT_X = 5
TERRAIN_PONT_Y = 6
TERRAIN_ROUTE_BAS_HERBE = 7
TERRAIN_ROUTE_BAS_SABLE = 8
TERRAIN_ROUTE_DROITE_SABLE = 9
TERRAIN_ROUTE_GAUCHE_SABLE = 10
TERRAIN_ROUTE_HAUT_HERBE = 11
TERRAIN_ROUTE_HAUT_SABLE = 12
TERRAIN_ROUTE_HERBE = 13
TERRAIN_SABLE = 14
TERRAIN_SABLE_BAS = 15
TERRAIN_SABLE_COIN_DROITE = 16
TERRAIN_SABLE_COIN_GAUCHE = 17
TERRAIN_SABLE_DROITE = 18
TERRAIN_SABLE_GAUCHE = 19
TERRAIN_SABLE_HAUT = 20
TERRAIN_SABLE_COTE_DROIT = 21
TERRAIN_SABLE_COTE_GAUCHE = 22
TERRAIN_MAISON_SABLE = 23
TERRAIN_CACTUS = 24
TERRAIN_HERBE = 25


DejaBattle = 0

dbSols = {}

-- Les unités 

dbUnits = {}

-- Contexte de jeu
Contexte = {}
Contexte.Joueur = 1
Contexte.Etat = "MENU"



Perso_b = {}
Perso_b.Image = {}
Perso_b.Image[1] = love.graphics.newImage("b_cg.png")
Perso_b.Image[2] = love.graphics.newImage("b_cd.png")
Perso_b.Image[3] = love.graphics.newImage("b_bg.png")
Perso_b.Image[4] = love.graphics.newImage("b_bd.png")

Perso_r = {}
Perso_r.Image = {}
Perso_r.Image[1] = love.graphics.newImage("r_cg.png")
Perso_r.Image[2] = love.graphics.newImage("r_cd.png")
Perso_r.Image[3] = love.graphics.newImage("r_bg.png")
Perso_r.Image[4] = love.graphics.newImage("r_bd.png")

Def_i = {}
Def_i.Image = {}
Def_i.Image[1] = love.graphics.newImage("def_ig.png")
Def_i.Image[2] = love.graphics.newImage("def_id.png")

Def_t = {}
Def_t.Image = {}
Def_t.Image[1] = love.graphics.newImage("def_tg.png")
Def_t.Image[2] = love.graphics.newImage("def_td.png")

Def_h = {}
Def_h.Image = {}
Def_h.Image[1] = love.graphics.newImage("def_hg.png")
Def_h.Image[2] = love.graphics.newImage("def_hd.png")

Cadre_day = {}
Cadre_day.Image = love.graphics.newImage("Passage_jour/cadre_jour.png")
Cadre_day.x = -96
Cadre_day.y = 0
Cadre_day.textX = pos_x_text_day
Cadre_day.textY = pos_y_text_day

Mechant = {}
Mechant.Image = love.graphics.newImage("Passage_jour/mechant.png")
Mechant.x = -25
Mechant.y = 87

Bulle = {}
Bulle.Image = love.graphics.newImage("Bulle/bulle.png")
Bulle.x = -25
Bulle.y = 67
Bulle.textX = -410
Bulle.textY = 523

Image_menu = {}
Image_menu.Image = {}
Image_menu.Image[1] = love.graphics.newImage("Image_map_menu/level1.png")
Image_menu.Image[2] = love.graphics.newImage("Image_map_menu/fond_menu_command.jpg")

function CreeUnit(pType, pJoueur, pLigne, pColonne)
  local Unit = {}
  Unit.Type = pType
  Unit.Joueur = pJoueur
  Unit.HP = dbUnits[pType].HP
  Unit.Ligne = pLigne
  Unit.Colonne = pColonne
  Unit.Range = dbUnits[pType].Range
  Unit.BonusAtk = dbUnits[pType].BonusAtk
  Unit.attaque_actuelle = dbUnits[pType].attaque_actuelle
  Unit.attaque_global = dbUnits[pType].attaque_global
  table.insert(listUnit, Unit)
end

function StartGame()
  if choice_value == 1  then
    CreeUnit("TANK", 1, 2, 3)
    CreeUnit("INFANTRY", 1, 2, 2)
    CreeUnit("HELICO", 1, 3, 2)
    CreeUnit("TANK", 2, 10, 10)
    CreeUnit("INFANTRY", 2, 9, 11)
    CreeUnit("HELICO", 2 , 10, 11)
  else
    print("j")
  end
  
  
  
  -- Etat par défaut
  Contexte.Etat = "SELECTION"
end

function FinDeTour()
  -- Rétabli les points de déplacements au max
  for u=1,#listUnit do
    local unit = listUnit[u]
    unit.Range = dbUnits[unit.Type].Range
    dbUnits[unit.Type].NbAtk = 1
  end
  Contexte.Etat = "SELECTION"
end

function Lancement()
  choice_map = choice_value
  love.graphics.setColor(1,1,1,1)
  
  dbSols[TERRAIN_PLAIN] = {}
  dbSols[TERRAIN_PLAIN].ID = "PLAIN"
  dbSols[TERRAIN_PLAIN].Name = "Plain"
  dbSols[TERRAIN_PLAIN].Image = love.graphics.newImage("map_plain.png")
  dbSols[TERRAIN_PLAIN].ImageBattle = love.graphics.newImage("set_plain.png")

  dbSols[TERRAIN_MOUNTAIN] = {}
  dbSols[TERRAIN_MOUNTAIN].ID = "MOUNTAIN"
  dbSols[TERRAIN_MOUNTAIN].Name = "Mountain"
  dbSols[TERRAIN_MOUNTAIN].Image = love.graphics.newImage("map_mountain.png")
  dbSols[TERRAIN_MOUNTAIN].ImageBattle = love.graphics.newImage("set_mountain.png")

  dbSols[TERRAIN_FOREST] = {}
  dbSols[TERRAIN_FOREST].ID = "FOREST"
  dbSols[TERRAIN_FOREST].Name = "Forest"
  dbSols[TERRAIN_FOREST].Image = love.graphics.newImage("map_forest.png")
  dbSols[TERRAIN_FOREST].ImageBattle = love.graphics.newImage("set_forest.png")
  
  dbSols[TERRAIN_WATER] = {}
  dbSols[TERRAIN_WATER].ID = "WATER"
  dbSols[TERRAIN_WATER].Name = "Water"
  dbSols[TERRAIN_WATER].Image = love.graphics.newImage("Tilemap/eau.png")

  dbSols[TERRAIN_PONT_X] = {}
  dbSols[TERRAIN_PONT_X].ID = "PONT"
  dbSols[TERRAIN_PONT_X].Name = "Pont"
  dbSols[TERRAIN_PONT_X].Image = love.graphics.newImage("Tilemap/pont_x.png")
  dbSols[TERRAIN_PONT_X].ImageBattle = love.graphics.newImage("set_bridge.png")
  
  dbSols[TERRAIN_PONT_Y] = {}
  dbSols[TERRAIN_PONT_Y].ID = "PONT"
  dbSols[TERRAIN_PONT_Y].Name = "Pont"
  dbSols[TERRAIN_PONT_Y].Image = love.graphics.newImage("Tilemap/pont_y.png")
  dbSols[TERRAIN_PONT_Y].ImageBattle = love.graphics.newImage("set_bridge.png")
  
  dbSols[TERRAIN_ROUTE_BAS_HERBE] = {}
  dbSols[TERRAIN_ROUTE_BAS_HERBE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_BAS_HERBE].Name = "Route"
  dbSols[TERRAIN_ROUTE_BAS_HERBE].Image = love.graphics.newImage("Tilemap/route_bas_herbe.png")
  
  dbSols[TERRAIN_ROUTE_BAS_SABLE] = {}
  dbSols[TERRAIN_ROUTE_BAS_SABLE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_BAS_SABLE].Name = "Route"
  dbSols[TERRAIN_ROUTE_BAS_SABLE].Image = love.graphics.newImage("Tilemap/route_bas_sable.png")
  dbSols[TERRAIN_ROUTE_BAS_SABLE].ImageBattle = love.graphics.newImage("set_bridge_gauche.png")
  
  dbSols[TERRAIN_ROUTE_DROITE_SABLE] = {}
  dbSols[TERRAIN_ROUTE_DROITE_SABLE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_DROITE_SABLE].Name = "Route"
  dbSols[TERRAIN_ROUTE_DROITE_SABLE].Image = love.graphics.newImage("Tilemap/route_droite_sable.png")
  
  dbSols[TERRAIN_ROUTE_GAUCHE_SABLE] = {}
  dbSols[TERRAIN_ROUTE_GAUCHE_SABLE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_GAUCHE_SABLE].Name = "Route"
  dbSols[TERRAIN_ROUTE_GAUCHE_SABLE].Image = love.graphics.newImage("Tilemap/route_gauche_sable.png")
  
  
  dbSols[TERRAIN_ROUTE_HAUT_HERBE] = {}
  dbSols[TERRAIN_ROUTE_HAUT_HERBE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_HAUT_HERBE].Name = "Route"
  dbSols[TERRAIN_ROUTE_HAUT_HERBE].Image = love.graphics.newImage("Tilemap/route_haut_herbe.png")
  
  
  dbSols[TERRAIN_ROUTE_HAUT_SABLE] = {}
  dbSols[TERRAIN_ROUTE_HAUT_SABLE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_HAUT_SABLE].Name = "Route"
  dbSols[TERRAIN_ROUTE_HAUT_SABLE].Image = love.graphics.newImage("Tilemap/route_haut_sable.png")
  dbSols[TERRAIN_ROUTE_HAUT_SABLE].ImageBattle = love.graphics.newImage("set_bridge_gauche.png")
  
  dbSols[TERRAIN_ROUTE_HERBE] = {}
  dbSols[TERRAIN_ROUTE_HERBE].ID = "ROUTE"
  dbSols[TERRAIN_ROUTE_HERBE].Name = "Route"
  dbSols[TERRAIN_ROUTE_HERBE].Image = love.graphics.newImage("Tilemap/route_herbe.png")
  
  dbSols[TERRAIN_SABLE] = {}
  dbSols[TERRAIN_SABLE].ID = "SABLE"
  dbSols[TERRAIN_SABLE].Name = "Sable"
  dbSols[TERRAIN_SABLE].Image = love.graphics.newImage("Tilemap/sable.png")
  dbSols[TERRAIN_SABLE].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_BAS] = {}
  dbSols[TERRAIN_SABLE_BAS].ID = "SABLE"
  dbSols[TERRAIN_SABLE_BAS].Name = "Sable"
  dbSols[TERRAIN_SABLE_BAS].Image = love.graphics.newImage("Tilemap/sable_bas.png")
  dbSols[TERRAIN_SABLE_BAS].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_COIN_DROITE] = {}
  dbSols[TERRAIN_SABLE_COIN_DROITE].ID = "SABLE"
  dbSols[TERRAIN_SABLE_COIN_DROITE].Name = "Sable"
  dbSols[TERRAIN_SABLE_COIN_DROITE].Image = love.graphics.newImage("Tilemap/sable_coin_droite.png")
  dbSols[TERRAIN_SABLE_COIN_DROITE].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_COIN_GAUCHE] = {}
  dbSols[TERRAIN_SABLE_COIN_GAUCHE].ID = "SABLE"
  dbSols[TERRAIN_SABLE_COIN_GAUCHE].Name = "Sable"
  dbSols[TERRAIN_SABLE_COIN_GAUCHE].Image = love.graphics.newImage("Tilemap/sable_coin_gauche.png")
  
  dbSols[TERRAIN_SABLE_DROITE] = {}
  dbSols[TERRAIN_SABLE_DROITE].ID = "SABLE"
  dbSols[TERRAIN_SABLE_DROITE].Name = "Sable"
  dbSols[TERRAIN_SABLE_DROITE].Image = love.graphics.newImage("Tilemap/sable_droite.png")
  dbSols[TERRAIN_SABLE_DROITE].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_GAUCHE] = {}
  dbSols[TERRAIN_SABLE_GAUCHE].ID = "SABLE"
  dbSols[TERRAIN_SABLE_GAUCHE].Name = "Sable"
  dbSols[TERRAIN_SABLE_GAUCHE].Image = love.graphics.newImage("Tilemap/sable_gauche.png")
  dbSols[TERRAIN_SABLE_GAUCHE].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_HAUT] = {}
  dbSols[TERRAIN_SABLE_HAUT].ID = "SABLE"
  dbSols[TERRAIN_SABLE_HAUT].Name = "Sable"
  dbSols[TERRAIN_SABLE_HAUT].Image = love.graphics.newImage("Tilemap/sable_haut.png")
  dbSols[TERRAIN_SABLE_HAUT].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_COTE_DROIT] = {}
  dbSols[TERRAIN_SABLE_COTE_DROIT].ID = "SABLE"
  dbSols[TERRAIN_SABLE_COTE_DROIT].Name = "Sable"
  dbSols[TERRAIN_SABLE_COTE_DROIT].Image = love.graphics.newImage("Tilemap/sable_cote_droit.png")
  dbSols[TERRAIN_SABLE_COTE_DROIT].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_SABLE_COTE_GAUCHE] = {}
  dbSols[TERRAIN_SABLE_COTE_GAUCHE].ID = "SABLE"
  dbSols[TERRAIN_SABLE_COTE_GAUCHE].Name = "Sable"
  dbSols[TERRAIN_SABLE_COTE_GAUCHE].Image = love.graphics.newImage("Tilemap/sable_cote_gauche.png")
  dbSols[TERRAIN_SABLE_COTE_GAUCHE].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_MAISON_SABLE] = {}
  dbSols[TERRAIN_MAISON_SABLE].ID = "SABLE"
  dbSols[TERRAIN_MAISON_SABLE].Name = "House"
  dbSols[TERRAIN_MAISON_SABLE].Image = love.graphics.newImage("Tilemap/maison_neutre_sable.png")
  dbSols[TERRAIN_MAISON_SABLE].ImageBattle = love.graphics.newImage("set_mountain.png")
  
  dbSols[TERRAIN_CACTUS] = {}
  dbSols[TERRAIN_CACTUS].ID = "CACTUS"
  dbSols[TERRAIN_CACTUS].Name = "Cactus"
  dbSols[TERRAIN_CACTUS].Image = love.graphics.newImage("Tilemap/cactus.png")
  dbSols[TERRAIN_CACTUS].ImageBattle = love.graphics.newImage("set_cactus.png")
  
  dbUnits["INFANTRY"] = {}
  dbUnits["INFANTRY"].HP = 12
  dbUnits["INFANTRY"].Range = 20
  dbUnits["INFANTRY"].Gas = 99
  dbUnits["INFANTRY"].BonusAtk = 0
  dbUnits["INFANTRY"].attaque_actuelle = 3
  dbUnits["INFANTRY"].attaque_global = 3
  dbUnits["INFANTRY"].NbAtk = 1
  
  dbUnits["INFANTRY"].Image = {}
  dbUnits["INFANTRY"].ImageBattle = {}
  dbUnits["INFANTRY"].Image[1] = love.graphics.newImage("infantry_1.png")
  dbUnits["INFANTRY"].ImageBattle[1] = love.graphics.newImage("infantry_battle_1.png")
  dbUnits["INFANTRY"].Image[2] = love.graphics.newImage("infantry_2.png")
  dbUnits["INFANTRY"].ImageBattle[2] = love.graphics.newImage("infantry_battle_2.png")
  dbUnits["INFANTRY"].Effects = {}
  dbUnits["INFANTRY"].Effects[TERRAIN_PLAIN] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_MOUNTAIN] = 2
  dbUnits["INFANTRY"].Effects[TERRAIN_FOREST] = 2
  dbUnits["INFANTRY"].Effects[TERRAIN_WATER] = 0
  dbUnits["INFANTRY"].Effects[TERRAIN_PONT_X] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_PONT_Y] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_BAS_HERBE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_BAS_SABLE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_DROITE_SABLE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_GAUCHE_SABLE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_HAUT_HERBE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_HAUT_SABLE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_ROUTE_HERBE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_BAS] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_COIN_DROITE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_COIN_GAUCHE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_DROITE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_GAUCHE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_HAUT] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_COTE_DROIT] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_SABLE_COTE_GAUCHE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_MAISON_SABLE] = 1
  dbUnits["INFANTRY"].Effects[TERRAIN_CACTUS] = 1

  dbUnits["INFANTRY"].Degats = {}
  dbUnits["INFANTRY"].Degats["INFANTRY"] = 55
  dbUnits["INFANTRY"].Degats["TANK"] = 5
  dbUnits["INFANTRY"].Degats["HELICO"] = 7
  
  dbUnits["TANK"] = {}
  dbUnits["TANK"].HP = 17
  dbUnits["TANK"].Range = 30
  dbUnits["TANK"].BonusAtk = 0
  dbUnits["TANK"].attaque_actuelle = 5
  dbUnits["TANK"].attaque_global = 5
  dbUnits["TANK"].Gas = 99
  dbUnits["TANK"].NbAtk = 1
  dbUnits["TANK"].Image = {}
  dbUnits["TANK"].ImageBattle = {}
  dbUnits["TANK"].Image[1] = love.graphics.newImage("tank_1.png")
  dbUnits["TANK"].ImageBattle[1] = love.graphics.newImage("tank_battle_1.png")
  dbUnits["TANK"].Image[2] = love.graphics.newImage("tank_2.png")
  dbUnits["TANK"].ImageBattle[2] = love.graphics.newImage("tank_battle_2.png")

  dbUnits["TANK"].Effects = {}
  dbUnits["TANK"].Effects[TERRAIN_PLAIN] = 1
  dbUnits["TANK"].Effects[TERRAIN_MOUNTAIN] = 0
  dbUnits["TANK"].Effects[TERRAIN_FOREST] = 2
  dbUnits["TANK"].Effects[TERRAIN_WATER] = 0
  dbUnits["TANK"].Effects[TERRAIN_PONT_X] = 2
  dbUnits["TANK"].Effects[TERRAIN_PONT_Y] = 2
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_BAS_HERBE] = 1
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_BAS_SABLE] = 1
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_DROITE_SABLE] = 1
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_GAUCHE_SABLE] = 1
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_HAUT_HERBE] = 1
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_HAUT_SABLE] = 1
  dbUnits["TANK"].Effects[TERRAIN_ROUTE_HERBE] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_BAS] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_COIN_DROITE] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_COIN_GAUCHE] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_DROITE] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_GAUCHE] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_HAUT] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_COTE_DROIT] = 1
  dbUnits["TANK"].Effects[TERRAIN_SABLE_COTE_GAUCHE] = 1
  dbUnits["TANK"].Effects[TERRAIN_MAISON_SABLE] = 1
  dbUnits["TANK"].Effects[TERRAIN_CACTUS] = 1


  dbUnits["TANK"].Degats = {}
  dbUnits["TANK"].Degats["INFANTRY"] = 75
  dbUnits["TANK"].Degats["TANK"] = 55
  dbUnits["TANK"].Degats["HELICO"] = 10

  dbUnits["HELICO"] = {}
  dbUnits["HELICO"].HP = 15
  dbUnits["HELICO"].Range = 40
  dbUnits["HELICO"].BonusAtk = 0
  dbUnits["HELICO"].attaque_actuelle = 6
  dbUnits["HELICO"].attaque_global = 6
  dbUnits["HELICO"].Gas = 99
  dbUnits["HELICO"].NbAtk = 1
  dbUnits["HELICO"].Image = {}
  dbUnits["HELICO"].ImageBattle = {}
  dbUnits["HELICO"].ImageBattle[1] = love.graphics.newImage("helico_battle_1.png")
  dbUnits["HELICO"].ImageBattle[2] = love.graphics.newImage("helico_battle_2.png")

  dbUnits["HELICO"].Image[1] = love.graphics.newImage("helico_1.png")
  dbUnits["HELICO"].Image[2] = love.graphics.newImage("helico_2.png")
  dbUnits["HELICO"].Effects = {}
  dbUnits["HELICO"].Effects[TERRAIN_PLAIN] = 1
  dbUnits["HELICO"].Effects[TERRAIN_MOUNTAIN] = 2
  dbUnits["HELICO"].Effects[TERRAIN_FOREST] = 0
  dbUnits["HELICO"].Effects[TERRAIN_WATER] = 0
  dbUnits["HELICO"].Effects[TERRAIN_PONT_X] = 2
  dbUnits["HELICO"].Effects[TERRAIN_PONT_Y] = 2
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_BAS_HERBE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_BAS_SABLE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_DROITE_SABLE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_GAUCHE_SABLE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_HAUT_HERBE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_HAUT_SABLE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_ROUTE_HERBE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_BAS] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_COIN_DROITE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_COIN_GAUCHE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_DROITE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_GAUCHE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_HAUT] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_COTE_DROIT] = 1
  dbUnits["HELICO"].Effects[TERRAIN_SABLE_COTE_GAUCHE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_MAISON_SABLE] = 1
  dbUnits["HELICO"].Effects[TERRAIN_CACTUS] = 1


  dbUnits["HELICO"].Degats = {}
  dbUnits["HELICO"].Degats["INFANTRY"] = 75
  dbUnits["HELICO"].Degats["TANK"] = 6
  dbUnits["HELICO"].Degats["HELICO"] = 65
  
  starsDef = {}
  starsDef[TERRAIN_PLAIN] = 1
  starsDef[TERRAIN_FOREST] = 3
  starsDef[TERRAIN_MOUNTAIN] = 4
  starsDef[TERRAIN_PONT_X] = 3
  starsDef[TERRAIN_PONT_Y] = 3
  starsDef[TERRAIN_ROUTE_BAS_HERBE] = 1
  starsDef[TERRAIN_ROUTE_BAS_SABLE] = 1
  starsDef[TERRAIN_ROUTE_DROITE_SABLE] = 1
  starsDef[TERRAIN_ROUTE_GAUCHE_SABLE] = 1
  starsDef[TERRAIN_ROUTE_HAUT_HERBE] = 1
  starsDef[TERRAIN_ROUTE_HAUT_SABLE] = 1
  starsDef[TERRAIN_ROUTE_HERBE] = 1
  starsDef[TERRAIN_SABLE] = 1
  starsDef[TERRAIN_SABLE_BAS] = 1
  starsDef[TERRAIN_SABLE_COIN_DROITE] = 1
  starsDef[TERRAIN_SABLE_COIN_GAUCHE] = 1
  starsDef[TERRAIN_SABLE_DROITE] = 1
  starsDef[TERRAIN_SABLE_GAUCHE] = 1
  starsDef[TERRAIN_SABLE_HAUT] = 1
  starsDef[TERRAIN_SABLE_COTE_DROIT] = 1
  starsDef[TERRAIN_SABLE_COTE_GAUCHE] = 1
  starsDef[TERRAIN_MAISON_SABLE] = 4
  starsDef[TERRAIN_CACTUS] = 3
  
  animation_tank_b.image = love.graphics.newImage("animation_tank_b.png")
  animation_tank_b.frames[1] = love.graphics.newQuad(0,0,16,16, animation_tank_b.image:getWidth(), animation_tank_b.image:getHeight())
  animation_tank_b.frames[2] = love.graphics.newQuad(16,0,16,16, animation_tank_b.image:getWidth(), animation_tank_b.image:getHeight())
  animation_tank_b.frames[3] = love.graphics.newQuad(32,0,16,16, animation_tank_b.image:getWidth(), animation_tank_b.image:getHeight())
  animation_tank_b.frames[4] = love.graphics.newQuad(48,0,16,16, animation_tank_b.image:getWidth(), animation_tank_b.image:getHeight())
  
  animation_tank_r.image = love.graphics.newImage("animation_tank_r.png")
  animation_tank_r.frames[1] = love.graphics.newQuad(0,0,16,16, animation_tank_r.image:getWidth(), animation_tank_r.image:getHeight())
  animation_tank_r.frames[2] = love.graphics.newQuad(16,0,16,16, animation_tank_r.image:getWidth(), animation_tank_r.image:getHeight())
  animation_tank_r.frames[3] = love.graphics.newQuad(32,0,16,16, animation_tank_r.image:getWidth(), animation_tank_r.image:getHeight())
  animation_tank_r.frames[4] = love.graphics.newQuad(48,0,16,16, animation_tank_r.image:getWidth(), animation_tank_r.image:getHeight())

animation_infantry_b.image = love.graphics.newImage("animation_infantry_b.png")
animation_infantry_b.frames[1] = love.graphics.newQuad(0,0,16,16, animation_infantry_b.image:getWidth(), animation_infantry_b.image:getHeight())
animation_infantry_b.frames[2] = love.graphics.newQuad(16,0,16,16, animation_infantry_b.image:getWidth(), animation_infantry_b.image:getHeight())
animation_infantry_b.frames[3] = love.graphics.newQuad(32,0,16,16, animation_infantry_b.image:getWidth(), animation_infantry_b.image:getHeight())
animation_infantry_b.frames[4] = love.graphics.newQuad(48,0,16,16, animation_infantry_b.image:getWidth(), animation_infantry_b.image:getHeight())

animation_infantry_r.image = love.graphics.newImage("animation_infantry_r.png")
animation_infantry_r.frames[1] = love.graphics.newQuad(0,0,16,16, animation_infantry_r.image:getWidth(), animation_infantry_r.image:getHeight())
animation_infantry_r.frames[2] = love.graphics.newQuad(16,0,16,16, animation_infantry_r.image:getWidth(), animation_infantry_r.image:getHeight())
animation_infantry_r.frames[3] = love.graphics.newQuad(32,0,16,16, animation_infantry_r.image:getWidth(), animation_infantry_r.image:getHeight())
animation_infantry_r.frames[4] = love.graphics.newQuad(48,0,16,16, animation_infantry_r.image:getWidth(), animation_infantry_r.image:getHeight())

animation_helico_b.image = love.graphics.newImage("animation_helico_b.png")
animation_helico_b.frames[1] = love.graphics.newQuad(0,0,16,16, animation_helico_b.image:getWidth(), animation_helico_b.image:getHeight())
animation_helico_b.frames[2] = love.graphics.newQuad(16,0,16,16, animation_helico_b.image:getWidth(), animation_helico_b.image:getHeight())
animation_helico_b.frames[3] = love.graphics.newQuad(32,0,16,16, animation_helico_b.image:getWidth(), animation_helico_b.image:getHeight())
animation_helico_b.frames[4] = love.graphics.newQuad(48,0,16,16, animation_helico_b.image:getWidth(), animation_helico_b.image:getHeight())

animation_helico_r.image = love.graphics.newImage("animation_helico_r.png")
animation_helico_r.frames[1] = love.graphics.newQuad(0,0,16,16, animation_helico_r.image:getWidth(), animation_helico_r.image:getHeight())
animation_helico_r.frames[2] = love.graphics.newQuad(16,0,16,16, animation_helico_r.image:getWidth(), animation_helico_r.image:getHeight())
animation_helico_r.frames[3] = love.graphics.newQuad(32,0,16,16, animation_helico_r.image:getWidth(), animation_helico_r.image:getHeight())
animation_helico_r.frames[4] = love.graphics.newQuad(48,0,16,16, animation_helico_r.image:getWidth(), animation_helico_r.image:getHeight())

  StartGame()
end

-----------------------------------------------------------------------------------
--                                  CREATION BUTTON
-----------------------------------------------------------------------------------

function StartLevel1()
  choice_value = 1
  Button1:setEvent("start_game", Lancement)
end 

function StartLevel2()
  choice_value = 2
  Button2:setEvent("start_game", Lancement)
end

function ButtonLevel1()
  Contexte.Etat = "COMMAND"
  Button1 = myGUI.newButton(100, 450, 130, 43,"MAP 1", font_normale, {151, 220, 250})
  Button2 = myGUI.newButton(550, 450, 130, 43,"MAP 2", font_normale, {151, 220, 250})
  Button1:setEvent("start_level_1", StartLevel1)
  Button2:setEvent("start_level_2", StartLevel2)
  groupPlay1 = myGUI.newGroup()
  groupPlay1:addElement(Button1)
  groupPlay1:addElement(Button2)
  
end

function love.load()


  font_normale = love.graphics.newFont("kenvector_future_thin.ttf", 20)
  font_day = love.graphics.newFont("kenvector_future_thin.ttf", 60)
  font_big = love.graphics.newFont("kenvector_future_thin.ttf", 80)
  font_bulle = love.graphics.newFont("kenvector_future_thin.ttf", 15)
  
  -- start menu
  ButtonPlay = myGUI.newButton(330, 200, 130, 43,"Play", font_normale, {151, 220, 250})
  ButtonCommand = myGUI.newButton(330, 250, 130, 43,"Niveau", font_normale, {151, 220, 250})
  ButtonCredit = myGUI.newButton(330, 300, 130, 43,"Credit", font_normale, {151, 220, 250})
  
    
  ButtonPlay:setEvent("start_game", Lancement)
  ButtonCommand:setEvent("button_level_1", ButtonLevel1)
  ButtonCommand:setEvent("button_level_2", ButtonLevel2)

  groupTest = myGUI.newGroup()
  groupTest:addElement(ButtonPlay)
  groupTest:addElement(ButtonCommand)
  groupTest:addElement(ButtonCredit)
  
end




-- Retourne l'unité présente sous la coordonnées
-- ou nil si aucune unité n'est présente
function UnitUnder(pLigne, pColonne)
  for u=1,#listUnit do
    local unit = listUnit[u]
    if pColonne == unit.Colonne and pLigne == unit.Ligne then
      return unit
    end
  end
  return nil
end

function love.update(dt)
  
  --handle menu
  if Contexte.Etat == "MENU" then
    groupTest:update(dt)
  end
  if Contexte.Etat == "COMMAND" then
    groupPlay1:update(dt)
  end
  
  -----------------------------------------------------------------------------------
  --                              ANIMATIONS UNITS
  -----------------------------------------------------------------------------------
  
  animation_tank_b.frame = animation_tank_b.frame + 2*dt
  if animation_tank_b.frame >= #animation_tank_b.frames + 1 then
    animation_tank_b.frame = 1
  end
  animation_tank_r.frame = animation_tank_r.frame + 2*dt
  if animation_tank_r.frame >= #animation_tank_r.frames + 1 then
    animation_tank_r.frame = 1
  end
  animation_infantry_r.frame = animation_infantry_r.frame + 2*dt
  if animation_infantry_r.frame >= #animation_infantry_r.frames + 1 then
    animation_infantry_r.frame = 1
  end
  animation_infantry_b.frame = animation_infantry_b.frame + 2*dt
  if animation_infantry_b.frame >= #animation_infantry_b.frames + 1 then
    animation_infantry_b.frame = 1
  end
  animation_helico_b.frame = animation_helico_b.frame + 2*dt
  if animation_helico_b.frame >= #animation_helico_b.frames + 1 then
    animation_helico_b.frame = 1
  end
  animation_helico_r.frame = animation_helico_r.frame + 2*dt
  if animation_helico_r.frame >= #animation_helico_r.frames + 1 then
    animation_helico_r.frame = 1
  end
  
  -----------------------------------------------------------------------------------
  --                              ANIMATIONS INFORMATIONS
  -----------------------------------------------------------------------------------
  if Contexte.Etat == "SELECTION" or Contexte.Etat == "MOVE" or Contexte.Etat == "BATTLE" or 
      Contexte.Etat =="INFORMATION" then
    if count_day % 2 == 0 then
      if Cadre_day.x <= width then
        Cadre_day.x = Cadre_day.x + 1
        Cadre_day.textX = Cadre_day.textX + 5
      end
    else
      Cadre_day.x = -96
      Cadre_day.textX = pos_x_text_day
    end
  end
  
  if count_day/2 == 3 and Contexte.Etat ~= "BATTLE" then
    if Mechant.x < 0 then
      Mechant.x = Mechant.x + 1
      Bulle.x = Bulle.x + 1
      Bulle.textX = Bulle.textX + 24
    end
  else
    Mechant.x = -25
  end    

  if Contexte.Etat == "BATTLE" then
    Update_BattleState(dt)
  end
end

-----------------------------------------------------------------------------------
--                              DRAW INFORMATIONS
-----------------------------------------------------------------------------------

function Draw_Day()
  love.graphics.setFont(font_day)
  love.graphics.scale(5,5)
  love.graphics.draw(Cadre_day.Image, Cadre_day.x, Cadre_day.y)
  love.graphics.scale(1/5,1/5)
  love.graphics.print("Day "..count_day/2, Cadre_day.textX, Cadre_day.textY)
end

function Draw_Evil()
  love.graphics.setFont(font_day)
  love.graphics.scale(5,5)
  love.graphics.draw(Mechant.Image, Mechant.x, Mechant.y)
  love.graphics.scale(1/5,1/5)  
end

function Draw_Bulle()
  love.graphics.setFont(font_bulle)
  love.graphics.scale(5,5)
  love.graphics.draw(Bulle.Image, Bulle.x, Bulle.y)
  love.graphics.scale(1/5, 1/5)
  love.graphics.setColor(0,0,0,1)
  love.graphics.print("Tu vas avoir du mal a me combattre",Bulle.textX, Bulle.textY)
  love.graphics.setColor(1,1,1,1)
end

function Draw_Information()
  love.graphics.print("Coucou je suis une nouvelle information et j'essaye d'etre utile")
end

-----------------------------------------------------------------------------------
--                              DRAW MAP
-----------------------------------------------------------------------------------

function Draw_MapState()

  love.graphics.scale(5,5)

  -- Dessine la map
  local x,y = 0,0
  local sx,sy = 0,0
  for l=1,TailleMap do
    x = 0
    for c=1,TailleMap do
      if c==Select.c and l==Select.l then
        sx = x
        sy = y
      end
      
      local idSol = Tilemap[choice_map][l][c]
      love.graphics.draw(dbSols[idSol].Image, x, y)
      x = x + TailleCase
    end
    y = y + TailleCase
  end
  
  -- Dessine les unités
  love.graphics.setColor(1,1,1,1)
  for u=1,#listUnit do
    local unit = listUnit[u]
    local x = (unit.Colonne - 1) * TailleCase
    local y = (unit.Ligne - 1) * TailleCase
    love.graphics.draw(dbUnits[unit.Type].Image[unit.Joueur], x, y)
  end
  
  -- Dessine la sélection
  if Select.Unit == nil then
    love.graphics.setColor(1,1,1,1)
  else
    love.graphics.setColor(1,0,0,1)
  end
  love.graphics.rectangle("line", sx, sy, TailleCase, TailleCase)
  love.graphics.setColor(1,1,1,1)
  
  love.graphics.scale(1/5,1/5)
  love.graphics.setColor(1,1,1,1)
    
  -- GUI
  
  love.graphics.setFont(font_normale)
  for u=1,#listUnit do
    local unit = listUnit[u]
    -- Unité sélectionnée ?
    if Select.c == unit.Colonne and Select.l == unit.Ligne then
      local xStat = (TailleCase*4 * TailleMap) + 120
      love.graphics.print("Type: " ..unit.Type, xStat, 20 + 16*2 )
      love.graphics.print("HP: "..unit.HP, xStat, 20 + 16*3)
      love.graphics.print("Move: "..unit.Range, xStat, 20 + 16*4)
    end
  end

  -- Type de sol
  local xStatSol = (TailleCase*4 * TailleMap) + 120
  local typeSol = Tilemap[choice_map][Select.l][Select.c]
  love.graphics.print("Surface: "..dbSols[typeSol].Name, xStatSol, 5)
  
  -- Joueur en cours
  local xStat = (TailleCase*4 * TailleMap) + 120
  love.graphics.setColor(1,1,0,1)
  love.graphics.print("Joueur en cours : "..Contexte.Joueur, xStat, 20 + 16*27)
  love.graphics.setColor(1,1,1,1)
  
  -- Instructions
  --if Contexte.Etat == "SELECTION" then
    --love.graphics.print("Sélectionnez une unité à déplacer", xStat, 20 + 16*12)
  --elseif Contexte.Etat == "MOVE" then
    --love.graphics.print("Déplacez l'unité dans une des 4 directions", xStat, 20 + 16*12)
  --end
end

function SupprimeUnite(pUnit)
  for n=1, #listUnit do
    if listUnit[n] == pUnit then
      table.remove(listUnit, n)
      break
    end
  end
end

function Update_BattleState(dt)
  local AnimFin = true
  for n=1,#Contexte.BattlePositions[1].Hc do
    if Contexte.BattlePositions[1].Hc[n] < Contexte.BattlePositions[1].H[n] then
      Contexte.BattlePositions[1].Hc[n] = Contexte.BattlePositions[1].Hc[n] + 40*dt
      AnimFin = false
    end
  end
  for n=1,#Contexte.BattlePositions[2].Hc do
    if Contexte.BattlePositions[2].Hc[n] > Contexte.BattlePositions[2].H[n] then
      Contexte.BattlePositions[2].Hc[n] = Contexte.BattlePositions[2].Hc[n] - 40*dt
      AnimFin = false
    end
  end
  if AnimFin == true then
    Contexte.EtatBattle = "RESULTAT"
  end
  if Contexte.EtatBattle == "RESULTAT" then
    Contexte.ChronoBattle = Contexte.ChronoBattle + dt
    if Contexte.ChronoBattle >= 5 then
      -- On applique le résultat des combats
      Contexte.Unit1.HP = math.floor(Contexte.Unit1.HP - Contexte.UnitesPerduesUnit1)
      Contexte.Unit2.HP = math.floor(Contexte.Unit2.HP - Contexte.UnitesPerduesUnit2)
      if Contexte.Unit1.HP <= 0 then
        SupprimeUnite(Contexte.Unit1)
      end
      if Contexte.Unit2.HP <= 0 then
        SupprimeUnite(Contexte.Unit2)
      end
      
      -- TODO
      -- Si plus aucune unités d'une des 2 équipes : victoire
      local nb = {}
      nb[1] = 0
      nb[2] = 0
      for n=1,#listUnit do
        nb[listUnit[n].Joueur] = nb[listUnit[n].Joueur] + 1
      end
      print("Reste ", nb[1], nb[2])
      if nb[1] == 0 or nb[2] == 0 then
        -- Afficher une victoire !!
        print("Victoire !!")
      end
      -- Retour à la map
      Contexte.Etat = "SELECTION"
      Contexte.Unit1.Range = 0
    end
  end
end

-----------------------------------------------------------------------------------
--                              DRAW BATTLE
-----------------------------------------------------------------------------------

function Draw_BattleState()
  love.graphics.scale(2,2)

  love.graphics.draw(dbSols[Contexte.Sol1].ImageBattle, 0, 0)
  if Contexte.Sol2 == TERRAIN_ROUTE_HAUT_SABLE or Contexte.Sol2 == TERRAIN_ROUTE_BAS_SABLE then
    love.graphics.draw(dbSols[Contexte.Sol2].ImageBattle, TailleSet* 2 + 2, 0, 0, -1, 1)
  else
    love.graphics.draw(dbSols[Contexte.Sol2].ImageBattle, TailleSet + 2, 0)
  end
  
  
  local frameArrondie = math.floor(animation_tank_b.frame)
  --Display Unit
  --army 1
  if Contexte.Joueur == 1 then
    if Contexte.Unit1.Type == "TANK" then
      for n=1, #Contexte.BattlePositions[1].V do
        love.graphics.draw(animation_tank_r.image, animation_tank_r.frames[frameArrondie], 
        Contexte.BattlePositions[1].Hc[n],
        Contexte.BattlePositions[1].V[n])
      end
    end
    if Contexte.Unit1.Type == "INFANTRY" then
      for n=1, #Contexte.BattlePositions[1].V do
        love.graphics.draw(animation_infantry_r.image, animation_infantry_r.frames[frameArrondie], 
        Contexte.BattlePositions[1].Hc[n],
        Contexte.BattlePositions[1].V[n])
      end
    end
    if Contexte.Unit1.Type == "HELICO" then
      for n=1, #Contexte.BattlePositions[1].V do
        love.graphics.draw(animation_helico_r.image, animation_helico_r.frames[frameArrondie], 
        Contexte.BattlePositions[1].Hc[n],
        Contexte.BattlePositions[1].V[n])
      end
    end
    
  -- Armée 2
    if Contexte.Unit2.Type == "TANK" then
      for n=1, #Contexte.BattlePositions[2].V do
        love.graphics.draw(animation_tank_b.image, animation_tank_b.frames[frameArrondie], 
        Contexte.BattlePositions[2].Hc[n],
        Contexte.BattlePositions[2].V[n], 0, -1, 1)
      end
    end
    if Contexte.Unit2.Type == "INFANTRY" then
      for n=1, #Contexte.BattlePositions[2].V do
        love.graphics.draw(animation_infantry_b.image, animation_infantry_b.frames[frameArrondie], 
        Contexte.BattlePositions[2].Hc[n],
        Contexte.BattlePositions[2].V[n], 0, -1, 1)
      end
    end
    if Contexte.Unit2.Type == "HELICO" then
      for n=1, #Contexte.BattlePositions[2].V do
        love.graphics.draw(animation_helico_b.image, animation_helico_b.frames[frameArrondie], 
        Contexte.BattlePositions[2].Hc[n],
        Contexte.BattlePositions[2].V[n],0,-1,1)
      end
    end
    --affiche Chef, def
    
    love.graphics.draw(Perso_b.Image[1],160*2,0,0,-1,1)
    love.graphics.draw(Perso_b.Image[2],160*2 - 16,0,0,-1,1)
    love.graphics.draw(Perso_b.Image[3],160*2,16,0,-1,1)
    love.graphics.draw(Perso_b.Image[4],160*2 - 16,16,0,-1,1)
    
    love.graphics.draw(Perso_r.Image[1], 32,0,0,-1,1)
    love.graphics.draw(Perso_r.Image[2], 16,0,0,-1,1)
    love.graphics.draw(Perso_r.Image[3], 32,16,0,-1,1)
    love.graphics.draw(Perso_r.Image[4], 16,16,0,-1,1)
    
    if Contexte.Sol1 == TERRAIN_SABLE then
      love.graphics.draw(Def_i.Image[1], 32,0)
      love.graphics.draw(Def_i.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_SABLE then
      love.graphics.draw(Def_i.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_i.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_CACTUS then
      love.graphics.draw(Def_t.Image[1], 32,0)
      love.graphics.draw(Def_t.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_CACTUS then
      love.graphics.draw(Def_t.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_t.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_PONT_Y then
      love.graphics.draw(Def_t.Image[1], 32,0)
      love.graphics.draw(Def_t.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_PONT_Y then
      love.graphics.draw(Def_t.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_t.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_PONT_X then
      love.graphics.draw(Def_t.Image[1], 32,0)
      love.graphics.draw(Def_t.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_PONT_X then
      love.graphics.draw(Def_t.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_t.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_MAISON_SABLE then
      love.graphics.draw(Def_h.Image[1], 32,0)
      love.graphics.draw(Def_h.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_MAISON_SABLE then
      love.graphics.draw(Def_h.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_h.Image[2], 160*2 -48,0,0,-1,1)
    end

  end
  if Contexte.Joueur == 2 then
    if Contexte.Unit1.Type == "TANK" then
      for n=1, #Contexte.BattlePositions[1].V do
        love.graphics.draw(animation_tank_r.image, animation_tank_r.frames[frameArrondie], 
        Contexte.BattlePositions[1].Hc[n],
        Contexte.BattlePositions[1].V[n])
      end
    end
    if Contexte.Unit1.Type == "INFANTRY" then
      for n=1, #Contexte.BattlePositions[1].V do
        love.graphics.draw(animation_infantry_r.image, animation_infantry_r.frames[frameArrondie], 
        Contexte.BattlePositions[1].Hc[n],
        Contexte.BattlePositions[1].V[n])
      end
    end
    if Contexte.Unit1.Type == "HELICO" then
      for n=1, #Contexte.BattlePositions[1].V do
        love.graphics.draw(animation_helico_r.image, animation_helico_r.frames[frameArrondie], 
        Contexte.BattlePositions[1].Hc[n],
        Contexte.BattlePositions[1].V[n])
      end
    end
    
  -- Armée 2
    if Contexte.Unit2.Type == "TANK" then
      for n=1, #Contexte.BattlePositions[2].V do
        love.graphics.draw(animation_tank_b.image, animation_tank_b.frames[frameArrondie], 
        Contexte.BattlePositions[2].Hc[n],
        Contexte.BattlePositions[2].V[n], 0, -1, 1)
      end
    end
    if Contexte.Unit2.Type == "INFANTRY" then
      for n=1, #Contexte.BattlePositions[2].V do
        love.graphics.draw(animation_infantry_b.image, animation_infantry_b.frames[frameArrondie], 
        Contexte.BattlePositions[2].Hc[n],
        Contexte.BattlePositions[2].V[n], 0, -1, 1)
      end
    end
    if Contexte.Unit2.Type == "HELICO" then
      for n=1, #Contexte.BattlePositions[2].V do
        love.graphics.draw(animation_helico_b.image, animation_helico_b.frames[frameArrondie], 
        Contexte.BattlePositions[2].Hc[n],
        Contexte.BattlePositions[2].V[n],0,-1,1)
      end
    end
    
    --affiche Chef, def

    
    love.graphics.draw(Perso_b.Image[1],0,0)
    love.graphics.draw(Perso_b.Image[2],16,0)
    love.graphics.draw(Perso_b.Image[3],0,16)
    love.graphics.draw(Perso_b.Image[4],16,16)
    
    love.graphics.draw(Perso_r.Image[1],160*2 - 32,0)
    love.graphics.draw(Perso_r.Image[2],160*2 - 16,0)
    love.graphics.draw(Perso_r.Image[3],160*2 - 32,16)
    love.graphics.draw(Perso_r.Image[4],160*2 - 16,16)
    
    
    if Contexte.Sol1 == TERRAIN_SABLE then
      love.graphics.draw(Def_i.Image[1], 32,0)
      love.graphics.draw(Def_i.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_SABLE then
      love.graphics.draw(Def_i.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_i.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_CACTUS then
      love.graphics.draw(Def_t.Image[1], 32,0)
      love.graphics.draw(Def_t.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_CACTUS then
      love.graphics.draw(Def_t.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_t.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_PONT_X then
      love.graphics.draw(Def_t.Image[1], 32,0)
      love.graphics.draw(Def_t.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_PONT_X then
      love.graphics.draw(Def_t.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_t.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_PONT_Y then
      love.graphics.draw(Def_t.Image[1], 32,0)
      love.graphics.draw(Def_t.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_PONT_Y then
      love.graphics.draw(Def_t.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_t.Image[2], 160*2 -48,0,0,-1,1)
    end
    
    if Contexte.Sol1 == TERRAIN_MAISON_SABLE then
      love.graphics.draw(Def_h.Image[1], 32,0)
      love.graphics.draw(Def_h.Image[2], 48,0)
    end
    if Contexte.Sol2 == TERRAIN_MAISON_SABLE then
      love.graphics.draw(Def_h.Image[1], 160*2 -32,0,0,-1,1)
      love.graphics.draw(Def_h.Image[2], 160*2 -48,0,0,-1,1)
    end
  end
  
  love.graphics.scale(1/2,1/2)
  love.graphics.setFont(font_big)
  
  
  
  
  -- Affichage des HP de chaque armée
  if Contexte.EtatBattle == "RESULTAT" then
    love.graphics.setColor(1,0,0,1)
    love.graphics.print(math.floor(Contexte.Unit1.HP - Contexte.UnitesPerduesUnit1), 140, 15)
    love.graphics.setColor(1,1,1,1)
    if math.floor(Contexte.Unit2.HP - Contexte.UnitesPerduesUnit2) < 10 then
      love.graphics.setColor(1,0,0,1)
      love.graphics.print(math.floor(Contexte.Unit2.HP - Contexte.UnitesPerduesUnit2), 160*2.7, 15)
      love.graphics.setColor(1,1,1,1)
    else
      love.graphics.setColor(1,0,0,1)
      love.graphics.print(math.floor(Contexte.Unit2.HP - Contexte.UnitesPerduesUnit2), 160*2.5, 15)
      love.graphics.setColor(1,1,1,1)
    end
  else
    love.graphics.setColor(1,0,0,1)
    love.graphics.print(Contexte.Unit1.HP,140, 15)
    love.graphics.setColor(1,1,1,1)
    if Contexte.Unit2.HP < 10 then
      love.graphics.setColor(1,0,0,1)
      love.graphics.print(Contexte.Unit2.HP, 160*2.7, 15)
      love.graphics.setColor(1,1,1,1)
    else
      love.graphics.setColor(1,0,0,1)
      love.graphics.print(Contexte.Unit2.HP, 160*2.5, 15)
      love.graphics.setColor(1,1,1,1)
    end
  end
end

function love.draw()
  --draw menu
  if Contexte.Etat == "MENU" then
    groupTest:draw()
  end
  
  if Contexte.Etat == "COMMAND" then
    love.graphics.scale(1/5,1/5)
    love.graphics.draw(Image_menu.Image[1], 470, 1400)
    --love.graphics.draw(Image_menu.Image[2], 870, 1400)
    love.graphics.scale(5,5)
    groupPlay1:draw()
  end
  
  if Contexte.Etat == "SELECTION" or Contexte.Etat == "MOVE" or Contexte.Etat == "SELECTFIRE" then
    Draw_MapState()
  elseif Contexte.Etat == "BATTLE" then
    Draw_BattleState()
  end
  if Contexte.Etat == "INFORMATION" then
    --Draw_Day()
    --Draw_Information()
  end
  
  if count_day % 2 == 0 then
    Draw_Day()
  end
  if count_day/2 == 3 then
    Draw_Evil()
    Draw_Bulle()
  end
end

function SelectionnePositions(pListe, pNbPosition)
  local list_pos = {70, 79, 88, 97, 106}
  
  while pNbPosition > 0 do
    local unit_sort = math.random(1, #list_pos)
    table.insert(pListe, list_pos[unit_sort])
    table.remove(list_pos, unit_sort)
    pNbPosition = pNbPosition - 1
  end
  -- Trier la liste
  function my_sort(a,b)
    return a < b
  end
  table.sort(pListe, my_sort)
end


function StartBattle(Unit1, Unit2, Sol1, Sol2)
  print(Sol1, Sol2)
  Contexte.Unit1 = Unit1
  Contexte.Unit2 = Unit2
  Contexte.Sol1 = Sol1
  Contexte.Sol2 = Sol2
  Contexte.Etat = "BATTLE"
  Contexte.EtatBattle = "ANIMATION"
  Select.Unit = nil
  
  Contexte.BattlePositions = {}
  Contexte.BattlePositions[1] = {}
  Contexte.BattlePositions[1].V = {}
  Contexte.BattlePositions[1].H = {}
  Contexte.BattlePositions[1].Hc = {}
  Contexte.BattlePositions[2] = {}
  Contexte.BattlePositions[2].V = {}
  Contexte.BattlePositions[2].H = {}
  Contexte.BattlePositions[2].Hc = {}
  
  
  -- Tire au sort les positions verticales de chaque armée
  local nbPos1 = math.max(1, math.floor(Unit1.HP/2))
  local nbPos2 = math.max(1, math.floor(Unit2.HP/2))
  SelectionnePositions(Contexte.BattlePositions[1].V, nbPos1)
  SelectionnePositions(Contexte.BattlePositions[2].V, nbPos2)
  -- Calcul des positions horizontales
  -- Armée 1
  for n=1, #Contexte.BattlePositions[1].V do
    Contexte.BattlePositions[1].H[n] = love.math.random(4, 130)
    Contexte.BattlePositions[1].Hc[n] = 0
  end
  -- Armée 2
  for n=1, #Contexte.BattlePositions[2].V do
    Contexte.BattlePositions[2].H[n] = love.math.random(180, 300)
    Contexte.BattlePositions[2].Hc[n] = (160*2)
  end
  
  --Resultat Combat
  local D1 = dbUnits[Unit1.Type].Degats[Unit2.Type]
  local D2 = dbUnits[Unit2.Type].Degats[Unit1.Type]
  local bonusDef1 = starsDef[Sol1]
  local bonusDef2 = starsDef[Sol2]
  -- Formule : D * PVatt /10 * ( 1 - starsDef * PVdef /100 )
  
  -- Degats subits par le défenseur
  print("Défenseur ===============")
  local DegatsUnit2 = D1 * Unit1.HP / 10 * ( 1 - bonusDef2 * Unit2.HP / 100)
  print("Dégats : ", DegatsUnit2)
  local UnitesPerduesUnit2 = DegatsUnit2 * Unit2.HP / 100
  print("Unités perdues", UnitesPerduesUnit2)
  -- Degats subits par l'attaquant
  print("Attaquant ===============")
  local DegatsUnit1 = D2 * Unit2.HP / 10 * ( 1 - bonusDef1 * Unit1.HP / 100)
  print("Dégats : ", DegatsUnit1)
  local UnitesPerduesUnit1 = DegatsUnit1 * Unit1.HP / 100
  print("Unités perdues", UnitesPerduesUnit1)
  
  -- Mémorise le résultat
  Contexte.UnitesPerduesUnit1 = UnitesPerduesUnit1
  Contexte.UnitesPerduesUnit2 = UnitesPerduesUnit2
  
  -- Chrono d'affichage du résultat de la bataille
  Contexte.ChronoBattle = 0

end

function MoveUnit(pDirection)
  local U = Select.Unit
  local sol = 0
  local UnitGoto = nil
  
  -- Récupère le sol vers lequel on se dirige
  if pDirection == "right" then
    sol = Tilemap[choice_map][U.Ligne][U.Colonne + 1]
    UnitGoto = UnitUnder(Select.l, Select.c + 1)
  elseif pDirection == "left" then
    sol = Tilemap[choice_map][U.Ligne][U.Colonne - 1]
    UnitGoto = UnitUnder(Select.l, Select.c - 1)
  elseif pDirection == "up" then
    sol = Tilemap[choice_map][U.Ligne - 1][U.Colonne]
    UnitGoto = UnitUnder(Select.l - 1, Select.c)
  elseif pDirection == "down" then
    sol = Tilemap[choice_map][U.Ligne + 1][U.Colonne]
    UnitGoto = UnitUnder(Select.l + 1, Select.c)
  end
  
  if UnitGoto ~= nil then
    if UnitGoto.Joueur ~= Contexte.Joueur and dbUnits[U.Type].NbAtk == 1 then
      StartBattle(U, UnitGoto, Tilemap[choice_map][U.Ligne][U.Colonne], sol)
      dbUnits[U.Type].NbAtk = 0
      return
    end
  end
  
  -- BONUS POUR LES UNITS
  
  local cost = dbUnits[U.Type].Effects[sol]
  if U.Range >= cost and cost ~= 0 then
    if pDirection == "right" then
      if UnitGoto == nil then
        Select.c = Select.c + 1
        Select.Unit.Colonne = Select.Unit.Colonne + 1
        U.Range = U.Range - cost
      end
      if U.Type == "INFANTRY" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 2
        U.attaque_global = U.attaque_global + U.BonusAtk
      elseif U.Type == "TANK" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = -1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else if U.Type == "HELICO" and sol == 2 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 0
      end
    end
    elseif pDirection == "left" then
      if UnitGoto == nil then
        Select.c = Select.c - 1
        Select.Unit.Colonne = Select.Unit.Colonne - 1
        U.Range = U.Range - cost
      end
      if U.Type == "INFANTRY" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 2
        U.attaque_global = U.attaque_global + U.BonusAtk
      elseif U.Type == "TANK" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = -1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else if U.Type == "HELICO" and sol == 2 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 0
      end
    end
    elseif pDirection == "down" then
      if UnitGoto == nil then
        Select.l = Select.l + 1
        Select.Unit.Ligne = Select.Unit.Ligne + 1
        U.Range = U.Range - cost
      end
      if U.Type == "INFANTRY" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 2
        U.attaque_global = U.attaque_global + U.BonusAtk
      elseif U.Type == "TANK" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = -1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else if U.Type == "HELICO" and sol == 2 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 0
      end
    end
    elseif pDirection == "up" then
      if UnitGoto == nil then
        Select.l = Select.l - 1
        Select.Unit.Ligne = Select.Unit.Ligne - 1
        U.Range = U.Range - cost
      end
      if U.Type == "INFANTRY" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 2
        U.attaque_global = U.attaque_global + U.BonusAtk
      elseif U.Type == "TANK" and sol == 3 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = -1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else if U.Type == "HELICO" and sol == 2 then
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 1
        U.attaque_global = U.attaque_global + U.BonusAtk
      else
        U.attaque_global = U.attaque_actuelle
        U.BonusAtk = 0
      end
    end
    
    end
  end
end

-----------------------------------------------------------------------------------
--                                    KEY
-----------------------------------------------------------------------------------

function love.keypressed(k)
  --menu
  if k == "backspace" then
    if Contexte.Etat == "COMMAND" then
      Contexte.Etat = "MENU"
    end
  end
  
  -- Sélection
  if Contexte.Etat == "MOVE" then
    if k == "right" and Select.c < TailleMap then
      MoveUnit(k)
      return
    end
    if k == "left" and Select.c > 1 then
      MoveUnit(k)
      return
    end
    if k == "up" and Select.l > 1 then
      MoveUnit(k)
      return
    end

    if k == "down" and Select.l < TailleMap then
      MoveUnit(k)
      return
    end
  end
  -- Move
  if Contexte.Etat == "SELECTION" then
    if k == "right" and Select.c < TailleMap then
      Select.c = Select.c + 1
    end
    if k == "left" and Select.c > 1 then
      Select.c = Select.c - 1
    end
    if k == "up" and Select.l > 1 then
      Select.l = Select.l - 1
    end
    if k == "down" and Select.l < TailleMap then
      Select.l = Select.l + 1
    end
  end
  -- Sélection d'une unité
  if k == "space" and Contexte.Etat == "SELECTION" then
    local unit2Select = UnitUnder(Select.l, Select.c)
    if unit2Select ~= nil then
      if unit2Select.Joueur == Contexte.Joueur then
        Select.Unit = unit2Select
        Contexte.Etat = "MOVE"
        return
      end
    end
  end
  -- Gestion de l'annulation
  if (k == "space") and Contexte.Etat == "MOVE" then
    Select.Unit = nil
    Contexte.Etat = "SELECTION"
  end
  -- Fin de tour
  if k == "f" and Contexte.Etat == "SELECTION" then
    count_day = count_day + 1
    if Contexte.Joueur == 1 then
      Contexte.Joueur = 2
    else
      Contexte.Joueur = 1
    end
    FinDeTour()
  end
  
  if k == "i" then
    Contexte.Etat = "INFORMATION"
  end
  
  if k == "escape" then
    Select.Unit = nil
    Contexte.Etat = "SELECTION"
  end

  -- Revenir a l'etat de map
  if k == "b" and Contexte.Etat == "BATTLE" then
    Draw_MapState()
  end
end