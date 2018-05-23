PauseState = {}

PauseState.update = function(dt)
  if love.keyboard.keyPressed['space'] then
    currentState = 'play'
  end
end

PauseState.draw = function()
  --paddle.draw()
  --ball.draw()
  love.graphics.setFont(gFonts['big'])
  love.graphics.printf({{1,1,1},PAUSE_TEXT},SCREEN_W/2-gFonts['big']:getWidth(PAUSE_TEXT)/2,SCREEN_H/2-gFonts['big']:getHeight(PAUSE_TEXT),gFonts['big']:getWidth(PAUSE_TEXT), "center")
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf({{1,1,1},PAUSE_SPACE_TEXT},SCREEN_W/2-gFonts['small']:getWidth(PAUSE_SPACE_TEXT)/2,SCREEN_H/2+gFonts['big']:getHeight(PAUSE_TEXT)-gFonts['small']:getHeight(PAUSE_SPACE_TEXT),gFonts['small']:getWidth(PAUSE_SPACE_TEXT), "center")
end