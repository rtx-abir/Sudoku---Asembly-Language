;Sudoku by Abir Deb
.model tiny
.data
greet db 'Welcome to Sudoku' ;string
len1 equ $ - greet
author db 'By Abir Deb'
len2 equ $ - author
inst db 'press w a s d to'
len3 equ $ - inst
inst2 db 'move around the board'
len4 equ $ - inst2
inst3 db 'use 1 to 9 and E F G'
len5 equ $ - inst3
inst4 db 'to input your numbers'
len6 equ $ - inst4
inst5 db 'from 1-12 and EFG is 10-12'
len7 equ $ - inst5
inst6 db 'Backspace deletes cell'
len8 equ $ - inst6
inst7 db 'A million IQ required'
len9 equ $ - inst7
inst8 db 'to solve this board'
len10 equ $  - inst8
inst9 db 'So good luck and Enjoy!'
len11 equ $ - inst9
inst10 db 'Wrong!'
len12 equ $ -inst10
inst11 db 'Right!'
len13 equ $ -inst11
inst12 db '(tab)to quit,(p)check answer'
len14 equ $ - inst12
inst13 db 'm,n,o,t to change boards'
len15 equ $ - inst13
row1 db  '         3                           8       7'
leng1 equ $ - row1
row2 db  ' 4   9           8       3   2   5            '
leng2 equ $ - row2
row3 db  '     6   1   7   F   5                   3    '
leng3 equ $ - row3
row4 db  ' 5                   4               F   1    '
leng4 equ $ - row4
row5 db  '     E                   G           3        '
leng5 equ $ - row5
row6 db  ' G           4   2           8       E        '
leng6 equ $ - row6
row7 db  '         2       E           4   6           3'
leng7 equ $ - row7
row8 db  '         G           6                   8    '
leng8 equ $ - row8
row9 db  '     8   7               F                   9'
leng9 equ $ - row9
row10 db  '     7                   8   5   1   6   F    '
leng10 equ $ - row10
row11 db  '             6   9   2       1           G   4'
leng11 equ $ - row11
row12 db  ' E       5                           9        '
leng12 equ $ - row12
roow1 db  '         F                       9   6        '
lengt1 equ $ - roow1
roow2 db  ' E           2   6   F       G           8    '
lengt2 equ $ - roow2
roow3 db  ' 5   9   1       4       8                   F'
lengt3 equ $ - roow3
roow4 db  '         7               5                   6'
lengt4 equ $ - roow4
roow5 db  '         G       3           2   F       5    '
lengt5 equ $ - roow5
roow6 db  ' 6       9           4           E            '
lengt6 equ $ - roow6
roow7 db  '             8           2           4       1'
lengt7 equ $ - roow7
roow8 db  '     2       7   G           6       3        '
lengt8 equ $ - roow8
roow9 db  ' 3                   7               F        '
lengt9 equ $ - roow9
roow10 db  ' 9                   6       8       5   1   4'
lengt10 equ $ - roow10
roow11 db  '     5           E       G   1   2           7'
lengt11 equ $ - roow11
roow12 db  '         8   3                       E        '
lengt12 equ $ - roow12
rooow1 db  '         6   E           1   5   4           G'
lenn1 equ $ - rooow1
rooow2 db  ' 3       5           F   E           9   8    '
lenn2 equ $ - rooow2
rooow3 db  '     F                   9       E   5        '
lenn3 equ $ - rooow3
rooow4 db  '                             2       E        '
lenn4 equ $ - rooow4
rooow5 db  '     5       G                   6           2'
lenn5 equ $ - rooow5
rooow6 db  ' 2   9       F   8                       3    '
lenn6 equ $ - rooow6
rooow7 db  '     3                       7   8       9   F'
lenn7 equ $ - rooow7
rooow8 db  ' G           2                   7       1    '
lenn8 equ $ - rooow8
rooow9 db  '         1       4                            '
lenn9 equ $ - rooow9
rooow10 db  '         2   6       3                   4    '
lenn10 equ $ - rooow10
rooow11 db  '     1   F           6   4           3       E'
lenn11 equ $ - rooow11
rooow12 db  ' 8           9   7   2           5   6        '
lenn12 equ $ - rooow12
roooww1 db  '     9       1   4           E       8        '
lennn1 equ $ - roooww1
roooww2 db  '             3       9               6       5'
lennn2 equ $ - roooww2
roooww3 db  ' 8                       1           7        '
lennn3 equ $ - roooww3
roooww4 db  '         7                       2   E        '
lennn4 equ $ - roooww4
roooww5 db  ' F   2   5       6   3                       7'
lennn5 equ $ - roooww5
roooww6 db  ' G           9   E       7   4           3    '
lennn6 equ $ - roooww6
roooww7 db  '     F           G   4       5   9           1'
lennn7 equ $ - roooww7
roooww8 db  ' 2                       E   3       F   5   6'
lennn8 equ $ - roooww8
roooww9 db  '         3   8                       G        '
lennn9 equ $ - roooww9
roooww10 db  '         1           F                       E'
lennn10 equ $ - roooww10
roooww11 db  ' E       2               6       G            '
lennn11 equ $ - roooww11
roooww12 db  '         4       8           9   7       F    '
lennn12 equ $ - roooww12
check db 'Answer Check (PRESS P):'
lenCheck equ $ - check
lowercase db 'use lowercase letters only'
lencase equ $ - lowercase


