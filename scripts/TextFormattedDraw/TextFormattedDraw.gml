// Feather disable all

/// @param drawArray
/// @param font
/// @param x
/// @param y

function TextFormattedDraw(_drawArray, _font, _x, _y)
{
    var _oldFont = draw_get_font();
    var _oldColor = draw_get_color();
    draw_set_font(_font);
    
    var _lineHeight = string_height(" ");
    
    var _i = 0;
    repeat(array_length(_drawArray))
    {
        var _command = _drawArray[_i];
        
        if (is_array(_command.tagArray))
        {
            var _tagArray = _command.tagArray;
            
            var _j = 0;
            repeat(array_length(_tagArray))
            {
                var _tag = _tagArray[_j];
                
                if (_tag[0] == "c_red")
                {
                    draw_set_color(c_red);
                }
                else if (_tag[0] == "c_blue")
                {
                    draw_set_color(c_blue);
                }
                else if (_tag[0] == "c_white")
                {
                    draw_set_color(c_white);
                }
                
                ++_j;
            }
        }
        
        draw_text(_x + _command.x, _y + _lineHeight*_command.line, _command.text);
        ++_i;
    }
    
    draw_set_color(_oldColor);
    draw_set_font(_oldFont);
}