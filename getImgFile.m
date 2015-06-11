function y=getImgFile(filename)
img=imread(filename);%打开图片
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
y=char(res')%转成字符
end