.code
org 100h

Start:
	mov ax,cs
	mov ds,ax
	
	mov al, 03h
	mov ah, 0     ; set video mode, text mode 80x25, 8 pages
	int 10h


	mov ah, 06h     ; clears the screen
	sub al, al
	sub cx, cx
	mov dx, 184Fh
	mov bh, 07h
	int 10h

	mov ch, 0
	mov cl, 7      ; setting cursor shape
	mov ah, 1
	int 10h

	mov al,0
	mov ah, 05h   ;setting current active page to 0
	int 10h
	
;greetings and instruction strings	
continue6:			
xor dh,dh		;resets dh from last code
mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len1
mov dl,53
mov dh,1
mov bp, offset greet
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len2
mov dl,53
mov dh,2
mov bp, offset author
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len15
mov dl,53
mov dh,3
mov bp, offset inst13
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len14
mov dl,51
mov dh,4	
mov bp, offset inst12
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len3
mov dl,53
mov dh,5
mov bp, offset inst
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len4
mov dl,53
mov dh,6
mov bp, offset inst2
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len5
mov dl,53
mov dh,8
mov bp, offset inst3
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len6
mov dl,53
mov dh,9
mov bp, offset inst4
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len7
mov dl,53
mov dh,10
mov bp, offset inst5
mov ah,13h
int 10h

xor dh,dh		;resets dh from last code
mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx,lencase
mov dl,53
mov dh,11
mov bp, offset lowercase
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len8
mov dl,53
mov dh,12
mov bp, offset inst6
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len9
mov dl,53
mov dh,15
mov bp, offset inst7
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len10
mov dl,53
mov dh,16
mov bp, offset inst8
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b	;move attribute here
mov cx, len11
mov dl,53
mov dh,18
mov bp, offset inst9
mov ah,13h
int 10h

mov al,1
mov bh,0
mov bl,00001101b
mov cx, lenCheck
mov dl,53
mov dh,21
mov bp, offset check
mov ah,13h
int 10h

;BOARD 1 PRESET NUMBERS
board1:
	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng1
	mov dl,0
	mov dh,1
	mov bp, offset row1
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng2
	mov dl,0
	mov dh,3
	mov bp, offset row2
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng3
	mov dl,0
	mov dh,5
	mov bp, offset row3
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng4
	mov dl,0
	mov dh,7
	mov bp, offset row4
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng5
	mov dl,0
	mov dh,9
	mov bp, offset row5
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng6
	mov dl,0
	mov dh,11
	mov bp, offset row6
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng7
	mov dl,0
	mov dh,13
	mov bp, offset row7
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng8
	mov dl,0
	mov dh,15
	mov bp, offset row8
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng9
	mov dl,0
	mov dh,17
	mov bp, offset row9
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng10
	mov dl,0
	mov dh,19
	mov bp, offset row10
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng11
	mov dl,0
	mov dh,21
	mov bp, offset row11
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, leng12
	mov dl,0
	mov dh,23
	mov bp, offset row12
	mov ah,13h
	int 10h

		mov si, 11
		mov dh, 2
	cursor1:					; loops the horizontal 
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,2
		call horizontal
		dec si
		jnz cursor1
		jz continue1


	horizontal proc			
		mov ah, 09h
		mov al, 205				;=   1st Horizontal
		mov bh, 0
		mov bl, 00001111b		;white on black background
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontal endp

	horizontalRed proc			
		mov ah, 09h
		mov al, 205				;=   
		mov bh, 0
		mov bl, 00001100b		;light red
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontalRed endp

	continue1:			;breaks out of loop cursor1
		mov si,12
		mov dh,1
		mov dl, 3

	cursor2:							;loops the vertical lines by moving the cursor position to the right
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call vertical
		dec si	
		jnz cursor2
		jz continue2

	vertical proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001111b		;white on black background
		mov cx, 1
		int 10h
		ret
	vertical endp

	verticalMagenta proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001101b	;Magenta
		mov cx, 1
		int 10h
		ret
	verticalMagenta endp

	continue2:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,4			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL cursor2			
		JE continue3

	continue3:
		mov si, 3
		mov dh, 6
	Recoloring:
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,6
		call horizontalRed
		dec si
		jnz recoloring
		jz continue4
		
	Continue4:
		sub dh,dh
		sub dl,dl
		mov si,12
		mov dh,1
		mov dl, 15

	recoloring2:
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call verticalMagenta
		dec si	
		jnz recoloring2
		jz continue5

	continue5:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,16			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL recoloring2
		JE rangejump1
	rangejump1:
		mov dh, 1			;set row (0-24)
		mov dl, 1			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		jmp keyboard
