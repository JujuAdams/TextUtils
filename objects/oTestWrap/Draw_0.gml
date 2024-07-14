// Feather disable all

draw_set_font(fntArial);

draw_text(10, 10, text);

var _decompose = TextDecompose(text);
draw_text(10, 110, TextRecompose(_decompose));

var _wrappedArray = TextWrap(_decompose, draw_get_font(), width-10, false);
var _y = 210;
var _i = 0;
repeat(array_length(_wrappedArray))
{
    draw_text(10, _y, TextRecompose(_wrappedArray[_i]));
    ++_i;
    _y += 50;
}

draw_line(width, 0, width, room_height);

draw_set_valign(fa_bottom);
draw_text(width+10, room_height-10, width);
draw_set_valign(fa_top);