// Feather disable all

/// @param breakdownArray
/// @param font

function TextFormattedBuildDraw(_breakdownArray, _font)
{
    var _commandArray = [];
    
    var _oldFont = draw_get_font();
    draw_set_font(_font);
    
    var _func = function(_glyphArray, _start, _length)
    {
        var _filteredArray = array_filter(_glyphArray, function(_element, _index)
        {
            return (_index/2 != (_index div 2));
        },
        _start, _length);
        
        //Remap character codes to chars
        array_map_ext(_filteredArray, function(_element, _index)
        {
            return chr(_element);
        });
        
        return string_concat_ext(_filteredArray);
    }
    
    var _line = 0;
    repeat(array_length(_breakdownArray))
    {
        var _glyphArray = _breakdownArray[_line];
        
        var _x = 0;
        var _start = 0;
        
        var _block = {
            text: undefined, //FIlled in later
            x: _x,
            line: _line,
            tagArray: _glyphArray[0],
        }
        
        array_push(_commandArray, _block);
        
        var _i = 0;
        repeat((array_length(_glyphArray) div 2) - 1)
        {
            var _tagArray = _glyphArray[_i];
            if (_tagArray != undefined)
            {
                _block.text = _func(_glyphArray, _start, _i - _start);
                
                _x += string_width(_block.text);
                _start = _i;
                
                _block = {
                    text: undefined, //FIlled in later
                    x: _x,
                    line: _line,
                    tagArray: _tagArray,
                };
                
                array_push(_commandArray, _block);
            }
            
            _i += 2;
        }
        
        _block.text = _func(_glyphArray, _start, _i - _start);
        
        array_push(_commandArray, {
            text: "",
            x: _x,
            line: _line,
            tagArray: _glyphArray[_i],
        });
        
        ++_line;
    }
    
    draw_set_font(_oldFont);
    
    return _commandArray;
}