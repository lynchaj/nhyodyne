1 �	�	� � �1��2�%�3�8�4�N�5�_�6�p�7ʌ�8���9���A���B��C� �D�1�E�G�F�^�G�k�Hʕ�Iʼ�J���K��L�a�Mʇ�Nʷ�O�	�P�9�Q�i�Rʙ�S���T���U�*�V�F�W�b�X�~�Y���Z��� � 	�� � �1ʥ�2���3���4��5�6�6��7ʛ�8ʨ�9���A���B�	�C�7	�Z���>�I	>*�I	�d>�I	>*�I	�'�!0>�I	~�I	~#� �@��v	>�I	�\	ͤ	��v	>�I	�\	͔	�	�� � ��>�I	��I	�	�� 
 � !��	2���	2���	2�>�I	:��I	:��I	:��I	> �I	�	#� � ��>�I	��I	�>�I	>*�I	�!�>	�I	~�I	~#� ���v	>
�I	�\	ͤ	��v	>�I	�\	͔	�!�>�I	~�I	~#� �9�!>�I	~�I	~#�Q�>�I	>�I	�	_� 
 � !��	2�͔	>�I	:��I	�	�� 
 � !��	2�>�I	:��I	�>�I	�>�I	>
�I	> �I	>
�I	> �I	>d�I	> �I	>d�I	> �I	>�I	> �I	>�I	> �I	�!>�I	>}�I	> �I	>}�I	> �I	>�I	> �I	>�I	> �I	>�I	>��I	>�I	!���~�I	~#��R�N��>�I	>x�I	> �I	>x�I	> �I	>$�I	>�I	�>�I	>��I	> �I	>��I	> �I	>}�I	> �I	>}�I	> �I	�>�I	>��I	> �I	>��I	> �I	>�I	> �I	>�I	> �I	> �I	> �I	>�I	> �I	!�~�I	#���>�I	>2�I	> �I	>2�I	> �I	>}�I	> �I	>}�I	> �I	�>�I	>2�I	> �I	>2�I	> �I	>}�I	> �I	>}�I	> �I	�>�I	>��I	> �I	>��I	> �I	>}�I	> �I	>}�I	> �I	�>�I	>2�I	> �I	>2�I	> �I	>}�I	> �I	>}�I	> �I	��v	>�I	>2�I	> �I	>2�I	> �I	�\	͔	�\	͔	�\	͔	�>�I	>2�I	> �I	>2�I	> �I	>}�I	> �I	>}�I	> �I	�>�I	>��I	> �I	>��I	> �I	�>�I	>�I	> �I	>�I	> �I	�>�I	>�I	> �I	>�I	> �I	�	�� 
 � !��	2�> �I	:��I	�	�� 
 � !��	2�>!�I	:��I	��	�� 
 � !��	2�>"�I	:��I	��	� 
 � !��	2�>#�I	:��I	��>$�I	>d�I	> �I	>2�I	> �I	��	4� 
 � !��	2�	S� 
 � !��	2�	q� 
 � !��	2�	�� 
 � !��	2�	�� 
 � !��	2�	�� 
 � !��	2�	�� 
 � !��	2�>%�I	:��I	:��I	:��I	:��I	:��I	:��I	:��I	��	� 
 � !��	2�	>� 
 � !��	2�	[� 
 � !��	2�	w� 
 � !��	2�>&�I	:��I	:��I	:��I	:��I	��>'�I	>�I	��>(�I	>d�I	> �I	>2�I	> �I	��>)�I	��!>*�I	> �I	>�I	> �I	>�I	> �I	>�I	>��I	>�I	!���~�I	~#��R�	���>+�I	>d�I	> �I	>2�I	> �I	> �I	��>,�I	>�I	>�I	���۞��J	�Ӝ۞��T	�۞��\	۞��\	ۜ�۞��m	��́	۞��v	�۞�	ۜ�۞�ʋ	����ͳ	zͤ	{ͤ	�������_� �����W��	_z��	W��Ɛ'�@'���	�'�'�'�'O��	��~#�@0����	�
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
D>                                            W.                               
                                              X.                               
E>                                            Y.                               
F>                                                                           
G>                                                                           
H>                                                                           
I>                                                                           

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