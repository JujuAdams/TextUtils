// Feather disable all

/// @param breakdownArray

function TextFormattedTransformThai(_breakdownArray)
{
    static _baseMap          = TextGlyphData().thaiBaseMap;
    static _baseDescenderMap = TextGlyphData().thaiBaseDescenderMap;
    static _baseAscenderMap  = TextGlyphData().thaiBaseAscenderMap;
    static _topMap           = TextGlyphData().thaiTopMap;
    static _lowerMap         = TextGlyphData().thaiLowerMap;
    static _upperMap         = TextGlyphData().thaiUpperMap;
    
    var _line = 0;
    repeat(array_length(_breakdownArray))
    {
        var _glyphArray = _breakdownArray[_line];
        
        var _outArray = [];
        
        var _glyphPrev     = undefined;
        var _glyphPrevPrev = undefined;
        var _skipWrite     = false;
        
        var _i = 1;
        while(true)
        {
            var _tagArrayFound = _glyphArray[_i-1];
            array_push(_outArray, _tagArrayFound);
            
            var _glyphFound = _glyphArray[_i];
            if (_glyphFound == 0x00)
            {
                array_push(_outArray, 0x00);
                break;
            }
            
            var _glyphWrite = _glyphFound;
            
            if ((_glyphWrite >= 0x0E00) && (_glyphWrite <= 0x0E7F))
            {
                if (_topMap[? _glyphWrite] && (_i >= 3))
                {
                    var _base = _glyphPrev;
                    if (_lowerMap[? _base] && (_i >= 5)) _base = _glyphPrevPrev;
                    
                    if (_baseMap[? _base])
                    {
                        var _glyphNext = _glyphArray[_i+2];
                        var _followingNikhahit = ((_glyphNext == 0x0E33) || (_glyphNext == 0x0E4D));
                        if (_baseAscenderMap[? _base])
                        {
                            if (_followingNikhahit)
                            {
                                _glyphWrite += 0xF713 - 0x0E48;
                                array_push(_outArray, _glyphWrite);
                                
                                _glyphWrite = 0xF711;
                                if (_glyphNext == 0x0E33)
                                {
                                    array_push(_outArray, _glyphWrite);
                                    _glyphWrite = 0x0E32;
                                }
                                
                                _i += 2;
                                _skipWrite = true;
                            }
                            else
                            {
                                _glyphWrite += 0xF705 - 0x0E48;
                                
                                if ((_i >= 3) && _upperMap[? _glyphPrev] && _baseAscenderMap[? _glyphPrev])
                                {
                                    _glyphWrite += 0xF713 - 0x0E48;
                                }
                            }
                        }
                        else if (not _followingNikhahit)
                        {
                            _glyphWrite += 0xF70A - 0x0E48;
                            
                            if ((_i >= 3) && _upperMap[? _glyphPrev] && _baseAscenderMap[? _glyphPrev])
                            {
                                _glyphWrite += 0xF713 - 0x0E48;
                            }
                        }
                    }
                }
                else if (_upperMap[? _glyphWrite] && (_i >= 3) && _baseAscenderMap[? _glyphPrev])
                {
                    switch(_glyphWrite)
                    {
                        case 0x0E31: _glyphWrite = 0xF710; break;
                        case 0x0E34: _glyphWrite = 0xF701; break;
                        case 0x0E35: _glyphWrite = 0xF702; break;
                        case 0x0E36: _glyphWrite = 0xF703; break;
                        case 0x0E37: _glyphWrite = 0xF704; break;
                        case 0x0E4d: _glyphWrite = 0xF711; break;
                        case 0x0E47: _glyphWrite = 0xF712; break;
                    }
                }
                else if (_lowerMap[? _glyphWrite] && (_i >= 3) && _baseDescenderMap[? _glyphPrev])
                {
                    _glyphWrite += 0xF718 - 0x0E38;
                }
                else
                {
                    var _glyphNext = _glyphArray[_i+2];
                    
                    if ((_glyphWrite == 0x0E0D) && _lowerMap[? _glyphNext])
                    {
                        _glyphWrite = 0xF70F;
                    }
                    else if ((_glyphWrite == 0x0E10) && _lowerMap[? _glyphNext])
                    {
                        _glyphWrite = 0xF700;
                    }
                }
            }
            
            if (_skipWrite)
            {
                _skipWrite = false;
            }
            else
            {
                array_push(_outArray, _glyphWrite);
            }
            
            _glyphPrevPrev = _glyphPrev;
            _glyphPrev     = _glyphWrite;
            
            _i += 2;
        }
        
        _breakdownArray[@ _line] = _outArray;
        ++_line;
    }
    
    return _breakdownArray;
}