PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    sounds['music']:pause()

    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
    self.score = params.score
    self.spawnInterval = params.spawnInterval
    self.lastY = params.lastY
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            score = self.score,
            spawnInterval = self.spawnInterval,
            lastY = self.lastY
        })
    end

end

function PauseState:render()
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bird:render()
end

function PauseState:exit()
    sounds['music']:play()
end