
;设置鼠标坐标系为整个桌面
CoordMode, Mouse ,Screen

#Persistent
;设置获取鼠标信息的时间间隔（ms）
SetTimer, WatchCursor, 300
return

WatchCursor:
GetKeyState, state, LButton
MouseGetPos, xpos, ypos, id, control 
if(state = "U" ){
    ;左上角热区显示多任务界面
    ;修改xpos和ypos的值即可
    if(xpos = -1080 and ypos = -663){
        Send #{Tab}
        MouseMove, 10, 10
    ;TODO：增加其他热区
    } else {
        ;右边向右切换
        if(xpos = 1919){
            Send ^#{Right}
            MouseMove, 1900, ypos
            ;避免连续切换
        ;左边缘向左切换（修改左边即可）
        }else if(xpos <= -1072){
            Send ^#{Left}
            MouseMove, -1070, ypos
        }
    }
}
return
