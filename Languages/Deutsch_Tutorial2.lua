tutorial = {}

tutMap = {}
tutMap.width = 5
tutMap.height = 5

for i = 0, tutMap.width+1 do
  tutMap[i] = {}
end

tutMap[1][1] = "C"
tutMap[2][1] = "C"
tutMap[2][2] = "C"
tutMap[2][3] = "C"
tutMap[3][2] = "C"
tutMap[4][2] = "C"
tutMap[5][2] = "C"


tutorialSteps = {}
currentStep = 1

currentStepTitle = ""

currentTutBox = nil

local CODE_variables1 = parseCode([[
-- Definiere eine Variable names "variable1":
variable1 = 10
-- Definiere eine zweite:
variable2 = 20

-- Addiere die beiden Variablen und speichere sie in variable3:
variable3 = variable1 + variable2
-- Gib das Ergebnis in der Konsole aus:
print(variable3)  -- gibt 30 aus
]])

local CODE_variables2 = parseCode([[
-- Definiere eine Variable names "variable1":
variable1 = 10
-- Definiere eine zweite:
variable2 = "test"

-- Das folgende wird nicht funktionieren
-- (Ein Fehler wird angezeigt, sobald du 'Neu Laden' drückst)
variable3 = variable1 + variable2
]])
local CODE_variables3 = parseCode([[
-- Addiere "5.1" an das Ende von "Lua".
-- Das Ergebnis wird so aussehen: "Lua 5.1".
meinText = "Lua " .. 5.1

variable1 = 10
variable2 = "test"
-- Füge 10 and das Ende von "test" hinzu:
variable3 = variable2 .. variable1
-- Ergebnis: "test10"
]])

local CODE_counter = parseCode([[
function ai.init()
  buyTrain(1,1)
  -- Erzeuge eine Variable namens "zaehler"
  zaehler = 0
end

function ai.chooseDirection()
  -- Zaehle die Weichen:
  zaehler = zaehler + 1
  
  -- Gib die Anzahl der Weichen aus, 
  -- an denen wir vorbei gefahren sind:
  print("Das war Weiche nummer: " .. zaehler)
end
]])

local CODE_functions1 = parseCode([[
function meineFunktion(argument1, argument2, ... )
  -- mach etwas mit den Argumenten
  -- du kannst auch etwas zurück geben
end

-- call the function with three arguments:
meineFunktion(1, "test", "3")
]])

local CODE_functions2 = parseCode([[
function subtrahiere(a, b)
  c = a - b
  return c
end

result = subtrahiere(10, 5)
print(result) -- gibt '5' aus
]])

local CODE_ifthenelse1 = parseCode([[
if AUSDRUCK1 then
  -- mach irgend was
elseif AUSDRUCK2 then
  -- mach was anderes
else
  -- oder mach etwas drittes
end

-- Der Code 'mach irgendwas' wird nur ausgeführt wenn
-- der AUSDRUCK wahr ist. Du wirst bald lernen was
-- ein AUSDRUCK ist.
]])

local CODE_ifthenelse2 = parseCode([[
variable = 10

if variable == 10 then
  print("Die Variable ist 10...")
elseif variable > 10000 then
  print("Die Variable ist groooooß!")
else
  print("Ist weder 10 noch sehr grooooß...")
end
]])



local CODE_whileLoop = parseCode([[
breuite = 10
x = 0
--Gibt 3 aus, dann 6, dann 9, dann 12.
while x < breite do
  x = x + 3
  print(x)
end
]])

local CODE_whileLoop2 = parseCode([[
function ai.chooseDirection()
  -- Zähle die Weichen:
  zaehler = zaehler + 1
  
  i = 0 -- Eine neue Zähl-Variable
  text = "" -- Initialisiere leeren String
  while i < zaehler do
    text = text .. "x" 
    i = i + 1
  end
  -- Gib das Resultat aus:
  print(text)
end
]])

