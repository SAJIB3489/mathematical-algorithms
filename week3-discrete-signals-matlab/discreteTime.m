% discrete time index
n = -10:10;   % range of n values

%% 1. Unit Impulse δ[n]
% Impulse is 1 at n=0 and 0 elsewhere
impulse = (n == 0);

figure;
stem(n, impulse, 'LineWidth', 1.5);
xlabel('discrete time n ---->');
ylabel('amplitude ---->');
title('Discrete time unit impulse signal');
grid on;

%% 2. Unit Step u[n]
% Step is 0 for n<0 and 1 for n>=0
step = double(n >= 0);

figure;
stem(n, step, 'LineWidth', 1.5);
xlabel('discrete time n ---->');
ylabel('amplitude ---->');
title('Unit step sequence');
grid on;

%% 3. Unit Ramp r[n]
% Ramp is 0 for n<0 and increases linearly for n>=0
ramp = n .* (n >= 0);

figure;
stem(n, ramp, 'LineWidth', 1.5);
xlabel('discrete time n ---->');
ylabel('amplitude ---->');
title('Unit ramp sequence');
grid on;

%% 4. Exponential Signal a^n
% Exponential sequence can decay or grow depending on 'a'
a = 0.9;  % base of exponential (0<a<1 → decay, a>1 → growth)
% exp_sig = (a .^ n) .* (n >= 0);  % defined for n>=0
exp_sig = a .^ n;

figure;
stem(n, exp_sig, 'LineWidth', 1.5);
xlabel('discrete time n ---->');
ylabel('amplitude ---->');
title('Discrete time exponential signal');
grid on;

%% 5. Signum Function sgn[n]
% Signum gives -1 for n<0, 0 for n=0, +1 for n>0
signum = sign(n);

figure;
stem(n, signum, 'LineWidth', 1.5);
xlabel('discrete time n ---->');
ylabel('amplitude ---->');
title('Discrete time signum function');
grid on;

%% 6. Sinc Function sinc[n]
% Discrete sinc defined as sin(pi*n)/(pi*n), with sinc(0)=1
%sinc_sig = sinc(n);  % MATLAB defines sinc(x) = sin(pi*x)/(pi*x)
sinc_sig = sinc(n/4);

figure;
stem(n, sinc_sig, 'LineWidth', 1.5);
xlabel('discrete time n ---->');
ylabel('amplitude ---->');
title('Discrete time sinc function');
grid on;
