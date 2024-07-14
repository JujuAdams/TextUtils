// Feather disable all

draw_set_font(fntDefault);
draw_text(10, 10, index);
draw_text(10, 110, testArray[index].expected);
draw_text(10, 210, TextParseDevanagari(testArray[index].unicode));
draw_text(10, 310, TextFormParseDevanagari(testArray[index].unicode));
draw_set_font(fntDevanagariPreview);
draw_text(10, 410, testArray[index].unicode);
draw_set_font(fntDevanagari);
draw_text(10, 510, TextParseDevanagari(testArray[index].unicode));
draw_text(10, 610, TextFormParseDevanagari(testArray[index].unicode));