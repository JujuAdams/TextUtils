// Feather disable all

draw_set_font(fntArial);

draw_text(10, 10, text);

var _breakdownArray = TextDecompose(text);
draw_text(10, 110, TextRecompose(_breakdownArray));

TextTransformWrap(_breakdownArray, draw_get_font(), width-10, false);
//draw_text(10, 210, TextRecompose(_breakdownArray));

TextFormattedDraw(
    TextFormattedBuildDraw(
        TextFormattedTransformWrap(
            TextFormattedDecompose(text),
            draw_get_font(),
            width-10,
            true
        ),
        draw_get_font()
    ),
    draw_get_font(),
    10,
    210, 
);

draw_line(width, 0, width, room_height);

draw_set_valign(fa_bottom);
draw_text(width+10, room_height-10, width);
draw_set_valign(fa_top);