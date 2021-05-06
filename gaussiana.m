function [gaus]=gaussiana(media,desviacion,divisiones,fact)
    %Programa para generar una gaussiana
    %constantes
    gaus=zeros(1,divisiones);
    k=1;
    %Genero la gaussiana
    for i=-round(divisiones*0.5):round(divisiones*0.5)
        if k<divisiones
            gaus(k)=(desviacion*sqrt(2*pi))^(-1)...
                *exp(-(i*fact-media)^2/(2*desviacion));
            k=k+1;
        end
    end
end