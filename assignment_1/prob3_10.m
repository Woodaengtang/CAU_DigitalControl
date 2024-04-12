close all
clear all
clc

Gs = tf(10, [1, 2, 0]);
Lc = 2.4 * tf([1, 2], [1, 8]);
TransferFunction = feedback(Gs*Lc, 1);

fig1 = figure(1);
step(TransferFunction)
info = stepinfo(TransferFunction);

Gh = tf(20, [1, 20]);
DelayedTransferFunction = feedback(Gh*Gs*Lc, 1);
fig2 = figure(2);
step(DelayedTransferFunction)
d_info = stepinfo(DelayedTransferFunction);
