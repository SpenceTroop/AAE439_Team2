%% Rocket Launch Script

clc;
clear;
close all;

%% Initilizations
data1 = load('Thrust_Curve.mat');
thrust = struct2array(data1); %N

data2 = load('M_dot.mat');
mdot = struct2array(data2); %kg/s

tstep = 1/2000; %2000 Hz data collection rate

t_b = length(thrust)*tstep;

Cd = 0.5; %Needs to be updated
A = 0.25*pi*(4/39.37)^2; %m - Needs to be checked
m = 2/2.205; %kg - Needs to be validated
g = 9.81; %m/s^2
v_wind = 1; %update for day

%% Calcs

t_avg = sum(thrust)/length(thrust); %N
mdot_avg = sum(mdot)/length(mdot); %kg/s

%% "Sims"

