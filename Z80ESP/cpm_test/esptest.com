1 �	%� � �1�Y�2�f�3�y�4ʏ�5ʠ�6ʱ�7���8�#�9�?�A�L�B�b�Cʠ�Z�T� � >̈́>*̈́�d>̈́>*̈́�h�!�>̈́~̈́~#� �ͱ>̈́͗���ͱ>̈́͗���	� � ��>̈́�̈́�	.� 
�� !��2��2��2�:���:���:���>̈́:�̈́:�̈́:�̈́> ̈́�	t� � ��>̈́�̈́�>̈́>*̈́�!P>	̈́~̈́~#� �T�ͱ>
̈́͗���ͱ>̈́͗����۞��Ӝ۞�ʏ�۞�۞�ʗۜ�۞�ʨ��ͼ۞�±�۞�¼ۜ�۞���������z��{���������_� �����W��_z��W��Ɛ'�@'���'�'�'�'O���~#�@0����	�
Nhodyne ESP32 IO board test


1> Output single char to VGA
2> Output 100 single chars to VGA
3> Output string to VGA
4> Get Keystroke
5> Get Key Buffer Length
6> Set Cursor visibility

7> Set serial baud rate
8> Set serial mode
9> Serial TX single char
A> Serial TX string
B> Serial RX
C> Serial Buffer Length

Z> Exit Program
$
[40;31mH[40;32mI [40;33mF[40;34mR[40;35mOM [40;36mN[40;37mH[40;91mY[40;92mO[40;93mD[40;94mY[40;95mN[40;96mE [40;97m.
 
0>DISABLE CURSOR
1>ENABLE CURSOR
$
ENTER BAUD RATE (6 DIGITS HEX):$
SUCCESSFUL SERIAL STRING WRITE.
 
ENTER SERIAL MODE: (8n1=0,8e1=1,8o1=2,7n1=3,7e1=4,7o1=5):$                                       