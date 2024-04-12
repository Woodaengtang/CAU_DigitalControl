open_tf = zpk(-3, [0, -2, -1, -1], 1);
fig1 = figure(1);
rlocus(open_tf)