%% A1  Warm up: Finite Sequences, Polynomial

syms n z
% Example i)
X1 = 1 + 2*z^(-1) + 5*z^(-2)
pretty(X1)
% Example ii) include the zeros explicitly
X2 = 0 + 3*z^(-1) + 0*z^(-2) + 4*z^(-3)
pretty(X2)


%% A2  Z-transform of Infinite Sequences & ROC

syms n z a
assume(abs(a) < 1)
X = ztrans(a^n * heaviside(n), n, z)        % a = 0.6 or a = -0.8
X_left = ztrans(- (0.9)^n * heaviside(-n-1), n, z)

%% A3  Z-transform of Properties: Linearity and Shifting

syms n z
x1 = (0.5)^n * heaviside(n);
x2 = (-0.5)^n * heaviside(n);
X_lin = ztrans(2*x1 - 3*x2, n, z)
X_shift = ztrans( subs(x1, n, n-3), n, z)   % x1[n-3]


%% A4  Inverse Z-transform

syms n z
Xa = 1 / (1 - 0.7*z^(-1));
xa = iztrans(Xa, z, n)
Xb = (1 - 0.5*z^(-1)) / (1 - 0.8*z^(-1));
xb = iztrans(Xb, z, n)

%% A5  H(z), Poles/Zeros & Frequency Response

%% Plot poles and zeros with zplane, list their values.

b = [1 -2.4 2.88];
a = [1 -0.8 0.64];
figure; zplane(b,a); grid on; title('Pole-Zero Plot');
disp('Zeros:'); roots(b)
disp('Poles:'); roots(a)

%% Plot magnitude and phase responses with freqz

[H, w] = freqz(b, a, 512);
figure;
subplot(2,1,1); plot(w/pi, abs(H)); grid on; ylabel('|H|'); title('Magnitude');
subplot(2,1,2); plot(w/pi, angle(H)); grid on; xlabel('\omega/\pi'); ylabel('Phase');