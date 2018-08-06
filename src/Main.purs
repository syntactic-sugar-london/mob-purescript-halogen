module Main where

import Prelude
import Control.Coroutine as CR
import Effect.Class.Console (log)
import Effect (Effect)
import Data.Maybe (Maybe(..))
import Halogen as H
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import Button as B


main :: Effect Unit
main = 
  let 
--    handle:: B.Toggled State -> Effect (Maybe Unit) 
    handle (B.Toggled newState) = 
      do
        log $ "Button was toggled to: " <> show newState
        pure $ Just unit
        
  in HA.runHalogenAff (
    do
      body <- HA.awaitBody
      io <- runUI B.myButton unit body
      io.subscribe $ CR.consumer handle 
  )