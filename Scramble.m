% @author: Madeline Shao
clear all;
close all;
im_name='rdj.jpg';
picture = imread(im_name);
picture_black_white = rgb2gray(picture);% look at slide to see which command turns images black and white
[width, height] = size(picture_black_white); % take the size of the picture
n_rows =  3;% define the number of rows 
n_columns = 3;% define the number of columns 

h_breaks = linspace(1, width-1, n_columns+1);
w_breaks = linspace(1, height, n_rows+1);

piece_num=1;

 % create a loop to create the rows
for row = 1:n_rows
    for col = 1:n_columns % create a loop to create the columns   
        starth=round(h_breaks(row))+1
        endh=round(h_breaks(row+1))
        startw=round(w_breaks(col))+1
        endw=round(w_breaks(col+1))
        image_piece{piece_num}= picture_black_white(starth:endh,startw:endw);
        piece_num=piece_num+1;
    end
end

% use reshape and randperm. Specify the # of chunks, # of rows, # of columns in
%your scrambled picture. 
order=reshape(randperm(9),3,3);
% turn your the cell back into a matrix and index the matrix by the random order
% generated above 
piece_num=1;

 % create a loop to create the rows
for row = 1:n_rows
    for col = 1:n_columns % create a loop to create the columns        
        final_image(round(h_breaks(row))+1:round(h_breaks(row+1)),round(w_breaks(col))+1:round(w_breaks(col+1)))= cell2mat(image_piece(order(piece_num)));
        piece_num=piece_num+1;
    end
end

current=pwd;
% save the scrambled image using "imwrite" 
imwrite(final_image,strcat('scramble_',im_name));
