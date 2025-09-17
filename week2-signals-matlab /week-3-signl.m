
% Time axis
t = -5:0.01:5;   

%% 1. Unit Impulse δ(t)
% In continuous-time, impulse is ideal (infinite at t=0). 
% We approximate using a discrete representation:
impulse = (t==0);

figure;
subplot(3,2,1);
stem(t, impulse, 'LineWidth',1.5); % stem used to show discrete-like impulse
xlabel('t'); ylabel('\delta(t)');
title('Unit Impulse Signal');
grid on;

% I understood: Impulse is not exactly possible in MATLAB since it is infinite at t=0, 
% so we approximate it with a single spike at t=0 using stem().

%% 2. Unit Step u(t)
step = double(t >= 0);

subplot(3,2,2);
plot(t, step, 'LineWidth',1.5);
xlabel('t'); ylabel('u(t)');
title('Unit Step Signal');
axis([-5 5 -0.2 1.2]);
grid on;
% I understood: Step function stays 0 for t<0 and jumps to 1 at t>=0.

%% 3. Unit Ramp r(t)
ramp = t .* (t >= 0);

subplot(3,2,3);
plot(t, ramp, 'LineWidth',1.5);
xlabel('t'); ylabel('r(t)');
title('Unit Ramp Signal');
grid on;
% I understood: Ramp is 0 for t<0 and increases linearly with t for t>=0.

%% 4. Exponential Signal e^t
a = -0.5;   % you can change 'a' (decay or growth rate)
exp_sig = exp(a*t);

subplot(3,2,4);
plot(t, exp_sig, 'LineWidth',1.5);
xlabel('t'); ylabel('e^{at}');
title('Exponential Signal');
grid on;

% I understood: Exponential depends on parameter 'a'. 
% If a<0 it decays, if a>0 it grows, if a=0 it stays constant at 1.

%% 5. Signum Signal sgn(t)
signum = sign(t);  

subplot(3,2,5);
plot(t, signum, 'LineWidth',1.5);
xlabel('t'); ylabel('sgn(t)');
title('Signum Signal');
axis([-5 5 -1.2 1.2]);
grid on;

% I understood: Signum gives -1 for negative t, 0 at t=0, and +1 for positive t.

%% 6. Sinc Signal sinc(t) = sin(pi*t)/(pi*t)
sinc_sig = sinc(t);  % MATLAB's sinc is sin(pi*x)/(pi*x)

subplot(3,2,6);
plot(t, sinc_sig, 'LineWidth',1.5);
xlabel('t'); ylabel('sinc(t)');
title('Sinc Signal');
grid on;

% I understood: Sinc is defined as sin(pi*t)/(pi*t), it oscillates and decays around 0.