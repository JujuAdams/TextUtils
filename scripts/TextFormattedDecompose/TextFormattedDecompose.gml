// Feather disable all

/// @param string

function TextFormattedDecompose(_string)
{
    static _scope = new (function() constructor
    {
        __result = [undefined];
        
        __Reset = function(_string)
        {
            __result = [undefined];
            return __result;
        }
        
        __Foreach = function(_char, _pos)
        {
            array_push(__result, ord(_char), undefined);
        }
        
    })();
    
    static _funcForeach = _scope.__Foreach;
    
    var _breakdownArray = [];
    
    //Empty string
    if (_string == "")
    {
        array_push(_breakdownArray, [undefined, 0x00]);
    }
    else
    {
        var _newlineSplit = string_split(_string, "\n");
        
        var _line = 0;
        repeat(array_length(_newlineSplit))
        {
            var _lineString = _newlineSplit[_line];
            
            var _outArray = _scope.__Reset();
            array_push(_breakdownArray, _outArray);
            
            var _tagOpenSplit = string_split(_lineString, "[");
            if (_tagOpenSplit[0] != "") string_foreach(_tagOpenSplit[0], _funcForeach);
            
            var _tagArray = undefined;
            
            var _escapeNext = false;
            var _i = 1;
            repeat(array_length(_tagOpenSplit)-1)
            {
                var _substring = _tagOpenSplit[_i];
                
                if (_escapeNext)
                {
                    //Previous substring was empty indicating a double [[
                    _escapeNext = false;
                    
                    string_foreach(_substring, _funcForeach);
                    _tagArray = undefined;
                }
                else if (_substring == "")
                {
                    //Double [[
                    _escapeNext = true;
                    
                    array_push(_outArray, ord("["), undefined);
                    _tagArray = undefined;
                }
                else
                {
                    var _tagCloseSplit = string_split(_substring, "]", false, 1);
                    
                    if (array_length(_tagCloseSplit) == 1)
                    {
                        //No terminator
                        array_push(_outArray, ord("["), undefined);
                        
                        string_foreach(_tagCloseSplit[0], _funcForeach);
                        _tagArray = undefined;
                    }
                    else
                    {
                        var _tag = _tagCloseSplit[0];
                        
                        if (_tagArray == undefined)
                        {
                            _tagArray = [];
                            _outArray[array_length(_outArray)-1] = _tagArray;
                        }
                        
                        //Split the tag into parameters
                        var _tagSplitArray = string_split(_tag, ",");
                        
                        //Tidy up each part of the tag
                        array_map_ext(_tagSplitArray, function(_element, _index)
                        {
                            return string_trim(_element);
                        });
                        
                        //Push into the most recent array that stores tags
                        array_push(_tagArray, _tagSplitArray);
                        
                        //Push text after the last tag
                        if (_tagCloseSplit[1] != "")
                        {
                            string_foreach(_tagCloseSplit[1], _funcForeach);
                            _tagArray = undefined;
                        }
                    }
                }
                
                ++_i;
            }
            
            array_push(_outArray, 0x00);
            ++_line;
        }
    }
    
    return _breakdownArray;
}