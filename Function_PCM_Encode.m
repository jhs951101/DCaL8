function [pcm_encode] = Function_PCM_Encode(x, n)


y = x - min(x);  % �Ƴ��α� ��ȣ�� y ��ǥ 0 ���� �ٴ����� �ذ����� ����߸�

norm_factor = max(y);  % norm_factor: Normalization Factor
                       % ��ȣ�� �ּҰ��� 0�� ���¿��� �ִ밪�� ���ϸ� ��ȣ�� ��ü ���̸� �� �� �����Ƿ�
                       % Normalization Factor�� ���� �� ����

y = (y*(2^(n)-1))/norm_factor;

y = round(y);  % Quantization�� ������

temp = y;
pcm_encode = zeros(n, length(x));

for ii = 1:n  % Quantization ���� ���ڵ��� 2������ ��ȯ��
    pcm_encode(ii, :) = mod(temp, 2);  % 2�� ���� �������� 0 �Ǵ� 1�� ����
                                       % �̷��� ���� ���ڵ��� ��� �������ν� 2���� ��ȯ�� ������
    temp = fix(temp/2);
end

pcm_encode = pcm_encode(end:-1:1,:);