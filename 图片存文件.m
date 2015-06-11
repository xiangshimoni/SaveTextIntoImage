fid = fopen('H:\code\matlab_files\图片藏文件\alphabet.txt', 'r');
%c = fread(fid, 5, 'uint8=>char')';
c = fread(fid);%读入文件数据
c=dec2bin(c);%转化为2进制数组
fclose(fid);
img=imread('H:\code\matlab_files\图片藏文件\1.png');%打开图片
figure,imshow(img)
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
imwrite(img,'D:\matlab_files\图片藏文件\res.png');
figure,imshow(img)

%===========================================

%从图片提取文件
img=imread('D:\matlab_files\图片藏文件\res.png');%打开图片
len1=[];
for i=1:32
    len1=[len1 num2str(bitget(img(i),1))];%提取文件行数
end
len1=bin2dec(len1);
len2=[];
for i=1:32
    len2=[len2 num2str(bitget(img(i),2))];%提取文件列数
end
len2=bin2dec(len2);

res=[];
for i=1:len1*len2
    res=[res num2str(bitget(img(i),3))];
end
res=reshape(res,[len1 len2]);%转成二进制数组
res=bin2dec(res);%转十进制
char(res')%转成字符