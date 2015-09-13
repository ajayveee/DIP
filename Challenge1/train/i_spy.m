function [r,c] = i_spy ( object_im, big_im )
o_im = rgb2gray(object_im);%(1:3:end, 1:3:end, :)
b_im = rgb2gray(big_im);

[Ro, Co] = size(o_im);  
[Rb, Cb] = size(b_im); 

[x, y] = find(b_im(1:  Rb - (Ro-1), 1 : Cb - (Co-1)) == o_im(1,1));
pos = [x y];
Rx = size(pos, 1);
if (Rx == 1)
    r = x;
    c = y;
    return; 
end;

for x = 1 : Rx
    r = pos(x,1);
    c = pos(x,2);
    if (b_im(r+Ro-1, c+Co-1) ~= o_im(Ro, Co) || b_im(r+1,c+1) ~= o_im(2,2))
            continue;
    end;
    diff_val = b_im(r:r+(Ro-1), c:c+(Co-1)) - o_im; 
    if ( sum ( abs ( diff_val(:)) ) == 0 )
        return;
    end
end;