;BOARD 2 PRESET NUMBERS
board2:
	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt1
	mov dl,0
	mov dh,1
	mov bp, offset roow1
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt2
	mov dl,0
	mov dh,3
	mov bp, offset roow2
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt3
	mov dl,0
	mov dh,5
	mov bp, offset roow3
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt4
	mov dl,0
	mov dh,7
	mov bp, offset roow4
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt5
	mov dl,0
	mov dh,9
	mov bp, offset roow5
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt6
	mov dl,0
	mov dh,11
	mov bp, offset roow6
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt7
	mov dl,0
	mov dh,13
	mov bp, offset roow7
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt8
	mov dl,0
	mov dh,15
	mov bp, offset roow8
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt9
	mov dl,0
	mov dh,17
	mov bp, offset roow9
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt10
	mov dl,0
	mov dh,19
	mov bp, offset roow10
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt11
	mov dl,0
	mov dh,21
	mov bp, offset roow11
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lengt12
	mov dl,0
	mov dh,23
	mov bp, offset roow12
	mov ah,13h
	int 10h

		mov si, 11
		mov dh, 2
	cursor11:					; loops the horizontal 
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,2
		call horizontal1
		dec si
		jnz cursor11
		jz continue11


	horizontal1 proc			
		mov ah, 09h
		mov al, 205				;=   1st Horizontal
		mov bh, 0
		mov bl, 00001111b		;white on black background
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontal1 endp

	horizontalRed1 proc			
		mov ah, 09h
		mov al, 205				;=   
		mov bh, 0
		mov bl, 00001100b		;light red
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontalRed1 endp

	continue11:			;breaks out of loop cursor1
		mov si,12
		mov dh,1
		mov dl, 3

	cursor12:							;loops the vertical lines by moving the cursor position to the right
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call vertical1
		dec si	
		jnz cursor12
		jz continue12

	vertical1 proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001111b		;white on black background
		mov cx, 1
		int 10h
		ret
	vertical1 endp

	verticalMagenta1 proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001101b	;Magenta
		mov cx, 1
		int 10h
		ret
	verticalMagenta1 endp

	continue12:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,4			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL cursor12			
		JE continue13

	continue13:
		mov si, 3
		mov dh, 6
	Recoloring1:
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,6
		call horizontalRed1
		dec si
		jnz recoloring1
		jz continue14
		
	Continue14:
		sub dh,dh
		sub dl,dl
		mov si,12
		mov dh,1
		mov dl, 15

	recoloring12:
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call verticalMagenta1
		dec si	
		jnz recoloring12
		jz continue15

	continue15:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,16			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL recoloring12
		JE rangejump2
	rangejump2:
		mov dh, 1			;set row (0-24)
		mov dl, 1			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		jmp keyboard