local CODE_forLoop = parseCode([[
-- Das gibt die Nummern 1 bis 10 aus:
breite = 10
for i = 1, breite, 1 do
  print(i)
end
-- Und das nur die geraden Nummern ( 2, 4, 6, 8, 10)
breite = 10
for i = 2, breite, 2 do
  print(i)
end
]])

local CODE_loop3 = parseCode([[
i = 1
-- durchforste die Liste aller Passagiere:
while i <= #passagiere do
  -- Jeder Passagier hat einen Namen, auf den du mit
  -- 'passgier[number].name' zugreifen kannst, Finde jetzt Skywalker.
  if passagiere[i].name == "Skywalker" then
    print("Ich habe Luke gefunden!!")
    break -- stop die Schleife!
  end
  i = i + 1
end
]])

local CODE_tables1 = parseCode([[
-- Beispiel 1:
myTabelle = {var1=10, var2="lol", var3="a bier"}

-- Beispiel 2: (Zeilenumbrüche sind auch erlaubt)
meineTabelle = {
  x_Pos = 10,
  y_Pos = 20
}
-- Beispiel 3:
berg1 = {neigung="steil", schnee=true, groesse=20}
berg2 = {neigung="steil", schnee=false, groesse=10}
]])

local CODE_tables2 = parseCode([[
meineTabelle = {
  x = 10,
  y = 20
}

-- berechne den Durchschnitt:
ergebnis = (meineTabelle.x + meineTabelle.y)/2
print(ergebnis)
-- gibt 15 aus, weil (10+20)/2 = 15
]])

local CODE_tables3 = parseCode([[
meineTabelle = { x = 10, y = 20 }

-- füge ein neues Element namens 'z' hinzu:
meineTabelle.z = 50

-- entferne Element 'x':
meineTabelle.x = nil

-- Das verursacht einen Fehler(Error) weil 'x' nicht existiert:
a = meineTabelle.x + 10
]])

local CODE_tables4 = parseCode([[
-- Wenn du die Namen weglässt, wird Lua automatisch
-- die Nummern [1], [2], [3] und so weiter verwenden:
meineListe = {"Aepfel", "sind", "Rot"}

print(meineListe[1]) -- gibt 'Aepfel' aus.

-- Ersetze "Rot" mit "Gruen":
meineListe[3] = "Gruen"

-- gibr "AepfelsindGruen" aus
print(meineListe[1] .. meineListe[2] .. meineListe[3])

]])

local CODE_hintGoEast = parseCode([[
-- Versuche das:
function ai.chooseDirection()
  print("Ich will nach Norden!")
  return "E"  -- E weil Norden auf englisch East heisst.
end
]])

local CODE_hintGoEastThenSouth = parseCode([[
function ai.init()
  buyTrain(1,1)
  zaehler = 0
end

function ai.chooseDirection()
  zaehler = zaehler + 1
  if zaehler == 1 then
    print("Erste Weiche! Nach Osten!")
    return "E"
  else
    print("Nach Süden!")
    return "S"
  end
end
]])



function nextTutorialStep()
  currentStep = currentStep + 1
  showCurrentStep()
end
function prevTutorialStep()
  currentStep = currentStep - 1
  showCurrentStep()
end

function showCurrentStep()
  if cBox then
    codeBox.remove(cBox)
    cBox = nil
  end
  if additionalInfoBox then
    tutorialBox.remove(additionalInfoBox)
    additionalInfoBox = nil
  end
  if tutorialSteps[currentStep].event then
    tutorialSteps[currentStep].event()
  end
  if currentTutBox then
    TUT_BOX_X = currentTutBox.x
    TUT_BOX_Y = currentTutBox.y
    tutorialBox.remove(currentTutBox)
  end
  
  if tutorialSteps[currentStep].stepTitle then
    currentStepTitle = tutorialSteps[currentStep].stepTitle
  else
    local l = currentStep - 1
    while l > 0 do
      if tutorialSteps[l] and tutorialSteps[l].stepTitle then
        currentStepTitle = tutorialSteps[l].stepTitle
      end
      l = l - 1
    end
  end
    
  currentTutBox = tutorialBox.new( TUT_BOX_X, TUT_BOX_Y, tutorialSteps[currentStep].message, tutorialSteps[currentStep].buttons )
