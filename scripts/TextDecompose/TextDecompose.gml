// Feather disable all

/// Decomposes a string into a "breakdown".
/// 
/// @param string

function TextDecompose(_string)
{
    static _scope = new (function() constructor
    {
        __linesArray = [];
        
        __Reset = function(_string)
        {
            __lineArray = [];
            __linesArray = [__lineArray];
        }
        
        __Foreach = function(_char, _pos)
        {
            var _code = ord(_char);
            if (_code < 0x20)
            {
                if (_code == 0x0A)
                {
                    //Terminator
                    array_push(__lineArray, 0x00);
                    
                    __lineArray = [];
                    array_push(__linesArray, __lineArray);
                }
            }
            else
            {
                array_push(__lineArray, _code);
            }
        }
        
    })();
    
    _scope.__Reset(_string);
    
    string_foreach(_string, _scope.__Foreach);
    
    array_push(_scope.__lineArray, 0x00);
    return _scope.__linesArray;
}