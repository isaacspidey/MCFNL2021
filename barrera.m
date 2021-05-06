function [f]=barrera(divisiones,ini,final)
    %Programa para generar una barrera
    %constantes
    f=zeros(1,divisiones);
    %Genero la gaussiana
    for i=ini:final
        f(i)=1;
    end
end
