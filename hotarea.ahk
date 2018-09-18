;set the coordinates system relative to the screen
CoordMode, Mouse ,Screen


;set screen info
global leftEdge := 0, rightEdge := 1919, topEdge := 0, bottomEdge := 1079
;set the time interval to getting mouse info. The less the value is, the less the hot area is sensitive
timeInterval := 300


;functions
isLeftEdge(_xpos, _ypos){
    if (_xpos == leftEdge and _ypos < bottomEdge - 20 and _ypos > topEdge + 20) {
        return true
    }
    return false
}

isRightEdge(_xpos, _ypos){
    maxY := bottomEdge - 20
    minY := topEdge + 20
    res := % _xpos == rightEdge and _ypos < maxY and _ypos > minY
    if (res) {
        return true
    }
    return false
}

isBottomEdge(_xpos, _ypos){
    if (_ypos == %bottomEdge%  and _xpos < %rightEdge% - 20 and _xpos > %leftEdge% + 20) {
        return true
    }
    return false
}

isTopEdge(_xpos, _ypos){
    if (_ypos == %bottomEdge%  and _xpos < %rightEdge% - 20 and _xpos > %leftEdge% + 20) {
        return true
    }
    return false
}

isTopLeftCorner(_xpos, _ypos){
    if (_xpos == %leftEdge% and _ypos == %topEdge%) {
        return true
    }
    return false
}

isTopRightCorner(_xpos, _ypos){
    if (_xpos == %rightEdge% and _ypos == %topEdge%) {
        return true
    }
    return false
}

isBottomLeftCorner(_xpos, _ypos){
    if (_xpos == %leftEdge% and _ypos == %bottomEdge% ) {
        return true
    }
    return false
}

isBottomRightCorner(_xpos, _ypos){
    if (_xpos = %rightEdge% and _ypos = %bottomEdge% ) {
        return true
    }
    return false
}

#Persistent
SetTimer, WatchCursor, %timeInterval%
return

WatchCursor:
GetKeyState, state, LButton 
MouseGetPos, xpos, ypos, id, control 
if(state = "U" ){
    if ( isTopLeftCorner(xpos, ypos) ) {
        Send #{Tab}
        MouseMove, %leftEdge% + 10, %topEdge% + 10
    } else if (isRightEdge(xpos, ypos)){
        Send ^#{Right}
        MouseMove, %rightEdge% - 20, ypos
    } else if (isLeftEdge(xpos, ypos)){
        Send ^#{Left}
        MouseMove, %leftEdge% + 20, ypos
    }
}
return