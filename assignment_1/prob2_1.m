close all
clear all
clc

plant = tf(10, [1, 0, 0]);
lead_compen = tf([1, 1], [1, 1000]);
fig1 = figure(1);
rlocus(plant*lead_compen)

%%
gain = 350;
open_tf = gain*plant*lead_compen;
closed_tf = feedback(open_tf, 1);
info = stepinfo(closed_tf);
s = tf('s');
dc_gain = dcgain(closed_tf);
closed_tf = 1/dc_gain*closed_tf;
fig2 = figure(2);
step(closed_tf)
