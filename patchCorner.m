function [cornerTL,cornerBR]=patchCorner(patchX,patchY,patchSizeX,patchSizeY,patchOverlap,sx,sy)
% [cornerTL,cornerBR]=patchCorner(patchX,patchY,patchSizeX,patchSizeY,patchOverlap,sx,xy)
% Computes top-left (TL) and bottom-right (BR) coordinates of the patch. 

nPatchVec=[patchX,patchY];
patchSizeVec=[patchSizeX,patchSizeY];

if mod(nPatchVec(1)+1,2) % to allow for the "brick" overlap
    offsetBox = [0,-floor(patchSizeVec(2)/2)];
else
    offsetBox = [0 0];
end

cornerTL=max((nPatchVec-1).*(patchSizeVec-patchOverlap)+1+offsetBox,[1 1]);% top-left corner
cornerBR=min(nPatchVec.*patchSizeVec-(nPatchVec-1).*patchOverlap+offsetBox,[sx,sy]); % bottom-right corner