board3:
	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn1
	mov dl,0
	mov dh,1
	mov bp, offset rooow1
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn2
	mov dl,0
	mov dh,3
	mov bp, offset rooow2
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn3
	mov dl,0
	mov dh,5
	mov bp, offset rooow3
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn4
	mov dl,0
	mov dh,7
	mov bp, offset rooow4
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn5
	mov dl,0
	mov dh,9
	mov bp, offset rooow5
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn6
	mov dl,0
	mov dh,11
	mov bp, offset rooow6
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn7
	mov dl,0
	mov dh,13
	mov bp, offset rooow7
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn8
	mov dl,0
	mov dh,15
	mov bp, offset rooow8
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn9
	mov dl,0
	mov dh,17
	mov bp, offset rooow9
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn10
	mov dl,0
	mov dh,19
	mov bp, offset rooow10
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn11
	mov dl,0
	mov dh,21
	mov bp, offset rooow11
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lenn12
	mov dl,0
	mov dh,23
	mov bp, offset rooow12
	mov ah,13h
	int 10h

		mov si, 11
		mov dh, 2
	cursor21:					; loops the horizontal 
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,2
		call horizontal2
		dec si
		jnz cursor21
		jz continue21


	horizontal2 proc			
		mov ah, 09h
		mov al, 205				;=   1st Horizontal
		mov bh, 0
		mov bl, 00001111b		;white on black background
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontal2 endp

	horizontalRed2 proc			
		mov ah, 09h
		mov al, 205				;=   
		mov bh, 0
		mov bl, 00001100b		;light red
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontalRed2 endp

	continue21:			;breaks out of loop cursor1
		mov si,12
		mov dh,1
		mov dl, 3

	cursor22:							;loops the vertical lines by moving the cursor position to the right
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call vertical2
		dec si	
		jnz cursor22
		jz continue22

	vertical2 proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001111b		;white on black background
		mov cx, 1
		int 10h
		ret
	vertical2 endp

	verticalMagenta2 proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001101b	;Magenta
		mov cx, 1
		int 10h
		ret
	verticalMagenta2 endp

	continue22:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,4			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL cursor22			
		JE continue23

	continue23:
		mov si, 3
		mov dh, 6
	Recoloring21:
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,6
		call horizontalRed2
		dec si
		jnz recoloring21
		jz continue24
		
	Continue24:
		sub dh,dh
		sub dl,dl
		mov si,12
		mov dh,1
		mov dl, 15

	recoloring22:
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call verticalMagenta2
		dec si	
		jnz recoloring22
		jz continue25

	continue25:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,16			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL recoloring22
		JE rangejump3
	rangejump3:
		mov dh, 1			;set row (0-24)
		mov dl, 1			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		jmp keyboard
		
board4:
	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn1
	mov dl,0
	mov dh,1
	mov bp, offset roooww1
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn2
	mov dl,0
	mov dh,3
	mov bp, offset roooww2
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn3
	mov dl,0
	mov dh,5
	mov bp, offset roooww3
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn4
	mov dl,0
	mov dh,7
	mov bp, offset roooww4
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn5
	mov dl,0
	mov dh,9
	mov bp, offset roooww5
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn6
	mov dl,0
	mov dh,11
	mov bp, offset roooww6
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn7
	mov dl,0
	mov dh,13
	mov bp, offset roooww7
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn8
	mov dl,0
	mov dh,15
	mov bp, offset roooww8
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn9
	mov dl,0
	mov dh,17
	mov bp, offset roooww9
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn10
	mov dl,0
	mov dh,19
	mov bp, offset roooww10
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn11
	mov dl,0
	mov dh,21
	mov bp, offset roooww11
	mov ah,13h
	int 10h

	mov al,1
	mov bh,0
	mov bl,06h	
	mov cx, lennn12
	mov dl,0
	mov dh,23
	mov bp, offset roooww12
	mov ah,13h
	int 10h

		mov si, 11
		mov dh, 2
	cursor31:					; loops the horizontal 
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,2
		call horizontal3
		dec si
		jnz cursor31
		jz continue31


	horizontal3 proc			
		mov ah, 09h
		mov al, 205				;=   1st Horizontal
		mov bh, 0
		mov bl, 00001111b		;white on black background
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontal3 endp

	horizontalRed3 proc			
		mov ah, 09h
		mov al, 205				;=   
		mov bh, 0
		mov bl, 00001100b		;light red
		mov cx, 48				; sets row width
		int 10h
		ret
	horizontalRed3 endp

	continue31:			;breaks out of loop cursor1
		mov si,12
		mov dh,1
		mov dl, 3

	cursor32:							;loops the vertical lines by moving the cursor position to the right
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call vertical3
		dec si	
		jnz cursor32
		jz continue32

	vertical3 proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001111b		;white on black background
		mov cx, 1
		int 10h
		ret
	vertical3 endp

	verticalMagenta3 proc
		mov ah, 09h
		mov al, 186			;||
		mov bh, 0						
		mov bl, 00001101b	;Magenta
		mov cx, 1
		int 10h
		ret
	verticalMagenta3 endp

	continue32:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,4			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL cursor32			
		JE continue33

	continue33:
		mov si, 3
		mov dh, 6
	Recoloring31:
		mov dl, 0			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		add dh,6
		call horizontalRed3
		dec si
		jnz recoloring31
		jz continue34
		
	Continue34:
		sub dh,dh
		sub dl,dl
		mov si,12
		mov dh,1
		mov dl, 15

	recoloring32:
		mov bh, 0
		mov ah, 2					;set cursor position top left corner
		int 10h 
		add dh, 2					;space in each cell in height
		call verticalMagenta3
		dec si	
		jnz recoloring32
		jz continue35

	continue35:
		mov si,12
		sub dh,dh
		mov dh,1 			;resets both dh and si
		add dl,16			;space in each cell in width
		cmp dl, 44			;the number of columns
		JL recoloring32
		JE rangejump4
	rangejump4:
		mov dh, 1			;set row (0-24)
		mov dl, 1			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		jmp keyboard

 ; all keyboard functionalities using int 16h
