BrickMatrix = {}

BrickMatrix.new = function()
  local brickMatrix = {}
  local index = 0
  brickMatrix.rows = 4
  brickMatrix.cols = (SCREEN_W-50)/40
  brickMatrix.x = 25
  brickMatrix.y = 25
  for i = 1,brickMatrix.rows,1 do
    brickMatrix[i] = {}
    for j = 1,brickMatrix.cols,1 do
      brickMatrix[i][j] = {
          brick = gTextures.bricks[index%23 + 1],
          bx = brickMatrix.x+40*(j-1),
          by = brickMatrix.y+40*i,
          hit = false
        }
      index = index + 1
    end
  end
  
  brickMatrix.handleCollision = function()
    for i = 1,brickMatrix.rows,1 do
      for j = 1,brickMatrix.cols,1 do
        if not brickMatrix[i][j].hit then

          if ball.x >= brickMatrix[i][j].bx and ball.x <= brickMatrix[i][j].bx+brickMatrix[i][j].brick.w and ball.y <= brickMatrix[i][j].by + brickMatrix[i][j].brick.h+5 and ball.y >= brickMatrix[i][j].by + brickMatrix[i][j].brick.h and ball.dy < 0 then
            brickMatrix[i][j].hit = true
            --print('Got hit')
            ball.dy = -ball.dy
            PlayState.score = PlayState.score + 1
          end
          
          if ball.x >= brickMatrix[i][j].bx and ball.x <= brickMatrix[i][j].bx+brickMatrix[i][j].brick.w and ball.y >= brickMatrix[i][j].by-5 and ball.y <= brickMatrix[i][j].by and ball.dy > 0 then
            brickMatrix[i][j].hit = true
            --print('Got hit again')
            ball.dy = -ball.dy
            PlayState.score = PlayState.score + 1
          end
          
          if ball.y >= brickMatrix[i][j].by and ball.y <= brickMatrix[i][j].by+brickMatrix[i][j].brick.h and ball.x <= brickMatrix[i][j].bx + brickMatrix[i][j].brick.w+5 and ball.x >= brickMatrix[i][j].bx + brickMatrix[i][j].brick.w and ball.dx < 0 then
            brickMatrix[i][j].hit = true
            --print('Got hit')
            ball.dx = -ball.dx
            PlayState.score = PlayState.score + 1
          end
          
          if ball.y >= brickMatrix[i][j].by and ball.y <= brickMatrix[i][j].by+brickMatrix[i][j].brick.h and ball.x >= brickMatrix[i][j].bx-5 and ball.x <= brickMatrix[i][j].bx and ball.dx > 0 then
            brickMatrix[i][j].hit = true
            --print('Got hit again')
            ball.dx = -ball.dx
            PlayState.score = PlayState.score + 1
          end
        end
      end
    end
  end
  
  brickMatrix.draw = function()
    for i = 1,brickMatrix.rows,1 do
      for j = 1,brickMatrix.cols,1 do
        if not brickMatrix[i][j].hit then
          love.graphics.draw(gImages['main'],brickMatrix[i][j].brick.quad,brickMatrix[i][j].bx,brickMatrix[i][j].by)
        end
      end
    end
  end
  return brickMatrix
end