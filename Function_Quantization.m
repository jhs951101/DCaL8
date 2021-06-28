function [x_q] = Function_Quantization(x, n, normalization_flag)

min_x = -(2^(n-1)-1);  % min_x: 디지털 신호의 표현 범위 최소값
max_x = 2^(n-1);  % min_x: 디지털 신호의 표현 범위 최대값

A = max(abs(x));  % Normalization Factor;
if normalization_flag == 0
    x = x./A;
endx_q = x;
x_q = x_q.*(2^(n-1));  % n: 비트 자릿수
                       % 비트 자릿수에 따라 표헌 범위가 달라지므로 디지털 신호가 다르게 표현됨

x_q = x_q + 0.5;
x_q = round(x_q);  % 반올림은 0.5 이상인 경우에만 자릿수를 올리고, 아니면 버리는 기법임
                   % 이 기법을 통해 Quantization이 가능함 (가장 핵심이 되는 명령문)

x_q(x_q <= min_x) = min_x;
x_q(x_q >= max_x) = max_x;  % 값이 표헌 범위 바깥에 있을 경우, 안으로 밀어냄

x_q = x_q - 0.5;

x_q = x_q./(2^(n-1));