mov dh, 1			;set row (0-24)
mov dl, 1			;set column (0-79)
mov bh, 0
mov ah, 2			;set cursor position top left corner
int 10h 
 
keyboard:
mov ah,00h
int 16h

cmp al,49
je one1

cmp al,50
je two1

cmp al,51
je three1											;INPUT VALUES

cmp al,52
je four1

cmp al,53
je five1

cmp al,54
je six1

cmp al,55
je seven1

cmp al,56
je eight1

cmp al,57
je nine1

cmp al,101
je E1

cmp al,102  
je F1

cmp al,103
je G1

cmp al,8
je delete1

cmp al,9
je quit1

cmp al,109
je board11

cmp al,110
je board12

cmp al,111
je board13

cmp al,116
je board14

cmp al,112
je checksolution1

cmp al,97
je checkLeft1

cmp al,119												;ALL ARROW KEYS
je checkUp1

cmp al,100
je checkRight1

cmp al,115
je checkDown1
	;all the 1s are to avoid jmp error
	E1:
	jmp E
	
	F1:
	jmp F
	
	G1:
	jmp G
	
	delete1:
	jmp delete
	
	nine1:
	jmp nine
	
	eight1:
	jmp eight
	
	seven1:
	jmp seven
	
	six1:				
	jmp six
	
	five1:
	jmp five
	
	four1:
	jmp four
	
	three1:
	jmp three
	
	two1:
	jmp two
	
	one1:
	jmp one
	
	quit1:
	jmp quit
	
	board11:
	jmp board1
	
	board12:
	jmp board2
	
	board13:
	jmp board3
	
	board14:
	jmp board4
	
	checksolution1:
	jmp checksolution2
	
	checkLeft1:
	jmp checkLeft
	
	checkRight1:
	jmp checkRight
	
	checkUp1:
	jmp checkUp
	
	checkDown1:
	jmp checkDown
	one:
	mov al, 49
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	two:
	mov al, 50
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	three:
	mov al, 51
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	four:
	mov al, 52
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard	
	
	five:
	mov al, 53
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	six:
	mov al, 54
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	seven:
	mov al, 55
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	eight:
	mov al, 56
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard	
	
	nine:
	mov al, 57
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard	
	
	E:
	mov al, 69
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	F:
	mov al, 70
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard	
	
	G:
	mov al, 71
    mov bl, 03h
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	delete:
	mov al,0
    mov cx,1
    mov ah,09h
    int 10h
    jmp keyboard
	
	quit:
	mov ah,4ch
	int 21h

rangejump:				;to avoid error
jmp keyboard
	
	checkLeft:
		call getcursor
		cmp dl,1
		jle rangejump
		jg left
		ret
	Left:	
		sub dl,4
		call setcursor			;once it triggers left arrow
		jmp rangejump			;sets cursor and starts waiting for keypress again
		ret
	checkRight:
		call getcursor
		cmp dl,44
		jg rangejump
		jl right
		ret
	right:
		add dl,4
		call setcursor
		jmp rangejump
		ret
	checkUp:
		call getcursor
		cmp dh,1
		jle rangejump
		jg up
		ret
	up:
		sub dh,2
		call setcursor
		jmp rangejump
		ret
	checkDown:
		call getcursor
		cmp dh,23
		jge rangejump
		jl down
		ret
	down:
		add dh,2
		call setcursor
		jmp rangejump
		ret
	
	setcursor:
		mov ah,02h
		mov bh,0
		int 10h
		ret

		
