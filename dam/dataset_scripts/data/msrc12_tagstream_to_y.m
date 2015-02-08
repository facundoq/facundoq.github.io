function [Y]=msrc12_tagstream_to_y(X,tags,gestures,add_background);
%TAGSTREAM_TO_Y -- Convert tagstream format to Y annotation.
%
% Input
%    X: (T,1+NUI_SKELETON_POSITION_COUNT) recording.
%    tags: (1,U) structure read by load_tagstream.
%    gestures: (1,S) cellarray of strings with gesture names.  This order
%       defines the column order of the returned Y matrix.
%    add_background: (optional) flag, if >0, then an extra column with the
%       background gesture is added to the Y matrix.  Default: 0.
%
% Output
%    Y: (T,S) or (T,S+1) matrix with 0/1 elements indicating the different
%       action points for each gesture classes.  If add_background>0, then the
%       matrix is (T,S+1) and the last column corresponds to a background
%       gesture.
%
% Author: Sebastian Nowozin <Sebastian.Nowozin@microsoft.com>
T=size(X,1);
if nargin<4
	add_background=0;
end

S=numel(gestures);
if add_background > 0
	Y=zeros(T,S+1);
else
	Y=zeros(T,S);
end

% Process each column individually
for gi=1:S
	matching_tags=tags(find(arrayfun(@(s)(strcmp(s.tagname,gestures{gi})),tags)));
	for mi=1:numel(matching_tags)
		% Find closest sequence frame
		[frame_diff,frame_id]=min(abs(...
			int64(X(:,1))-int64(matching_tags(mi).timestamp_usec)));
		assert(numel(frame_id)==1);
		%disp(['Gesture "', gestures{gi}, '", frame ', num2str(frame_id)]);
        assert(numel(gi)==1);
		Y(frame_id,gi)=1;
	end
end
% Add background columns
if add_background > 0
	Y(:,S+1)=1-sum(Y,2);
end

assert(numel(unique(Y(:)))==2);

