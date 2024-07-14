// Feather disable all

/// @param string

function StringSplit(_string)
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
    
    
    
    var _outArray = _scope.__Reset();
    
    //Empty string
    if (_string != "")
    {
        var _firstSplit = string_split(_string, "[");
        if (_firstSplit[0] != "") string_foreach(_firstSplit[0], _funcForeach);
        
        var _tagArray = undefined;
        
        var _escapeNext = false;
        var _i = 1;
        repeat(array_length(_firstSplit)-1)
        {
            var _substring = _firstSplit[_i];
            
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
                var _secondSplit = string_split(_substring, "]", false, 1);
                
                if (array_length(_secondSplit) == 1)
                {
                    //No terminator
                    array_push(_outArray, ord("["), undefined);
                    
                    string_foreach(_secondSplit[0], _funcForeach);
                    _tagArray = undefined;
                }
                else
                {
                    var _tag = _secondSplit[0];
                    
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
                    if (_secondSplit[1] != "")
                    {
                        string_foreach(_secondSplit[1], _funcForeach);
                        _tagArray = undefined;
                    }
                }
            }
            
            ++_i;
        }
    }
    
    array_push(_outArray, 0x00);
    
    return _outArray;
}