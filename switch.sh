#批量转换脚本
#用于转换鼠标指针对应的情况

#windows指针转换工具：win2xcur(https://github.com/quantum5/win2xcur)
#安装方法：
#sudo apt install python3-pip
#sudo pip install win2xcur

#需要下列鼠标指针
#括号里为对应Windows系统中的鼠标指针
#left_ptr(正常选择/pointer)
#question_arrow(帮忙选择/help)
#left_ptr_watch(后台运行/work)
#wait(忙/busy)
#cross(精确选择)
#xterm(文本选择/text)
#pencil(手写)
#circle(不可用/unavailiable)
#bottom_side(垂直调整大小/vert)
#left_side(水平调整大小/horz)
#bottom_left_corner(沿对角线调整大小2/dgn2，长得像这个“/”)
#bottom_right_corner(沿对角线调整大小1/dgn1，长得像这个“\”)
#move(移动/move)
#dotbox(候选/alternate)
#hand2(链接选择/link)

cp -fv left_ptr context-menu
cp -fv left_ptr grabbing
cp -fv left_ptr hand1
cp -fv left_ptr center_ptr

cp -fv question_arrow dnd-ask

cp -fv pencil copy
cp -fv pencil dnd-copy
cp -fv pencil dnd-move
cp -fv pencil dnd-link
cp -fv pencil link
cp -fv pencil pointer-move
cp -fv pencil zoom-in
cp -fv pencil zoom-out

cp -fv circle crossed_circle
cp -fv circle dnd_no_drop
cp -fv circle X_cursor

cp -fv cross crosshair
cp -fv cross tcross

cp -fv bottom_left_corner fd_double_arrow
cp -fv bottom_left_corner ll_angle
cp -fv bottom_left_corner top_right_corner
cp -fv bottom_left_corner ur_angle

cp -fv bottom_right_corner bd_double_arrow
cp -fv bottom_right_corner lr_angle
cp -fv bottom_right_corner top_left_corner
cp -fv bottom_right_corner ul_angle

cp -fv bottom_side bottom_tee
cp -fv bottom_side plus
cp -fv bottom_side sb_down_arrow
cp -fv bottom_side sb_up_arrow
cp -fv bottom_side sb_v_double_arrow
cp -fv bottom_side top_side
cp -fv bottom_side top_tee

cp -fv left_side left_tee
cp -fv left_side right_side
cp -fv left_side right_tee
cp -fv left_side sb_h_double_arrow
cp -fv left_side sb_left_arrow
cp -fv left_side sb_right_arrow

