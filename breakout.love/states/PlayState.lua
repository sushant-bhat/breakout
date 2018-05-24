require 'constants'

PlayState = {}

PlayState.lives = 3
PlayState.score = 0

function checkCollisions()
  
  if ball.y+ball.h >= paddle.y-5 and ball.x > paddle.x and ball.x < paddle.x+paddle.w then
    return true
  end
  if  ball.y+ball.h >= paddle.y-5 and ball.x+ball.w > paddle.x and ball.x+ball.w < paddle.x+paddle.w then
    return true
  end
  return false
end

PlayState.update = function(dt)
  if love.keyboard.keyPressed['space'] then
    currentState = 'pause'
  end
  if PlayState.lives == 0 then
    currentState = 'game_over'
    PlayState.lives = 3
    brickMatrix:reset()
  end
  ball.update(dt)
  paddle.update(dt)
  if checkCollisions() then
    ball.dy = -ball.dy
    if paddle.dx < 0 then
      ball.dx = ball.dx-100
    elseif paddle.dx > 0 then
      ball.dx = ball.dx+100
    end
    ball.y = paddle.y-ball.h
  end
end

PlayState.draw = function()
  brickMatrix.draw()
  paddle.draw()
  ball.draw()
  dist = 35
  for i=1,PlayState.lives,1 do
    love.graphics.draw(gImages['heart'],SCREEN_W-dist,15,0,0.02,0.02)
    dist = dist + 50
  end
  love.graphics.setFont(gFonts['small'])
  love.graphics.print({{1,1,1}, SCORE_TEXT.." "..PlayState.score}, (SCREEN_W-gFonts['small']:getWidth(SCORE_TEXT))/2, 15)
end