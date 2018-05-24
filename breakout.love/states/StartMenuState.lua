StartMenuState = {}

StartMenuState.highlighted = 0
StartMenuState.menu = {{1,1,1,1},START_TEXT,{1,1,1,1},"\n"..HIGH_SCORE_TEXT}

StartMenuState.update = function(dt)
  if love.keyboard.keyPressed['down'] then
    StartMenuState.highlighted = (StartMenuState.highlighted+1)%(#StartMenuState.menu/2)
  end
  if love.keyboard.keyPressed['up'] then
    StartMenuState.highlighted = (StartMenuState.highlighted-1)%2
  end
  if love.keyboard.keyPressed['return'] then
    local index = StartMenuState.highlighted*2 + 2
    if StartMenuState.menu[index] == START_TEXT then
      currentState = 'play'
    end
  end
  StartMenuState.menu = {{1,1,1,1},START_TEXT,{1,1,1,1},"\n"..HIGH_SCORE_TEXT}
end

StartMenuState.draw = function()
  love.graphics.setFont(gFonts['big'])
  love.graphics.printf({{255,255,255},TITLE}, (SCREEN_W-gFonts['big']:getWidth(TITLE))/2, (SCREEN_H-gFonts['big']:getHeight(TITLE))/3, gFonts['big']:getWidth(TITLE))
  StartMenuState.menu[StartMenuState.highlighted * 2 + 1] = {0.7,0,0,1}
  love.graphics.setFont(gFonts['mid'])
  love.graphics.printf(StartMenuState.menu, SCREEN_W/2-250, SCREEN_H/2+70, 500, 'center')
end