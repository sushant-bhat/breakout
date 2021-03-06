Ball = {}


Ball.new = function()
  local ball = {}
  ball.quad = gTextures.balls.small.quad
  ball.w = gTextures.balls.small.w
  ball.h = gTextures.balls.small.h
  ball.x = SCREEN_W/2
  ball.y = paddle.y-ball.h
  ball.dy = -BALL_SPEED
  ball.dx = BALL_SPEED
  ball.update = function(dt)
    ball.x = ball.x + ball.dx*dt
    ball.y = ball.y + ball.dy*dt
    if ball.x >= SCREEN_W-5 or ball.x <= 5 then
      if ball.x >= SCREEN_W-5 then
        ball.x = SCREEN_W-5
      elseif ball.x <= 5 then
        ball.x = 5
      end
      ball.dx = -ball.dx
    end
    if ball.y <= 0 then
      ball.y = 1
      ball.dy = -ball.dy
    elseif ball.y >= SCREEN_H then
      PlayState.lives = PlayState.lives - 1
      ball.x = SCREEN_W/2
      ball.y = paddle.y-ball.h
      ball.dy = -BALL_SPEED
      ball.dx = BALL_SPEED
    end
    
    brickMatrix:handleCollision()
  end
  ball.draw = function()
    --love.graphics.print("Ball: "..ball.x.." , Paddle: "..paddle.x..", Paddle+w: "..paddle.x+paddle.w, 500, 20)
    love.graphics.draw(gImages['main'], ball.quad, ball.x, ball.y)
  end
  return ball
end