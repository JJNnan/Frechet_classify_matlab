function classfyResult=classfy(I,myfile,lengthsample,sampleResult)
%不同样品的匹配度排序，得到分类结果
[row,column]=size(I{1});
classfyResult=zeros(row,column);
min_ij=[];
for i=1:row
    for j=1:column
        for l=1:lengthsample
            min_ij(l)=sampleResult{l}(i,j);
        end
        [min_sample,p]=min(min_ij);
        classfyResult(i,j)=p;
    end
end
figure('NumberTitle', 'off', 'name','Frechet分类结果'),imshow(classfyResult,[]);
fprintf('分类结果输出完成！\n');
dlmwrite('Result.txt',classfyResult);
fprintf('输出到Result.txt文件！\n');
%保存结果envi文件
%方法1：
%----------------------------------
%fileENVI = fopen('Result','wb');
%fwrite(fileENVI,classfyResult','bit16');
%fclose(fileENVI);
%---------------------------
%方法2：
enviwrite(classfyResult,'Result');
fprintf('结果ENVI文件保存完成！\n');
%imshow(resultData,[]);
