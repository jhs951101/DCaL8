function [x_q] = Function_Quantization(x, n, normalization_flag)

min_x = -(2^(n-1)-1);  % min_x: ������ ��ȣ�� ǥ�� ���� �ּҰ�
max_x = 2^(n-1);  % min_x: ������ ��ȣ�� ǥ�� ���� �ִ밪

A = max(abs(x));  % Normalization Factor;
if normalization_flag == 0
    x = x./A;
endx_q = x;
x_q = x_q.*(2^(n-1));  % n: ��Ʈ �ڸ���
                       % ��Ʈ �ڸ����� ���� ǥ�� ������ �޶����Ƿ� ������ ��ȣ�� �ٸ��� ǥ����

x_q = x_q + 0.5;
x_q = round(x_q);  % �ݿø��� 0.5 �̻��� ��쿡�� �ڸ����� �ø���, �ƴϸ� ������ �����
                   % �� ����� ���� Quantization�� ������ (���� �ٽ��� �Ǵ� ��ɹ�)

x_q(x_q <= min_x) = min_x;
x_q(x_q >= max_x) = max_x;  % ���� ǥ�� ���� �ٱ��� ���� ���, ������ �о

x_q = x_q - 0.5;

x_q = x_q./(2^(n-1));