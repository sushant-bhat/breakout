GameOverState = {}

function reset()
  paddle.x = SCREEN_W/2-paddle.w/2
  paddle.y = SCREEN_H-paddle.h-20
  ball.x = SCREEN_W/2
  ball.y = paddle.y-ball.h
  ball.dy = -BALL_SPEED
  ball.dx = math.random()*(BALL_SPEED)
end

GameOverState.update = function(dt)
  if love.keyboard.keyPressed['space'] then
    currentState = 'start'
  end
end

GameOverState.draw = function()
  love.graphics.setFont(gFonts['big'])
  love.graphics.printf({{1,1,1},GAME_OVER_TEXT},SCREEN_W/2-gFonts['big']:getWidth(GAME_OVER_TEXT)/2,SCREEN_H/2-gFonts['big']:getHeight(GAME_OVER_TEXT),gFonts['big']:getWidth(GAME_OVER_TEXT))
  love.graphics.setFont(gFonts['mid'])
  love.graphics.print({{1,1,1}, SCORE_TEXT.." "..PlayState.score}, (SCREEN_W-gFonts['mid']:getWidth(SCORE_TEXT.." "..PlayState.score))/2, SCREEN_H/2+10)
  love.graphics.setFont(gFonts['small'])
  love.graphics.printf({{1,1,1},GAME_OVER_SPACE_TEXT},SCREEN_W/2-gFonts['small']:getWidth(GAME_OVER_SPACE_TEXT)/2,SCREEN_H/2+gFonts['big']:getHeight(PAUSE_TEXT)-gFonts['small']:getHeight(GAME_OVER_SPACE_TEXT),gFonts['small']:getWidth(GAME_OVER_SPACE_TEXT), "center")
end