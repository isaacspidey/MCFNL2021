%% Defino las variables 

%Para generar el gif
freb=input('Frecuencia base down: ');

frebMa=input('Frecuencia base top: ');

vector=freb:0.01:frebMa;
dime=size(vector);

%Valibles físicas del modelo (Uso U.N.)
e0const=1/4*pi;
mu0const=4*pi;

%Frecuencia en estas unidades
%(3eV es la frecuencia del rojo)
for n=1:dime(1,2)
    lambda=vector(n);
    k=lambda/(2*pi);

%Subdivisión espacial
    increX=lambda/20;

%Frecuencia según la relación de dispersión
    w=(2/increX)*sin(k*increX/2);

%Defino el número de subdivisiones espaciales
    dimeX=1000;

%% Inicializo los campos que voy a evolucionar
%Defino el campo electrico
    E=zeros(1,dimeX)';
    H=zeros(1,dimeX)';
%Defino las corrientes

%Fuentes reales
%J=ones(1,dimeX)';
    J=gaussiana(1,0.5,dimeX,0.01)';
%J=barrera(dimeX,round(0.30*dimeX),round(0.70*dimeX))';

%Defino en cada punto las constantes
    e0=e0const*ones(1,dimeX)';
    mu0=mu0const*ones(1,dimeX)';

%Defino la matriz que inicializa el sistema
    M=zeros(dimeX);

%Según las definiciones la subdivisiones nos lleva a que:
    for i=1:dimeX
        for j=1:dimeX
            if i==j
                M(i,j)=-2/(increX)^2 + w^2*e0(i)*mu0(i);
            elseif ((j==i-1)||(j==i+1))
                M(i,j)=(increX)^(-2);
            end
        end
    end

    [vectores,autovalores]=eig(M);

%Campo eléctrico obtenido
    E=M^(-1)*sqrt(-1)*w*(J.*mu0);

%Defino el campo con condiciones PEC
    CampoE=[E;0];

%Creo el magnético
    for i=1:dimeX
        H(i)=CampoE(i+1)-CampoE(i);
    end

%Defino el campo magnético
    H=(-sqrt(-1)/(w*increX))*(H./mu0);

%Defino el número de subdivisiones espaciales
    Espacio=1:dimeX;

%% Ploteo

%Proyección del campo eléctrico
    proyecciones=vectores'*imag(E);

%Inicializo la suma
    suma=zeros(1,dimeX)';

%Hago las sumas
    for i=1:dimeX
        suma = suma + proyecciones(i)*vectores(:,i);
    end

    %Ploteo
    figure(5)
    subplot(2,2,1)
    plot(Espacio,suma,'o-r')
    hold on
    plot(Espacio,J,'.-k')
    title(['Reconstrución con \lambda=',num2str(lambda),' y función corriente'])
    xlabel('Número de subdivisiones')
    legend('Reconstrución del campo E','Función corriente','Location','best')
    xlim([min(Espacio) max(Espacio)])
    hold off

    subplot(2,2,2)
    plot(proyecciones,'o')
    hold on
    title(['Histograma con max ',num2str(max(proyecciones)),' y min ',num2str(min(proyecciones))])
    xlabel('Número de autovalores')
    ylabel('Coeficientes proyectados en los autovectores')
    xlim([min(Espacio) max(Espacio)])
    hold off
    
    subplot(2,2,[3 4])
    bar(diag(autovalores))
    hold on
    fplot(4*pi*w,'.-k','LineWidth',2)
    title('Autovalores de operador evolución')
    xlabel('Número de autovalores')
    xlim([min(Espacio) max(Espacio)])
    legend('Histograma de Auto.',['Coeficiente w\mu_{0}=',num2str(4*pi*w)],'Location','best')
    hold off

    % ===para Hacer GIF===
    %    Image = getframe(gcf);
    %    P = frame2im(Image);
    %    number = num2str(n);
    %    extension = '.jpg';
    %    filename = [number,extension];
    %    imwrite(P,eval('filename'), 'jpg');
    
end

