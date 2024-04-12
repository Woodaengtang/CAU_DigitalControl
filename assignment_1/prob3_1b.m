close all
clear all
clc

lead = tf([1, 0.8148], [1, 9.8]);
plant = tf(1, [1, 0, 0]);
open_tf = 47.52*lead*plant;

tofhz5  = 1 / 5;
tofhz10 = 1 / 10;
tofhz20 = 1 / 20;
delay5hz    = feedback(open_tf * tf(tofhz5, [1, tofhz5]), 1);
delay10hz   = feedback(open_tf * tf(tofhz10, [1, tofhz10]), 1);
delay20hz   = feedback(open_tf * tf(tofhz20, [1, tofhz20]), 1);

poles5hz  = roots(delay5hz.Denominator{1});
poles10hz = roots(delay10hz.Denominator{1});
poles20hz = roots(delay20hz.Denominator{1});

fig1 = figure(1);
rlocus(open_tf);
hold on
Hz5 = scatter(real(poles5hz), imag(poles5hz), 'red', 'filled');
Hz10 = scatter(real(poles10hz), imag(poles10hz), 'blue', 'filled');
Hz20 = scatter(real(poles20hz), imag(poles20hz), 'green', 'filled');
legend([Hz5, Hz10, Hz20], {'delay of 5Hz', 'delay of 10Hz', 'delay of 20Hz'})