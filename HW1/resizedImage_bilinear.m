function resizedImage =  resizedImage_bilinear(originalImage, scalingFactor)
    %取得圖片大小
    img_size = size(originalImage);
    %計算resize後的大小 並取整數
    zrow = fix(img_size(1)*scalingFactor);
    zcol= fix(img_size(2)*scalingFactor);
    
	%計算內插算式所需變數
	%變數aiz是新舊圖mapping用的 方便計算
    aiz = (1:zrow)/scalingFactor;
	%取floor得x
    ax1 = floor(aiz);
	%取floor後會出現0 但matlab矩陣的index從1開始 所以將矩陣中的0加1 其餘非0數字不變
    ax1 = fix(ax1+ 1 - (ax1./(ax1+1)));
	%取ceil得x+1
    ax2 = ceil(aiz);
	%取餘數得x'-x 並轉置這個矩陣
    arx = rem(aiz,1)';
    
    %計算內插算式所需變數
	%方法同上
    ajz =  (1:zcol)/scalingFactor;
    ay1 = floor(ajz);
    ay1 = fix(ay1+ 1 - (ay1./(ay1+1)));
    ay2 = ceil(ajz);
    ary = rem(ajz,1);
    
    
    %判斷是否為彩色圖
    if numel(img_size) == 3
        %是的話宣告一個3d陣列
        d = img_size(3);
        zoomimg = zeros(zrow,zcol,d);
		%將1d的矩陣做成3d方便運算
        darx = repmat(arx,1,zcol,3);
        dary = repmat(ary,zrow,1,3);
    else
        %否則宣告一個2d陣列
        zoomimg = zeros(zrow,zcol);
		%將1d的矩陣做成2d方便運算
        darx = repmat(arx,1,zcol);
        dary = repmat(ary,zrow,1);
    end
	
	%取得f(x,y) f(x,y+1) f(x+1,y) f(x+1,y+1)
    f11 = double(originalImage(ax1,ay1,:));
    f12 = double(originalImage(ax1,ay2,:));
    f21 = double(originalImage(ax2,ay1,:));
    f22 = double(originalImage(ax2,ay2,:));
    %做內插 用.*做矩陣的運算
    zoomimg = (1-darx).*((1-dary).*f11+dary.*f12) + darx.*((1-dary).*f21 + dary.*f22);

    %輸出結果
    resizedImage = zoomimg;
end

