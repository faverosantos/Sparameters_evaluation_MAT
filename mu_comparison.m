% A code by Fávero Santos, 06/06/2018

clear;
clc;
close all;

%% Mu stability factor assessment

raw_SPs = csvread("./Sparams/Sparams_complex_c.csv");

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

% Loads under test parameters
mu_spm = csvread("./Sparams/mu_spm_a.csv");
mu_aasp = csvread("./Sparams/muasspm_a.csv");

[mu, mu_prime] = stabilitymu(SP);

figure(1);
plot(frequency, mu);
hold on;
plot(frequency, mu_spm);
plot(frequency, mu_aasp);
legend('Mu by Matlab','Mu by spm','Mu by aasp','Location','southwest');

%% K stability factor assessment

Kstd = csvread("./Sparams/Kstd_a.csv");
K_spm_a = csvread("./Sparams/K_spm_a.csv");

[K, B1, B2, Delta] = stabilityk(SP);

figure(2);
plot(frequency, K);
hold on;
plot(frequency, Kstd);
plot(frequency, K_spm_a);

legend('K by Matlab','K by Cadence','K by hand','Location','southwest');