end

function startThisTutorial()

  --define buttons for message box:
  if currentTutBox then tutorialBox.remove(currentTutBox) end
  currentTutBox = tutorialBox.new( TUT_BOX_X, TUT_BOX_Y, tutorialSteps[1].message, tutorialSteps[1].buttons )
  
  STARTUP_MONEY = 25
  timeFactor = 0.5
end

function tutorial.start()
  
  aiFileName = "TutorialAI2.lua"
  
  --ai.backupTutorialAI(aiFileName)
  ai.createNewTutAI(aiFileName, fileContent)

  stats.start( 1 )
  tutMap.time = 0
  map.print()
  
  loadingScreen.reset()
  loadingScreen.addSection("Neue Karte")
  loadingScreen.addSubSection("Neue Karte", "Größe: " .. tutMap.width .. "x" .. tutMap.height)
  loadingScreen.addSubSection("Neue Karte", "Zeit: Tag")
  loadingScreen.addSubSection("Neue Karte", "Tutorial 2: Links oder Rechts?")

  train.init()
  train.resetImages()
  
  
  ai.restart()  -- make sure aiList is reset!Next
  
  ok, msg = pcall(ai.new, AI_DIRECTORY .. aiFileName)
  if not ok then
    print("Fehler: " .. msg)
  else
    stats.setAIName(1, aiFileName:sub(1, #aiFileName-4))
    train.renderTrainImage(aiFileName:sub(1, #aiFileName-4), 1)
  end
  
  tutorial.noTrees = true   -- don't render trees!
  
  map.generate(nil,nil,1,tutMap)
  
  tutorial.createTutBoxes()
  
  tutorial.mapRenderingDoneCallback = startThisTutorial 
  
  menu.exitOnly()
end


function tutorial.endRound()

end

local codeBoxX, codeBoxY = 0,0
local tutBoxX, tutBoxY = 0,0

--[[
function additionalInformation(text)
  return function()
    if not additionalInfoBox then
      if currentTutBox then
        TUT_BOX_X = currentTutBox.x
        TUT_BOX_Y = currentTutBox.y
      end
      if TUT_BOX_Y + TUT_BOX_HEIGHT + 50 < love.graphics.getHeight() then   -- only show BELOW the current box if there's still space there...
        additionalInfoBox = tutorialBox.new(TUT_BOX_X, TUT_BOX_Y + TUT_BOX_HEIGHT +10, text, {})
      else    -- Otherwise, show it ABOVE the current tut box!
        additionalInfoBox = tutorialBox.new(TUT_BOX_X, TUT_BOX_Y - 10 - TUT_BOX_HEIGHT, text, {})
      end
    end
  end
end
]]--


function tutorial.createTutBoxes()

  CODE_BOX_X = love.graphics.getWidth() - CODE_BOX_WIDTH - 30
  CODE_BOX_Y = (love.graphics.getHeight() - TUT_BOX_HEIGHT)/2 - 50
  
  local k = 1
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Und wohin jetzt??"
  tutorialSteps[k].message = 
    "Willkommen zum zweiten Tutorial\n\nJetzt lernst Du:\n"..
    "1) Mit Weichen umzugehen\n"..
    "2) Lua Grundlagen\n"..
    "3) Was man mit mehreren Passagieren anstellt\n"..
    "4) Was VIPs sind"
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Starte Tutorial", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Lua: Variablen"
  tutorialSteps[k].message = 
    "Ich zeige dir jetzt wie man Lua programmiert.\n"..
    "Allerdings nur die Grundlagen. "..
    "Wenn du noch nie programmiert hast, wird es viel neues sein, "..
    "aber halte durch! Du brauchst jetzt nicht alles wissen.\n"..
    "In Lua, erzeugst du Variablen einfach indem du einen Wert "..
    "(rechte Seite des =) einem Namen (linke Seite des =) zuweist.\n"..
    "Schau dir die Beispiele im Code-Kasten an."
  tutorialSteps[k].event = function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_variables1)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Du kannst text oder auch andere Dinge einer Variable zuweisen. "..
    "Um Lua zu zeigen dass etwas als Text behandelt werden soll, "..
    "musst du den Text in Hochkomma (\") schreiben.\n\n"..
    "Du kannst aber nicht einfach Text und Zahlen miteinander addieren, "..
    "weil Lua nicht weiß wie es Text und Zahlen addieren soll.\n"..
    "Beispiele findest du wieder im Code-Kasten"
  tutorialSteps[k].event = function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_variables2)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Mehr Info", event = additionalInformation(
    "Wenn du schon andere Programmiersprachen kennst, sei vorsichtig: "..
    "Lua ist sehr nachsichtig bei den verschiednen Typen von Variablen. "..
    "Du kannst Text in ein Variable stecken, in der davor eine Zahl war "..
    "und anders herum. Das lässt dein Programm nicht abstürzen, "..
    "aber du könntest später Probleme damit bekommen."
    ), inBetweenSteps = true}
  tutorialSteps[k].buttons[3] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Wenn du Text oder Zahlen aneinander hängen willst, kannst du dass mit "..
    ".. zwischen ihnen. Das Erbegnis is wieder Text, welchen du in einer neuen ".. 
    "Variable speichern, in der Konsole ausgeben, oder irgend etwas anderes "..
    "damit machen kannst.\n\nBeispiele, wie immer, im Code-Kasten."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_variables3)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Probieren wirs aus!\nWir schreiben jetzt Code, der die Weichen zählt, "..
    "an denen unser trAIn vorbei fährt.\nWenn ein trAIn eine Weiche erreicht, "..
    "wird das Spiel immer versuchen die Funktion 'ai.chooseDirection()' "..
    "in dem Code deiner KI aufzurufen. Das bedeutet, dass wenn in deiner KI "..
    "eine Funktion ai.chooseDirection ist, du mit dieser immer etwas anstellen "..
    "kannst, sobald dein trAIn an einer Weiche vorbei fährt."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Öffne das neu erstellte TutorialAI2.lua, im selben Ordner wie zuvor.\n\n"..
    "Es befindet sich bereits etwas Code darin, deshalb fährt der trAIn auch schon umher.\n"..
    "Füge den Code ausm Code-Kasten ein (ersetze die bereits existierende ai.init) und klick auf 'Neu Laden'."
  tutorialSteps[k].event = eventCounter(k)
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Mehr Info", event = additionalInformation(
    "Der Code wird nicht funktionieren wenn du die Zeile 'zaehler = 0', "..
    "vergessen hast, weil bevor du 1 zu der zaehler Variable addieren kannst, "..
    "muss sie Initialisiert sein.\nWeil ai.init immer VOR ai.chooseDirection aufgerufen "..
    "wird, wird dein Code funktionieren."
    ), inBetweenSteps = true}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Es scheint funktioniert zu haben!\n\nPrüfe ob die KI richtig zählt "..
    "Wenn nicht, ändere deinen Code bis es funktioniert. Falls doch, klicke auf weiter"
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Lua: if, then, else; falls, dann, sonst"
  tutorialSteps[k].message = 
    "Du wirst in deinem Code Entscheidungen treffen müssen. "..
    "Dafür sind, 'if-then-else' Anweisungen nützlich.\n"..
    "Eine 'if' Anweisung prüft ob ein AUSDRUCK wahr ist. Falls ja, "..
    "führt es den Code in der folgenden 'then' Anweisung aus. Anschließend, "..
    "schreibst du 'elseif', 'else' oder 'end' um den Code Block zu beenden.\n"..
    "Schau dir die Beispiele an."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_ifthenelse1)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
  "Ein 'AUSDRUCK' ist ein Stück Code, welches Lua entweder als wahr(true) oder falsch(false) interpretiert. "..
  "Fall Lua den AUSDRUCK als wahr interpretiert hat, führt es den Code aus, anderfalls nicht. "..
  "Beispiele von AUSDRÜCKEN findest du im Code-Kasten. Beachte dass du hier kein '=' benützen kannst. "..
  "Stattdessen musst du '==' verwenden! Sonst ist es eine Zuweisung, "..
  "also nichts was Lua auf wahr/falsch testet.\nSchau dir 'Mehr Info' an."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_ifthenelse2)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Mehr Info", event = additionalInformation(
    "1) A == B (Sind A und B gleich?)\n2) A > B (Ist A größer als B?)\n"..
    "3) A <= B (Ist A kleiner oder gleich B?)\n4) A ~= B (Ist A ungleich B)"), inBetweenSteps = true}
  tutorialSteps[k].buttons[3] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Eine letzte Bemerkung zu AUSDRÜCKEN: Wenn du schon programmiert hast, "..
    "kennst du vielleicht den AUSDRUCK A != B (A ungleich B). Aus irgendeinem Grund, "..
    "verwendet Lua A ~= B stattdessen!\n\nif variable ~= 10 then\n...\nend"
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Lua: Schleifen"
  tutorialSteps[k].message = 
  "While-Schleifen sind auch ein nützliches Feature.\n".. 
  "Sie lassen uns etws wiederholen bis der AUSDRUCK falsch ist.\n\n"..
  "while AUSDRUCK do\n(dein zu wiederholender Code)\nend"
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_whileLoop)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
  "Zeit zum ausprobieren!\nWir verändern unsere ai.chooseDirection. "..
  "Anstatt bei jeder Weiche die Nummer auszugeben, werden wir jetzt "..
  "den Buchstaben 'x' so oft ausgeben, wie wir eine Weiche passiert haben. "..
  "(Beim ersten mal 'x', beim zweiten mal'xx' und so weiter.) "..
  "Dazu benützen wir eine Variable namens 'zaehler', genau wie davor. "..
  "Dann addieren wir 'x' ans Ende eines Textes, und zwar so oft wie unser 'zaehler' groß ist. "
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "... und hier ist der Code. Die Zeile text = \"\" erzeugt einen leeren Text "..
    "(auch 'String' genannt), und i=0 startet einen neuen Zähler, damit wir zählen können "..
    "wieviele 'x' wir zum Text addiert haben.\nÄndere deine ai.chooseDirection Funktion, "..
    "lade neu, und probiere es aus.\n\nWenn es funktioniert, Super!, klicke auf 'Weiter'."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_whileLoop2)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  --[[
  tutorialSteps[k] = {}
  tutorialSteps[k].message = "For-Loops let you do something a certain number of times. They work like this:\nfor i = START, END, STEP do\n(your code to repeat)\nend\nThis will count from START to END (using STEP as a stepsize)"
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_forLoop)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Back", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "More Info", event = additionalInformation("There's also the 'generic' for loop which this tutorial won't cover. That's a very nice feature as well, check out the Lua documentation online for details."), inBetweenSteps = true}
  tutorialSteps[k].buttons[3] = {name = "Next", event = nextTutorialStep}
  k = k + 1
  ]]--
  
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Lua: Funktionen!"
  tutorialSteps[k].message = 
    "Du hast im ersten Tutorial bereits einiges über Funktionen gelernt\n"..
    "Eine Funktion beginnt mit dem Wort 'function', gefolgt "..
    "vom Funktionsnamen und den Argumenten welche sie erwartet in Klammern (). "..
    "Anschließend kommt der Funktions-Körper, wo dein Code rein kommt. Wenn du magst, "..
    "kannst du eine beliebige Anzahl an Texten oder Zahlen mit dem 'return' Ausdruck zurück geben."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_functions1)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Eine Funktion endet mit dem Wort 'end'.\nSobald eine Funktion definiert ist, "..
    "kannst du sie mit dem Funktionsnamen aufrufen und Argumente an sie übergeben."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_functions1)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Hier ist ein weiteres einfaches Beispiel.\n Wenn diese Funktion aufgerufen wird, "..
    "gibt sie eine Zahl (c) zurück, welche direkt in eine Variable (result) gespeicher wurde. "..
    "Diese Variable wird in der Konsole ausgegeben"
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_functions2)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "In dieser Karte ist ein neues Element: Eine Weiche. Immer wenn ein trAIn "..
    "eine Weiche erreicht, muss deine KI entscheiden in welche Richtung sie weiter fährt. "..
    "Es gibt 4 Richtungen in die dein trAIn fahren kann: Norden(N), Süden(S), Osten (E) und Westen(W). "..
    "Zum Beispiel, die Weiche auf dieser Karte erlaubt einen trAInnach Norden (oben), "..
    "Osten (rechts) und Süden (unten) zu fahren.\nIm Code, werden die Richtungen "..
    "\"N\", \"S\", \"E\" und \"W\" genannt."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Schau dir den trAIn auf der Karte an. Sobald er eine Weiche erreicht, weiß er nicht "..
    "was er tun soll, weil wir es ihm noch nicht gesagt haben.\nDas vorgegebene Verhalten "..
    "ist nach Norden \"N\" zu fahren wenn er kann. Falls nicht (weil er aus \"N\" kommt oder "..
    "weil die Weiche keinen Ausgang im \"N\" hat), dann verucht er nach \"S\", "..
    "dann \"E\", dann \"W\" zu fahren, bis wir ihm etwas anderes sagen, was wir jetzt machen."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Jedes mal wenn der trAIn eine Weiche erreicht, wird er etwas ausgeben und dann weiter fahren.\n"..
    "Unser nächster Schritt ist eine Richtung für ihn auszuwählen. Das jetzige vorgegeben Verhalten "..
    "ist nach Norden zu fahren, oder wenn er nicht kann, nach Süden.\n\nFalls die Funktion "..
    "ai.chooseDirection() \"E\" zurück gibt, weiß das Spiel dass der trAIn nach Osten will. "..
    "Lasse deine Funktion \"E\" zurück geben und lade neu."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].event = eventChooseEast(k)
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Hilfe!", event = function()
    if cBox then codeBox.remove(cBox) end
    cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_hintGoEast)
    end, inBetweenSteps = true}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Du hast es geschafft! Dein trAIn wird nun immer nach Osten fahren, wenn er kann...\n\n"..
    "Las uns noch etwas ausprobieren: Ich möchte dass der trAIn bei der ersten Weiche nach Osten "..
    "fährt, und anschließend nur noch nach Süden oder Norden. Benutze dein Weichen "..
    "Zähler von vorher und einen 'if-then-else' Ausdruck. Beachte: zum prüfen, ob "..
    "eine Variable gleich zu etwas ist, musst du '==' verwenden, nicht '=' ..."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].event = eventChooseEastThenSouth(k)
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Mehr Info", event = additionalInformation(
    "Es genügt dem trAIn zu sagen, dass er beim erstem mal nach Osten fahren soll und sonst "..
    "nach Süden, da er automatisch nach Nörden fährt, wenn er aus Süden kommt. "..
    "Auch wenn du ihm sagst er soll nach Süden fahren\n\n"..
    "Es gibt mehr als eine Lösung hierfür. Aber sei Vorsichtig: Alles was du nach dem 'return' Ausdruck "..
    "schreibst wird nicht ausgeführt, weil das Spiel die Funktion beendet wenn es 'return' erreicht."
    ), inBetweenSteps = true}
  tutorialSteps[k].buttons[3] = {name = "Hint!", event = function()
    if cBox then codeBox.remove(cBox) end
    cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_hintGoEastThenSouth)
    end, inBetweenSteps = true}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = "Es hat geklappt!"
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Lua: Tabellen"
  tutorialSteps[k].message = 
    "Wir sind fast fertig mit dem theoretischem Teil.\n"..
    "Eine Sache brauchen wir aber noch und das sind Lua Tabellen.\n"..
    "Tabellen sind vielleicht die stärkste Funktionalitat, die Lua bietet."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Grundsätzlich ist eine Tabelle ein Container für mehrere Variablen."..
    "Du kannst eine Tabelle mit gescheiften Klammer { } definieren. "..
    "Innerhalb der Klammern kannst du wiederum Variablen definieren, genau wie zuvor, "..
    "mit Kommas ',' getrennt."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_tables1)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Wurde eine Tabelle definiert, kannst du auf deren Elemente mit einem Punkt '.' zugreifen so:\n"..
    "TABELLE.ELEMENT\nSchau dir die Beispiele an..."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_tables2)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Du kannst neue Elemente hinzufügen (in dem du einen Text oder eine Zahl zuweist) "..
    "und diese entfernen (indem du 'nil' zuweist)."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_tables3)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Die Liste der Passagiere, welche wir im ersten Tutorial benützt haben, ist eine Tabelle "..
    "Dort haben wir Zahlen benützt um die Elemente zu benamen, anstatt von Namen. "..
    "Wenn du dafür entscheidest es so zu machen, kannst du auf die einzelnen Elemente mit "..
    "eckigen Klammern [ ] zugreifen, so wie wirs im ersten Tutorial gemacht haben."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_tables4)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = 
    "Ein komplexeres Beispiel: Du kannst eine Schleife vorzeitig beenden wenn eine Bedingung wahr ist. "..
    "Zum Beispiel, wenn du nach einem Passagier in einer Tabelle suchst und ihn findest, "..
    "kannst du die Scheife beenden indem du 'break' verwendest.\n"..
    "(Das '#' bevor passagiere gibt dir die Länge dieser Liste zurück. "..
    "Dies funktioniert nur, wenn du Zahlen benützt hast, um die Elemente zu benamen.)\n"..
    "Keine Sorge, wenn es dir zu schnell geht; es gibt ein Beispiel dafür in Tutorial 3."
  tutorialSteps[k].event =  function()
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_loop3)
    end
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = "Das ist alles, was du im Moment über Lua wissen musst!"
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  
  tutorialSteps[k] = {}
  tutorialSteps[k].stepTitle = "Fertig!"
  tutorialSteps[k].message = 
    "Du hast da zweite Tutorial beendet, sehr gut!\n"..
    "Klicke auf 'Mehr Ideen' für einige Ideen, welche du selbst ausprobieren kannst, "..
    "bevors auf zum nächsten Tutorial geht.\n\nMit diesem Tutorial haben wir, "..
    "fast das meiste der trockenen Theory ist abgeschlossen - das nächste Tutorial wird eher praktischer."
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Mehr Ideen", event = additionalInformation(
    "Versuche nach Osten zu fahren, dann nach Norden dann Süden, dann nochmal nach Osten und so weiter"..
    "(Osten, Norden, Süden, Osten, Norden, Süden, Osten ...).\n"..
    "Dazu Initialisiere eine Variable in ai.init(), und nenne sie \"dir\". "..
    "Dann addiere immer 1 zu dir (dir = dir + 1), wenn das Spiel ai.chooseDirection aufruft. "..
    "Anschließend gib \"E\", \"N\" or \"S\" zurück, wenn dir 1, 2 or 3 ist. "..
    "Vergiss nicht dir zurück zu setzen zu 0 oder 1 wenn es größer als 3 ist!", CODE_moreIdeas), inBetweenSteps = true}
  tutorialSteps[k].buttons[3] = {name = "Weiter", event = nextTutorialStep}
  k = k + 1
  
  tutorialSteps[k] = {}
  tutorialSteps[k].message = "Gehe direkt zum nächsten Tutorial oder zurück zum Menü"
  tutorialSteps[k].buttons = {}
  tutorialSteps[k].buttons[1] = {name = "Zurück", event = prevTutorialStep}
  tutorialSteps[k].buttons[2] = {name = "Beenden", event = endTutorial}
  tutorialSteps[k].buttons[3] = {name = "Nächstes Tutorial", event = nextTutorial}
  k = k + 1
