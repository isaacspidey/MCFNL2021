
function [listo]=videodifu(nombre,contador)

video = VideoWriter([num2str(nombre),'.avi']); %create the video object
open(video); %open the file for writing
for ii=1:(contador-1) %where N is the number of images
  I = imread([num2str(ii),'.jpg']); %read the next image
  writeVideo(video,I); %write the image to file
end
close(video); %close the file

listo='listo';
end