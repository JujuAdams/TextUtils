// Feather disable all

/// @param glyphArray
/// @param font
/// @param width
/// @param perChar

function TextFormWrap(_glyphArray, _font, _limitWidth, _perChar)
{
    static _bidiMap = TextGlyphData().bidiMap;
    
    var _linesArray = [];
    var _lineArray = [];
    array_push(_linesArray, _lineArray);
    
    var _glyphDataMap = TextUtilsCacheFontInfo(_font).fastGlyphs;
    
    var _x = 0;
    var _i = 0;
    
    if (not _perChar)
    {
        var _wordStart = 0;
        var _inWhitespace = false;
        
        repeat(array_length(_glyphArray) div 2)
        {
            var _tag  = _glyphArray[_i];
            var _code = _glyphArray[_i+1];
            
            var _glyphData = _glyphDataMap[? _code];
            
            if ((_bidiMap[? _code] ?? BIDI.L2R) == BIDI.WHITESPACE)
            {
                if (not _inWhitespace)
                {
                    _inWhitespace = true;
                    
                    //We've moved from a word into whitespace
                    //We need to figure out how big the word was and place it onto the correct line
                    var _wordLength = _i - _wordStart;
                    if (_wordLength > 0)
                    {
                        var _wordShift = 0;
                        var _wordWidth = 0;
                        
                        var _j = _wordStart + 1;
                        repeat((_wordLength div 2)-1)
                        {
                            _wordWidth += _glyphDataMap[? _glyphArray[_j]].shift;
                            _j += 2;
                        }
                        
                        _wordShift = _wordWidth;
                        _wordShift += _glyphDataMap[? _glyphArray[_j]].shift;
                        
                        _wordWidth += _glyphDataMap[? _glyphArray[_j]].w;
                        
                        //If the word is bigger than we have space for, start a new line
                        //However, we don't want to start a new line if nothing else already on this line
                        if ((_x > 0) && (_x + _wordWidth > _limitWidth))
                        {
                            _lineArray = [];
                            array_push(_linesArray, _lineArray);
                            
                            _x = 0;
                        }
                        
                        array_copy(_lineArray, array_length(_lineArray), _glyphArray, _wordStart, _wordLength);
                        _x += _wordShift;
                    }
                    
                    if (_code == 0) break;
                }
                
                //Only push whitespace if it fits inside the limits
                //But don't push whitespace if we're at the start of a line
                if ((_x > 0) && (_x + _glyphData.shift <= _limitWidth))
                {
                    array_push(_lineArray, _tag, _code);
                    _x += _glyphData.shift;
                }
            }
            else
            {
                if (_inWhitespace)
                {
                    _inWhitespace = false;
                    
                    //Entered into a new word from whitespace
                    _wordStart = _i;
                }
            }
            
            _i += 2;
        }
    }
    else
    {
        repeat((array_length(_glyphArray) div 2)-1)
        {
            var _tag  = _glyphArray[_i];
            var _code = _glyphArray[_i+1];
            
            var _glyphData = _glyphDataMap[? _code];
            
            if ((_x > 0) && (_x + _glyphData.w > _limitWidth))
            {
                _lineArray = [];
                array_push(_linesArray, _lineArray);
                
                _x = 0;
            }
            
            if (((_bidiMap[? _code] ?? BIDI.L2R) != BIDI.WHITESPACE) || ((_x > 0) && (_x + _glyphData.w <= _limitWidth)))
            {
                array_push(_lineArray, _tag, _code);
            }
            
            _x += _glyphData.shift;
            _i += 2;
        }
    }
    
    return _linesArray;
}