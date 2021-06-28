function [pcm_encode] = Function_PCM_Encode(x, n)


y = x - min(x);  % 아날로그 신호를 y 좌표 0 값을 바닥으로 해가지고 떨어뜨림

norm_factor = max(y);  % norm_factor: Normalization Factor
                       % 신호의 최소값이 0인 상태에서 최대값을 구하면 신호의 전체 높이를 알 수 있으므로
                       % Normalization Factor를 구할 수 있음

y = (y*(2^(n)-1))/norm_factor;

y = round(y);  % Quantization을 진행함

temp = y;
pcm_encode = zeros(n, length(x));

for ii = 1:n  % Quantization 후의 숫자들을 2진수로 변환함
    pcm_encode(ii, :) = mod(temp, 2);  % 2로 나눈 나머지는 0 또는 1이 나옴
                                       % 이렇게 나온 숫자들을 계속 쌓음으로써 2진수 변환이 가능함
    temp = fix(temp/2);
end

pcm_encode = pcm_encode(end:-1:1,:);