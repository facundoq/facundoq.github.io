function [tags]=msrc12_load_tagstream(tagstream_file, allowed_tags)
%LOAD_TAGSTREAM -- Load Rasmus's tagstream file format.
%
% Input
%    tagstream_file: filename of the '.tagstream' file.
%    allowed_tags: (optional), (1,S) cellarray of strings of allowed tag
%       names.  For every disallowed tag a warning will be printed.
%
% Output
%    tags: (1,T) structure array with fields,
%       .xqpctick: (1,1) uint64, xqpc tick as in the tagstream file.
%       .timestamp_usec: (1,1) uint64, equivalent microseconds tick mark.
%       .tagname: string with the actual tag name.
%
% Author: Sebastian Nowozin <Sebastian.Nowozin@microsoft.com>
fid=fopen(tagstream_file,'r');
A=textscan(fid,'%s %s','Whitespace',';');

fclose(fid);
if ~strcmp(A{1}(1),'XQPCTick') || ~strcmp(A{2}(1),'Tag')
	error(['Invalid tagstream file format']);
end

tags=struct('xqpctick', num2cell(cellfun(@(x)(sscanf(x,'%lu')),A{1}(2:end))), ...
	'timestamp_usec', ...
		num2cell(cellfun(@(x)((sscanf(x,'%lu')*1000 + 49875/2)/49875),...
			A{1}(2:end))),...
	'tagname',A{2}(2:end));

% Optionally verify the tags used
if nargin >= 2
	for ti=1:numel(tags)
		is_allowed_tag=~isempty(find(...
			cellfun(@(tagname)(strcmp(tags(ti).tagname,tagname)~=0), ...
				allowed_tags)));
		if ~is_allowed_tag
			warning(['Tag "', tags(ti).tagname, ...
				'" occuring in tagstream file "', ...
				tagstream_file, '" is not in the list of allowed tags.']);
		end
	end
end

