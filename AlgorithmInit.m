T = tree([x0; 0]);  % initialize a empty tree; the format of the tree is [state; cost]
N = size(x0); % state dimensions

edge_map = containers.Map('KeyType','double','ValueType','any');
reachedset = containers.Map('KeyType','double','ValueType','any');
reachedset = addstatetoreachedset(x0, reachedset, 1);
edge_map(1) = containers.Map('KeyType','double','ValueType','any');

%% SST
I_map = [1, 1]; % I_map to store the vertex id before and after prune

S = [x0', 1]; % witness format [[witness state point, index of the representative vertex]; ...]

V_active = [1]; % include the idx of active vertex
V_inactive = []; % include the idx of inactive vertex