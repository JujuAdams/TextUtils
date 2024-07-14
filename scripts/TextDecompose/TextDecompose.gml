// Feather disable all

/// @param string

function TextDecompose(_string)
{
    static _scope = new (function() constructor
    {
        __result = [];
        
        __Reset = function(_string)
        {
            array_resize(__result, string_length(_string));
        }
        
        __Foreach = function(_char, _pos)
        {
            __result[_pos-1] = ord(_char);
        }
        
    })();
    
    _scope.__Reset(_string);
    
    string_foreach(_string, _scope.__Foreach);
    
    array_push(_scope.__result, 0x00);
    return _scope.__result;
}