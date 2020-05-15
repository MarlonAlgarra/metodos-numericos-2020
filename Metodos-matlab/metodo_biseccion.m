clear; close; clc;
syms f x
f(x)=((x^2)/4)-sin(x);
a=1.5; b=2; e=0.00001; intervalo_grafica=a:.01:b; iteraciones=0;
plot(intervalo_grafica,f(intervalo_grafica))
hold on; grid on;
plot(a,f(a),'r*',b,f(b),'r*')
pause(1)
if a<b
    if vpa(f(a)*f(b))<0
        for i=1:1:5
            t=tic;
            r_temp=100;   
            while (b-a)/2>e
                iteraciones=iteraciones+1;
                r_temp=(a+b)/2;
                if vpa(f(a)*f(r_temp))<0
                    b=r_temp;
                    plot(b,f(b),'*r')
                    pause(.5)
                elseif vpa(f(a)*f(r_temp))>0
                    a=r_temp;
                    plot(a,f(a),'*r')
                    pause(.5)
                end
                sol=r_temp;
            end
            t=toc(t);
            tiempo(i)=t;
        end
        fprintf('La aproximación es: %f con %d iteraciones\n',sol,iteraciones)
        fprintf('Tiempo promedio transcurrido para la solución: %.6f segundos\n',mean(tiempo))
    else
        disp('Error 2')
    end
else
    disp('Error 1')
end
