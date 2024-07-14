// Feather disable all

draw_set_font(fntDefault);
draw_text(10, 10, index);
draw_text(10, 110, testArray[index].expected);
draw_text(10, 210, TextRecompose(TextTransformDevanagari(TextDecompose(testArray[index].unicode))));
draw_text(10, 310, TextFormattedTransformDevanagari(testArray[index].unicode));
draw_set_font(fntDevanagariPreview);
draw_text(10, 410, testArray[index].unicode);
draw_set_font(fntDevanagari);
draw_text(10, 510, TextTransformDevanagari(testArray[index].unicode));
draw_text(10, 610, TextFormattedTransformDevanagari(testArray[index].unicode));