checksolution2:			;add up each column row and boxes and then compare to see if it adds upto
		mov dh, 1			; what 1 to 12 characters add upto 687
		mov dl, 1			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		mov dh,1
	box1:
		call getdata
		cbw
		mov cx,ax
		mov si,11
	row1Loop:
		push cx
		mov bh,0
		mov ah,2
		add dl,4
		int 10h
		call getdata
		cbw
		pop cx
		add cx,ax	
		dec si
		jnz row1Loop
		jz checkRow
	
	checkRow:
		cmp cx,687
		jne wrong1
		je roww
	roww:
		cmp dh,1
		je roww2
		cmp dh,3
		je roww3
		cmp dh,5
		je roww4
		cmp dh,7
		je roww5
		cmp dh,9
		je roww6
		cmp dh,11
		je roe7
		cmp dh,13
		je roe8
		cmp dh,15
		je roe9
		cmp dh,17
		je roe10
		cmp dh,19
		je roe11
		cmp dh,21
		je roe12
		cmp dh,23
		je startcolumn1
	wrong1:
		jmp wrong
	roe7:
		jmp roww7
	roe8:
		jmp roww8
	roe9:
		jmp roww9
	roe10:
		jmp roww10
	roe11:
		jmp roww11
	roe12:
		jmp roww12
	startcolumn1:
		jmp startcolumn
	roww2:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww3:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1	
	roww4:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww5:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww6:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww7:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1	
	roww8:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	
	roww9:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww10:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww11:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
	roww12:
		add dh,2
		mov dl,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box1
		
	startcolumn:
		mov dh, 1			; what 1 to 12 characters add upto 687
		mov dl, 1			;set column (0-79)
		mov bh, 0
		mov ah, 2			;set cursor position top left corner
		int 10h 
		mov dl,1
	box2:
		call getdata
		cbw
		mov cx,ax
		mov si,11
	colLoop:
		push cx
		mov bh,0
		mov ah,2
		add dh,2
		int 10h
		call getdata
		cbw
		pop cx
		add cx,ax	
		dec si
		jnz colLoop
		jz checkCol
	checkCol:
		cmp cx,687
		jne wrong2
		je Coll
	coll:
		cmp dl,1
		je col2
		cmp dh,5
		je col3
		cmp dh,9
		je col4
		cmp dh,13
		je col5
		cmp dh,17
		je col6
		cmp dh,21
		je coll7
		cmp dh,25
		je coll8
		cmp dh,29
		je coll9
		cmp dh,33
		je coll10
		cmp dh,37
		je coll11
		cmp dh,41
		je coll12
		cmp dh,45
		jmp checkComplete1
	wrong2:
		jmp wrong
	coll7:
		jmp col7
	coll8:
		jmp col8
	coll9:
		jmp col9
	coll10:
		jmp col10
	coll11:
		jmp col11
	coll12:
		jmp col12
	checkComplete1:
		jmp checkComplete
	col2:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col3:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col4:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col5:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col6:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col7:
		jmp right1
	col8:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col9:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col10:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col11:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	col12:
		add dl,4
		mov dh,1
		mov bh,0
		mov ah,2
		int 10h
		xor cx,cx
		jmp box2
	checkComplete:
		jmp right1
		
	wrong:
		mov al,1
		mov bh,0
		mov bl,00001101b
		mov cx, len12
		mov dl,53
		mov dh,22
		mov bp, offset inst10
		mov ah,13h
		int 10h
		mov dh, 1			
		mov dl, 1		
		mov bh, 0
		mov ah, 2			
		int 10h 
		jmp rangejump

	right1:
		mov al,1
		mov bh,0
		mov bl,00001101b	
		mov cx, len13
		mov dl,53
		mov dh,22
		mov bp, offset inst11
		mov ah,13h
		int 10h
		int 10h
		mov dh, 1			
		mov dl, 1			
		mov bh, 0
		mov ah, 2			
		int 10h 
		jmp rangejump
	
getcursor proc		;get cursor position
mov ah, 03h
mov bh,00h
int 10h
ret
getcursor endp

getdata proc
mov bh,0
mov ah,08h
int 10h
ret
mov ah,0
getdata endp

	
end start