d = zeros(2000,548);
names = cell(2000,1);
indexes=1;
for vidcount=9:9
    if vidcount ~= 10
        vid = ['0' num2str(vidcount)];
    end

    vidObj = VideoReader(['E:\PROJECTS\VideoForgery\video_tampering_dataset\videos\h264_lossy_q10\' vid '_original_enc10.avi']);
    numImgs = get(vidObj, 'NumberOfFrames');
    vidHeight = vidObj.Height;
    vidWidth = vidObj.Width;
    movie(1:numImgs) =struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),...
        'colormap',[]);
    % Read one frame at a time. 
    for k = 1 : numImgs
        movie(k).cdata =rgb2gray(read(vidObj,k));
        movie(k).colormap = gray;
    end
    lh = 9;
  
    for i=1:numImgs-1
        [row col] = size(movie(i).cdata);
        for x=1:row
            for y=1:col
                minm = 255;
                for z =-lh:lh
                    if i+z > 0 && i+z < numImgs
                        if (movie(i+z).cdata(x,y) < minm)
                            minm = movie(i+z).cdata(x,y);
                        end
                    end
                end
                C(i).cdata(x,y) = minm;
                R(i).cdata(x,y) = abs(movie(i).cdata(x,y) - C(i).cdata(x,y));
                R(i).colormap = gray;
            end
        end
        imwrite(R(i).cdata,['E:\PROJECTS\VideoForgery\output\' num2str(vidcount) '\' num2str(i) '.jpg'], 'JPEG');
        if mod(i,9) == 1 || mod(i,9) == 4 || mod(i,9) == 7
            F = ccpev548(['E:\PROJECTS\VideoForgery\output\' num2str(vidcount) '\' num2str(i) '.jpg'],75);
            for j=1:548
                d(indexes,j) = F(j);
            end
            names{indexes} = ['v' num2str(vidcount) '_' num2str(i) '.jpg'];
            indexes = indexes + 1;
        end
    end
end
names = cellfun( @(x) num2str(x), names, 'UniformOutput', false );
save E:\PROJECTS\VideoForgery\cover.mat d names -v7.3;
