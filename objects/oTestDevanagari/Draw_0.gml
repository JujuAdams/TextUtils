// Feather disable all

draw_set_font(fntDefault);
draw_text(10, 10, index);
draw_text(10, 110, testArray[index].expected);
draw_text(10, 210, TextParseDevanagari(testArray[index].expected));
draw_set_font(fntDevanagariPreview);
var _char = ord(testArray[index].unicode);
draw_text(10, 310, testArray[index].unicode);
draw_set_font(fntDevanagari);
draw_text(10, 410, TextParseDevanagari(testArray[index].unicode));