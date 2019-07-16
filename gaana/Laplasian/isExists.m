function [ output ] = isExists( x,y,row,col )
    
    if x <= 0 || y <= 0
        output = 0;
    elseif x > row || y > col
        output = 0;
    else
        output = 1;
    end
end

