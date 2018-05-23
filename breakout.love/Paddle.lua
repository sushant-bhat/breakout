Paddle = {}

Paddle.new = function()
  local paddle = {}
  paddle.quad = gTextures.paddles.small.quad
  paddle.w = gTextures.paddles.small.w
  paddle.h = gTextures.paddles.small.h
  paddle.x = SCREEN_W/2-paddle.w/2
  paddle.y = SCREEN_H-paddle.h-20
  paddle.update = function(dt)
    if love.keyboard.isDown('left') then
      paddle.x = math.max(0,paddle.x-PADDLE_SPEED*dt)
    end
    if love.keyboard.isDown('right') then
      paddle.x = math.min(SCREEN_W-paddle.w,paddle.x+PADDLE_SPEED*dt)
    end
  end
  paddle.draw = function()
    love.graphics.draw(gImages['main'], paddle.quad, paddle.x, paddle.y)
  end
  return paddle
end