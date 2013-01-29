function [dist, pathList] = myDijkstra(start, A)

nodeCnt = size(A, 1);

dist = inf(nodeCnt, 1); 
dist(start) = 0;

traceList = zeros(nodeCnt, 1);

Pnodes = zeros(nodeCnt, 1);
Pnodes(start) = 1;

temp = start;
while sum(Pnodes)<nodeCnt
    Tnodes = find(Pnodes==0);
    for i=1:length(Tnodes)
        pst = Tnodes(i);
        thisDist = dist(temp)+A(temp, pst);
        if thisDist<dist(pst)
            dist(pst) = thisDist;
            traceList(pst) = temp;
        end
    end
    % dist(Tnodes) = min(dist(Tnodes)', dist(temp)+A(temp, Tnodes));    
    tmpb = find(dist(Tnodes)==min(dist(Tnodes)));
    temp = Tnodes(tmpb(1));
    Pnodes(temp) = 1;
end

pathList = {};
for i=1:nodeCnt
    disp(['Start: ' num2str(start) ' End: ' num2str(i) ' Dist: ' num2str(dist(i))]);
   if i~=start
       thisTrace = traceList(i);
       pathList{i} = thisTrace;
       while thisTrace~=start
           thisTrace = traceList(thisTrace);
           pathList{i} = [thisTrace pathList{i}];
       end
       disp(['Via: ' num2str(pathList{i}(2:end))]);
   end  
end