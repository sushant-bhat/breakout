require 'constants'

require 'states/StartMenuState'
require 'states/PlayState'
require 'states/GameOverState'
require 'states/PauseState'

require 'Paddle'
require 'Ball'
require 'BrickMatrix'

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  
  love.keyboard.keyPressed[key] = true
end

function displayFPS()
  love.graphics.setFont(gFonts['small'])
  love.graphics.print({{0,255,0},"FPS: "..tostring(love.timer.getFPS())},5,5)
end

function generateQuads()
  local i = 0
  local j = 0
  local index = 1
  local quads = {
    ['bricks'] = {},
    ['paddles'] = {},
    ['balls'] = {}
  }
  for i = 0, 3, 1 do
    for j = 0, 9, 1 do
      quads.bricks[index] = {quad=love.graphics.newQuad(j*40,i*40,40,40,gImages['main']:getDimensions()),w=40,h=40}
      index = index + 1
      if index == 23 then
        break
      end
    end
  end
  
  quads.paddles = {
    ['small'] = {quad=love.graphics.newQuad(0,200,100,40,gImages['main']:getDimensions()),w=90,h=20},
    ['med'] = {quad=love.graphics.newQuad(0,240,120,40,gImages['main']:getDimensions()),w=120,h=20},
    ['large'] = {quad=love.graphics.newQuad(0,280,140,40,gImages['main']:getDimensions()),w=140,h=20}
  }
  
  quads.balls = {
    ['small'] = {quad=love.graphics.newQuad(160,200,20,40,gImages['main']:getDimensions()),w=20,h=15},
    ['large'] = {quad=love.graphics.newQuad(160,240,100,40,gImages['main']:getDimensions()),w=100,h=22}
  }
  return quads
end

function load_res()
  currentState = 'start'
  
  gFonts = {
    ['big'] = love.graphics.newFont('fonts/basic_font.ttf',80),
    ['mid'] = love.graphics.newFont('fonts/basic_font.ttf',50),
    ['small'] = love.graphics.newFont('fonts/basic_font.ttf',20)
  }
  
  gImages = {
    ['back'] = love.graphics.newImage('images/back.png'),
    ['main'] = love.graphics.newImage('images/sprite_sheet.png'),
    ['heart'] = love.graphics.newImage('images/heart.png')
  }
  
  gStates = {
    ['start'] = StartMenuState,
    ['play'] = PlayState,
    ['game_over'] = GameOverState,
    ['pause'] = PauseState
  }
  
  gTextures = generateQuads()
  
  gSounds = {
    
  }
end

function love.load()
  love.window.setMode(0,0)
  SCREEN_W = love.graphics:getWidth()
  SCREEN_H = love.graphics:getHeight()
  math.randomseed(love.timer.getTime())
  load_res()
  paddle = Paddle:new()
  ball = Ball:new()
  brickMatrix = BrickMatrix:new()
  love.keyboard.keyPressed = {}
end

function love.update(dt)
  gStates[currentState].update(dt)
  love.keyboard.keyPressed = {}
end

function love.draw()
  love.graphics.clear(255,255,255)
  love.graphics.draw(gImages['back'],0,0,0,SCREEN_W / (gImages['back']:getWidth()-1), SCREEN_H / (gImages['back']:getHeight()-1))
  gStates[currentState].draw()
  displayFPS()
end