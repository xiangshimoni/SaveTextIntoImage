function saveFileIntoImg(imgFileName,txtFileName)
fid = fopen(txtFileName, 'r');
%c = fread(fid, 5, 'uint8=>char')';
c = fread(fid);%读入文件数据
c=dec2bin(c);%转化为2进制数组
fclose(fid);
img=imread(imgFileName);%打开图片
%figure,imshow(img)
%先存行数到第一位
len1=size(c,1);
length = dec2bin(len1);
for i=1:32
    img(i)=bitset(img(i),1,0);    
end
for i=(33-size(length,2)):32
    img(i)=bitset(img(i),1,str2num(length(i+1-(33-size(length,2)))));
end
%再存列数到第二位
len2=size(c,2);
length = dec2bin(len2);
for i=1:32
    img(i)=bitset(img(i),2,0);    
end
for i=(33-size(length,2)):32
    img(i)=bitset(img(i),2,str2num(length(i+1-(33-size(length,2)))));
end
%存文件到第三位
for i=1:len1*len2
    img(i)=bitset(img(i),3,str2num(c(i)));%更改第一位
end
if(sum(imgFileName(end-3:end)~='.png')~=0)
    imgFileName(end-3:end)='.png';
    imwrite(img,imgFileName);
end
end