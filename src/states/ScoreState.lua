--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:init() 
    self.medal = 'none'
    self.goldMedal = love.graphics.newImage('sprites/gold_medal.png')
    self.silverMedal = love.graphics.newImage('sprites/silver_medal.png')
    self.bronzeMedal = love.graphics.newImage('sprites/bronze_medal.png')
end

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if self.score >= 50 then
        self.medal = 'gold'
    elseif self.score >= 30 then
        self.medal = 'silver'
    elseif self.score >= 10 then
        self.medal = 'bronze'
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('title')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.medal ~= 'none' then
        love.graphics.printf('You got a ' .. tostring(self.medal) .. " medal!", 0, 115, VIRTUAL_WIDTH, 'center')
        if self.medal == 'bronze' then
            love.graphics.draw(self.bronzeMedal, VIRTUAL_WIDTH / 2 - 20, 135)
        elseif self.medal == 'silver' then
            love.graphics.draw(self.silverMedal, VIRTUAL_WIDTH / 2 - 20, 135)
        elseif self.medal == 'gold' then
            love.graphics.draw(self.goldMedal, VIRTUAL_WIDTH / 2 - 20, 135)
        end
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 170, VIRTUAL_WIDTH, 'center')
end