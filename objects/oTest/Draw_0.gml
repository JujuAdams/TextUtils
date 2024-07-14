// Feather disable all

var _timer = get_timer();

repeat(1_000)
{
    StringDecompose(10*"hello world");
}

draw_text(10, 10, (get_timer() - _timer)/1000);