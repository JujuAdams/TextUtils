// Feather disable all

var _unicode = testArray[index].unicode;

draw_set_font(fntDefault);
draw_set_halign(fa_right);
draw_text(room_width - 10, 10, index);
draw_set_halign(fa_left);
draw_text(10, 10, testArray[index].expected);
draw_text(10, 110, TextRecompose(TextTransformDevanagari(TextDecompose(_unicode))));
draw_text(10, 210, TextFormattedRecompose(TextFormattedTransformDevanagari(TextFormattedDecompose(_unicode))));
draw_set_font(fntDevanagariPreview);
draw_text(10, 310, _unicode);
draw_set_font(fntDevanagari);
draw_text(10, 410, TextRecompose(TextTransformDevanagari(TextDecompose(_unicode))));
draw_text(10, 510, TextFormattedRecompose(TextFormattedTransformDevanagari(TextFormattedDecompose(_unicode))));

TextFormattedDraw(
    TextFormattedBuildDraw(
        TextFormattedTransformDevanagari(
            TextFormattedDecompose(_unicode),
        ),
        draw_get_font()
    ),
    draw_get_font(),
    10,
    610, 
);