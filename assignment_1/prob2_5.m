% case 1
lead_p = 10;
lead_z = 2;
open_tf = get_leadcompensator(lead_p, lead_z);
fig1 = figure(1);
rlocus(open_tf)

% case 2
lead_p = 5;
lead_z = 1;
open_tf = get_leadcompensator(lead_p, lead_z);
fig2 = figure(2);
rlocus(open_tf)

%%
function open = get_leadcompensator(p, z)
    plant = tf(1, [1, 0, 25, 0, 0]);
    lead_compensator = tf([1, z], [1, p]);
    open = plant*lead_compensator;
end