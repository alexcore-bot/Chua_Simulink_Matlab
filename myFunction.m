
function y = myFunction(u)
    x = u(1);
    %y = abs(x)
   
    m = -1.143;
    n = -0.714; 
 
    %y = n*x+0.5*(m-n)*(abs(x+1)-abs(x-1)); 

    %polynomial
    d = 2;
    a1 = -(35*(((d.^2) - 1).^2))*(m-n)/(16*d.^7);
    b1 = ((45*(d.^4) - 50*(d.^2) + 21)*(m-n)/(16*d.^5)) +n;
    y = a1*x.^3 + b1*x;

end

