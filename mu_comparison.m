% A code by Fávero Santos, 06/06/2018

clear;
clc;
close all;

raw_SPs = csvread("SP_cplx_V00_R02.csv");

% Creates a 3D matrix of 2x2xlenght(raw_SPs)
SP_sample_size = length(raw_SPs);
SP = zeros(2,2,SP_sample_size);

% Loads each sample of raw_SPs to SP
internal_counter = 0;
for internal_counter = 1:SP_sample_size
    SP(:,:,internal_counter) = reshape(raw_SPs(1:4,internal_counter), 2,2);
end

% Creates a frequency vector
frequency = [1E9:80E6:5E9];
%S11 = raw_SPs(1,:);
%S12 = raw_SPs(2,:);
%S21 = raw_SPs(3,:);
%S22 = raw_SPs(4,:);
%plot(frequency,S11);
%hold on;
%plot(frequency,S12);
%plot(frequency,S21);
%plot(frequency,S22);

% MATLAB ONLY
[mu, mu_prime] = stabilitymu(SP);
plot(frequency, mu);
hold on;

mubyBL = csvread("mubyBL.csv");
plot(frequency, mubyBL);
legend('Mu by Matlab','Mu by BL','Location','southwest');
