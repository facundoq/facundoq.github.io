
% Verify integrity of the dataset.
%
% Author: Sebastian Nowozin <Sebastian.Nowozin@microsoft.com>

df=dir('../dbs/MSRC_12/data/*.csv');
disp(['Verifying ', num2str(numel(df)), ' sequences...']);

total_frames=0;
total_gestures=0;
Ysum=[];
for di=1:numel(df)
	[X,Y,tagset]=msrc12_load_file(strtok(df(di).name,'.'));
	assert(size(X,1)==size(Y,1));
	disp(['   ', num2str(di), '/', num2str(numel(df)), ...
		': "', df(di).name, '": ', num2str(size(X,1)), ' frames, ', ...
		num2str(sum(Y(:))), ' gestures']);

	total_frames=total_frames + size(X,1);
	total_gestures=total_gestures + sum(Y(:));

	if isempty(Ysum)
		Ysum=sum(Y);
	else
		Ysum=Ysum+sum(Y);
	end
end
disp([num2str(numel(df)), ' sequences, ', num2str(total_frames), ...
	' frames, ', num2str(total_gestures), ' gestures.']);

