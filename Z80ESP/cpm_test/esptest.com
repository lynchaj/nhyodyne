1 �	�
� � �1�6�2�C�3�V�4�l�5�}�6ʎ�7ʪ�8���9�
�A��B�-�C�>�D�O�E�e�F�|�Gʉ�Hʳ�I���J���K�&�L��Mʥ�N���O�'�P�W�Qʇ�Rʷ�S���T��U�H�V�d�Wʀ�Xʜ�Y���Z��� � 	�� � �1���2���3��4�8�5�T�6�5�7ʹ�8���9���A���B�4	�C�U	�D�g	�Eʫ	�F��	�G��	�H��	�I��	�Z���>�
>*�
�d>�
>*�
�E�!F>�
~�
~#� �^��9
>�
�
Ͳ
��9
>�
�
͢
�	�� � ��>�
��
�	�� 
� !��
2��
2��
2>�
:�
:�
:�
> �
�	9� � ��>�
��
�>�
>*�
�!>	�
~�
~#� ���9
>
�
�
Ͳ
��9
>�
�
͢
�!�>�
~�
~#� �W�!>�
~�
~#�o�>�
>�
�	u� 
� !��
2͢
>�
:�
�	�� 
� !��
2>�
:�
�>�
�>�
>
�
> �
>
�
> �
>d�
> �
>d�
> �
>�
> �
>�
> �
�!4>�
>}�
> �
>}�
> �
>�
> �
>�
> �
>�
>��
>�
!4���~�
~#��R�l��>�
>x�
> �
>x�
> �
>$�
>�
�>�
>��
> �
>��
> �
>}�
> �
>}�
> �
�>�
>��
> �
>��
> �
>�
> �
>�
> �
> �
> �
>�
> �
!�~�
#��>�
>2�
> �
>2�
> �
>}�
> �
>}�
> �
�>�
>2�
> �
>2�
> �
>}�
> �
>}�
> �
�>�
>��
> �
>��
> �
>}�
> �
>}�
> �
�>�
>2�
> �
>2�
> �
>}�
> �
>}�
> �
��9
>�
>2�
> �
>2�
> �
�
͢
�
͢
�
͢
�>�
>2�
> �
>2�
> �
>}�
> �
>}�
> �
�>�
>��
> �
>��
> �
�>�
>�
> �
>�
> �
�>�
>�
> �
>�
> �
�	�� 
� !��
2> �
:�
�	�� 
� !��
2>!�
:�
��	� 
� !��
2>"�
:�
��	(� 
� !��
2>#�
:�
��>$�
>d�
> �
>2�
> �
��	J� 
� !��
2	i� 
� !��
2	�� 
� !��
2	�� 
� !��
2	�� 
� !��
2	�� 
� !��
2	� 
� !��
2>%�
:�
:�
:�
:�
:�
:�
:�
��	4� 
� !��
2	T� 
� !��
2	q� 
� !��
2	�� 
� !��
2>&�
:�
:�
:�
:�
��>'�
>�
��>(�
>d�
> �
>2�
> �
��>)�
��!4>*�
> �
>�
> �
>�
> �
>�
>��
>�
!4���~�
~#��R�!	���>+�
>d�
> �
>2�
> �
> �
��>,�
>�
>�
��	�� 
� !��
2��
2��
2>�W
:�W
:�W
:�W
> �W
�	9� � ��>�W
��W
�>�W
>*�W
�!>	�W
~�W
~#� ��	��9
>
�W
�j
Ͳ
�̈́
>�W
�j
͢
��۞��
�Ӝ۞��
�۞��
۞��
ۜ�۞��0
���D
۞��9
�۞��D
ۜ�۞��N
���۞��X
�ӝ۞��b
�۞��j
۞��j
۝�۞��{
��͏
۞�
�۞�
۝�۞�ʙ
������
zͲ
{Ͳ
�������_� �����W��
_z��
W��Ɛ'�@'���
�'�'�'�'O��
��~#�@0����	�
                            Nhodyne ESP32 IO board test


1> Output single char to VGA                  J.  COPY RECT                    
2> Output 100 single chars to VGA             K.  DRAW BITMAP                  
3> Output string to VGA                       L.  DRAW CHAR                    
4> Get Keystroke                              M.  DRAW ELLIPSE                 
5> Get Key Buffer Length                      N.  DRAW GLYPH                   
6> Set Cursor visibility                      O.  DRAW LINE                    
                                              P.  DRAW RECTANGLE               
7> Set serial baud rate                       Q.  FILL ELLIPSE                 
8> Set serial mode                            R.  FILL RECTANGLE               
9> Serial TX single char                      S.  GET PIXEL                    
A> Serial TX string                           T.  INVERT RECTANGLE             
B> Serial RX                                  U.  LINE TO                      
C> Serial Buffer Length                       V.  MOVE TO                      
                                              W.  SCROLL                       
D> Play String                                X.  SET BRUSH COLOR              
E> Play Sound
F> Set Volume

G> Set Resolution
H> Load Font
I> Clear                                      Y.  MENU PAGE TWO                

Z> Exit Program
$
                       Nhodyne ESP32 IO board test PAGE 2


1>  SET LINE END TYPE                         J.                               
2>  SET PEN COLOR                             K.                               
3>  SET PEN WIDTH                             L.                               
4>  SET PIXEL                                 M.                               
5>  SET GLYPH OPTIONS                         N.                               
6>  SET PALLETTE ITEM                         O.                               
7>  SET MOUSE CURSOR                          P.                               
8>  SET MOUSE CURSOR POSITION                 Q.                               
                                              R.                               
9> REMOVE SPRITES                             S.                               
A> SET SPRITE MAP                             T.                               
B> SET SPRITE LOCATION                        U.                               
C> SET SPRITE VISIBILITY                      V.                               
                                              W.                               
D> Set serial 2 baud rate                     X.                               
E> Set serial 2 mode                          Y.                               
F> Serial 2 TX single char                                                     
G> Serial 2 TX string                                                          
H> Serial 2 RX                                                                 
I> Serial 2 Buffer Length                                                      

Z> MENU PAGE ONE
$
[40;31mH[40;32mI [40;33mF[40;34mR[40;35mOM [40;36mN[40;37mH[40;91mY[40;92mO[40;93mD[40;94mY[40;95mN[40;96mE [40;97m.
 
0>DISABLE CURSOR
1>ENABLE CURSOR
$
ENTER BAUD RATE (6 DIGITS HEX):$
SUCCESSFUL SERIAL STRING WRITE.
 
ENTER SERIAL MODE: (8n1=0,8e1=1,8o1=2,7n1=3,7e1=4,7o1=5):$
ENTER SCREEN RESOLUTION (2 DIGITS HEX):$
ENTER FONT (2 DIGITS HEX):$
ENTER BRUSH COLOR (2 DIGITS HEX):$
ENTER LINE END TYPE (2 DIGITS HEX):$
ENTER PEN COLOR (2 DIGITS HEX):$
ENTER PEN WIDTH (2 DIGITS HEX):$
GLYPH BLANK? (2 DIGITS HEX):$
GLYPH BOLD? (2 DIGITS HEX):$
GLYPH DOUBLE WIDE? (2 DIGITS HEX):$
GLYPH FILL BACKGROUND (2 DIGITS HEX):$
GLYPH INVERT (2 DIGITS HEX):$
GLYPH ITALIC (2 DIGITS HEX):$
GLYPH UNDERLINE (2 DIGITS HEX):$
PALETTE INDEX (2 DIGITS HEX):$
PALETTE B  (2 DIGITS HEX):$
PALETTE G (2 DIGITS HEX):$
PALETTE R (2 DIGITS HEX):$A4 4 2 A4 4 2 A#4 4 2 C5 4 2 C5 4 2 A#4 4 2 A4 4 2 G4 4 2 F4 4 2 F4 4 2 G4 4 2 A4 4 2 A4 2 2 G4 16 2 G4 2 2 P 8 2     �   x                                �   �   �   �                                               �����   ��^M�   �                                               ���������   �   �                                                   �������������   �   �   �           �   �                       �   �   �����������������   �   �����   �                       ��^M�   �   �������������������������   �                       ��^M�   �   �   ���������������������   �                   ��^M�?,�   �       �����������������   �                       �?,�   �           �����������������   �                   ��^M�?,�   �           �������������   �                       ��^M�?,�   �       �������������   �               �   �   ��^M�?,�   �           �����   �   �                   ��^M��^M�?,�   �               �   �                           �?,�?,�   �                                                       �   �                                                    ��?�m���9�                                       