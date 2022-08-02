-- https://github.com/Ulydev/push
push = require 'lib/push'

-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

require 'src/constants'

-- a basic StateMachine class which will allow us to transition to and from
-- game states smoothly and avoid monolithic code in one file
require 'src/StateMachine'

require 'src/states/BaseState'
require 'src/states/CountdownState'
require 'src/states/PlayState'
require 'src/states/ScoreState'
require 'src/states/TitleScreenState'
require 'src/states/PauseState'

require 'src/Bird'
require 'src/Pipe'
require 'src/PipePair'