local myGUI = require("GUI")

function Startlevel1(pFunction)
  Button1:setEvent("start_game", pFunction)
end

function ButtonLevel1()
  main.Contexte.Etat = "COMMAND"
  Button1 = myGUI.newButton(330, 250, 130, 43,"lvl 1", font_normale, {151, 220, 250})
  Button1:setEvent("start_level_1", Startlevel1)
  groupPlay = myGUI.newGroup()
  groupPlay:addElement(Button1)
end