end


function eventCounter(k)
  return function()
      local count = 0
      cBox = codeBox.new(CODE_BOX_X, CODE_BOX_Y, CODE_counter)
      tutorial.consoleEvent = function( str )
          
          if str:sub(1, 13) == "[TutorialAI2]" then
            count = count + 1
            if count == 2 then
              tutorial.consoleEvent = nil
              if currentStep == k then
                nextTutorialStep()
                tutorialBox.succeed()
              end
            end
          end
        end
    end
end

function eventFirstChooseDirection(k)
  return function()
      tutorial.chooseDirectionEvent = function()
        tutorial.consoleEvent = function (str)
            if str:sub(1, 13) == "[TutorialAI2]" then
              tutorial.consoleEvent = nil
              tutorial.chooseDirectionEvent = nil
              tutorial.chooseDirectionEventCleanup = nil
              if currentStep == k then
                nextTutorialStep()
                tutorialBox.succeed()
              end
            end
          end
        end
      tutorial.chooseDirectionEventCleanup = function()
          tutorial.consoleEvent = nil
        end
    end
end

function eventChooseEast(k)
  return function()
      tutorial.reachedNewTileEvent = function(x, y)
          if x == 3 and y == 2 then
            tutorial.reachedNewTileEvent = nil
            if currentStep == k then
              nextTutorialStep()
              tutorialBox.succeed()
            end
          end
        end
    end
end

function eventChooseEastThenSouth(k)
  junctionCount = 0
  local beenEast, beenSouth = false, false
  return function()
  
      tutorial.restartEvent = function()
          junctionCount = 1
          beenEast = true
          tutorial.reachedNewTileEvent = function(x, y)
            if x == 3 and y == 2 and beenEast == false and beenSouth == false then
              beenEast = true
            end
            if x == 2 and y == 3 then
              beenSouth = true
              if beenEast == true then
                tutorial.reachedNewTileEvent = nil
                tutorial.restartEvent = nil
                if currentStep == k then
                  nextTutorialStep()
                  tutorialBox.succeed()
                end
              else
                if currentStep == k then
                  if currentTutBox then
                    currentTutBox.text = "Du solltest zuerst nach Norden fahren, anschließend nach Süden! Passe deinen Code an und Lade ihn neu."
                  end
                end
              end
            end
          end
        end
      
      
    end
end

function endTutorial()
  map.endRound()
  mapImage = nil
  curMap = nil
  tutorial = {}
  menu.init()
end

function nextTutorial()
  map.endRound()
  mapImage = nil
  curMap = nil
  tutorial = {}
  menu.init()
  menu.executeTutorial("Tutorial3.lua")
end

function tutorial.roundStats()
  love.graphics.setColor(255,255,255,255)
  x = love.graphics.getWidth()-roundStats:getWidth()-20
  y = 20
  love.graphics.draw(roundStats, x, y)
  
  love.graphics.print("Tutorial 2: Links oder Rechts?", x + roundStats:getWidth()/2 - FONT_STAT_MSGBOX:getWidth("Tutorial 2: Links oder Rechts?")/2, y+10)
  love.graphics.print(currentStepTitle, x + roundStats:getWidth()/2 - FONT_STAT_MSGBOX:getWidth(currentStepTitle)/2, y+30)
end


function tutorial.handleEvents(dt)

  newTrainQueueTime = newTrainQueueTime + dt*timeFactor
  if newTrainQueueTime >= .1 then
    train.handleNewTrains()
    newTrainQueueTime = newTrainQueueTime - .1
  end
  
  --if tutorial.trainPlaced then
    --if tutorial.numPassengers == 0 then
    --end
  --end
end

fileContent = [[
-- Tutorial 2: Links oder Rechts?

-- Kaufe dir einen Zug zum Rundenbeginn und platziere ihn oben links auf der Karte:
function ai.init( map, money )
  buyTrain(1,1)
end
]]
