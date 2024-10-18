; multitasking and dynamic thread registration
[org 0x0100]
jmp start
; PCB layout:
; ax,bx,cx,dx,si,di,bp,sp,ip,cs,ds,ss,es,flags,next,dummy
; 0, 2, 4, 6, 8,10,12,14,16,18,20,22,24, 26 , 28 , 30
pcb: times 32*16 dw 0 ; space for 32 PCBs
stack: times 32*256 dw 0 ; space for 32 512 byte stacks
nextpcb: dw 1 ; index of next free pcb
current: dw 0 ; index of current pcb
lineno: dw 0 ; line number for next thread
;length: dw 5 ; length of the string
messagex: dw '*****!!!!!^^^^^+++++@@@@@'
buffer: times 50 dw 0
; hello world in assembly
[org 0x0100]
jmp start
mess:db'ur main is fine$'
length: dw 8 ; length of the string
length1: dw 13 ; length of the string
v1: db '___________________________    '
v2: db '|   |     |     |    | |   \   '
v3: db '|   |     |     |    | |    \  '
v4: db ' ___ _____ _____ ____ _ _____  '
v5: db '|                    | |      \'
v6: db ' --(o)(o)--------------(o)-----'
vansize: dw 31
vanindex: db 15
attribute: db 7
rabbit_attribtue:db 14
rabbit: db '***'
rabbitindex: db 38    ;40
store_rabbit: times 1320 dw 0
platform_iterator: dw 35 
game_iterator: db 10
bool_check: db 0
bool_movement:db 0
bool_platform_low:db 0,0
bool_platform_high:db 0,0
bool_initial:db 20
bool_initial2:db 0
bool_right:db 40
bool_left:db 40
bool_right2:db 0
bool_left2:db 0
bool_jump_occured:db 0
rabbit_boy:db  '/) (\'
rabbit_boy2:db '\| |/'
rabbit_boy3:db ' (") '  
rabbit_boy4:db '  ^  '
seed:db 0   
rand_carrot:db 0
rand_color:db 0   
score:db 0
score_message:db 'Score:'
oldisr: dd 0 ; space for saving old isr
carrot_location:dw 0
;here
platform_location:dw 0
bool_greenmov:db 0
message1: db 10, 13, 'User entered something... $'
;oldisr: dd 0									; space for saving old isr 1st 2 bytes for Offset, next 2 for cs
tickcount: dw 0
counter:dw 5
exit_message:db 'NICE TRY .'
exc_message:db 'Press enter to continue,Esc to leave.$'

ironman:db '  rrrrr  '
f2:db' rrrrrrr '
f3:db' ryrrryr '
f4:db' rywywyr '
f5:db' ryyyyyr '
f6:db'  ryyyr  '
f7:db'rrrrwrrrr'
f8:db'ryryryryr'
f9:db'  rrrrr  '
f10:db'  yyryy  '
f11:db'  rryrr  '


;naruto
naruto:db '  y y y  '
n2:db ' yyyyyyy '
n3:db ' y yss y '
n4:db 'y  y    y'
n5:db ' ywbwbwy '
n6:db ' wwwwwww '
n7:db '  wwwww  '
n8:db 'w       w'
n9:db 'w oo oo w'
n10:db '         '
n11:db '  ooooo  '
n12:db '  w   w  '

fig_iterator:db 16
fig_iterator2:db 16
fig_iteratorx:db 13

message: dw 'LOADING$' ; string to be printed

it:db 0
it2:db 0
it3:db 0
cit:db 17             
console:db   '        _=====_                               _=====_      '       
console1:db	 '       / _____ \                             / _____ \     '	      
console2:db	 '     +.-"_____"-.---------------------------.-"_____"-.+   '   	       
console3:db	 '    /   |     |  ".        S O N Y        ."  |  _  |   \  '        
console4:db	 '   / ___| /|\ |___ \                     / ___| /_\ |___ \ '       
console5:db	 '  / |      |      | ;  __           _   ; | _         _ | ;'	        
console6:db	 '  | | <---   ---> | | |__|         |_:> | ||_|       (_)| |'	       
console7:db  '  | |___   |   ___| ;SELECT       START ; |___       ___| ;'	       
console8:db	 '  |\    | \|/ |    /  _     ___      _   \    | (X) |    /|'	       
console9:db	 '  | \   |_____|  .","" "", |___|  ,"" "", ".  |_____|  ." |'	      
console10:db '  |  "-.______.-" /       \ANALOG/       \  "-._____.-"   |'		  
console11:db '  |               |       |------|       |                |'		  
console12:db '  |              /\       /      \       /\               |'		  
console13:db '  |             /  ".___."        ".___."  \              |'		  
console14:db '  |            /                            \             |'		   
console15:db '   \          /                              \           / '		  
console16:db '    \________/                                \_________/  '		   

name1:db 'Ahmad Abdul Rehman'
name2:db 'Ghulam Ahmad'
roll1:db '22l-6869'
roll2:db '22l-6892'
p:db 'Project by:'
start_message:db 'Press any key to start....'
game_name:db 'JUMPING RABBIT'
font_att:db 7

;----------------------------------
; subroutine to clear the screen
;----------------------------------
check: db 0
clrscr:		push es
			push ax
			push di

			mov ax, 0xb800
			mov es, ax					; point es to video base
			mov di, 0					; point di to top left column

nextloc:	mov word [es:di],0x0720	; clear next char on screen
			add di, 2					; move to next screen location
			cmp di, 11352				; has the whole screen cleared
			jne nextloc					; if no clear next position

			pop di
			pop ax
			pop es
			ret
			
delayx:     push cx
			mov cx, 0xFFFF
loopee1:		loop loopee1
			mov cx, 0xFff
loopee2:		loop loopee2
			pop cx
			ret			
			
border:

mov ax, 0x0C04       ;69 ; put pixel in white color
xor bx, bx ; page number 0
mov cx,640
mov dx,0

b1:int 0x10
;call delay
inc dx
int 0x10
inc dx
int 0x10
inc dx
int 0x10
inc dx
int 0x10
inc dx
int 0x10
mov dx,0
loop b1

mov cx,640
mov dx,480
b2:int 0x10
;call delay
dec dx
int 0x10
dec dx
int 0x10
dec dx
int 0x10
dec dx
int 0x10
dec dx
int 0x10
mov dx,480
loop b2

b3:int 0x10
;call delay
inc cx
int 0x10
inc cx
int 0x10
inc cx
int 0x10
inc cx
int 0x10
inc cx
int 0x10
mov cx,0
sub dx,1
jnz b3

mov cx,640
mov dx,480
b4:int 0x10
;call delay
dec cx
int 0x10
dec cx
int 0x10
dec cx
int 0x10
dec cx
int 0x10
dec cx
int 0x10
mov cx,640
sub dx,1
jnz b4



ret

segmentclear:
            push bp
			mov bp,sp
			push es
			push ax
			push di
            push bx
			
			mov ax, 0xb800
			mov es, ax					; point es to video base
			
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di,ax
			mov bx,ax
			add bx,1320               ; 792
			
nextloc2:	mov word [es:di], 0x0720	; clear next char on screen
			add di, 2					; move to next screen location
			cmp di, bx				; has the whole screen cleared
			jne nextloc2					; if no clear next position
            
			pop bx
			pop di
			pop ax
			pop es
			pop bp
			ret 4

delay:     
xor cx,cx
xor dx,dx
mov cx,1000
next:
mov dx,80
next2:
dec dx
jnz next2
loop next
ret


;prints building
set_building:
            push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+8]		; 132 x r
			add ax, [bp+6]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov ah, [bp+4]			; load attribute in ah
print_building:
        mov bx,di 
		mov dh,90      ;byte[length]
		
forwardloop:                           ;uses nested loops to print a building
		mov cx,10
		uploop:
		       mov al,33
			   mov [es:di],ax
			   sub di,264
			   
			   loop uploop
			   add bx,2
			   mov di,bx			   
			   sub dh,1
			   jnz forwardloop
			   
			   
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 6
set_window: 
push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+10]		    ; 132 x r
			add ax, [bp+8]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov cx, [bp+4]			; load length of string in cx
			mov ah, [bp+6]			; load attribute in ah

print_window:
             
            mov al,0
            mov [es:di],ax
            add di,20
            loop print_window			
			
			 
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 8
               			   

set_door:
            push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+8]		; 80 x r
			add ax, [bp+6]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov ah, [bp+4]			; load attribute in ah
print_door:
	    mov bx,di 
		mov dh,11      ;byte[length]
		
forward2loop:
		mov cx,3
		up2loop:
		       mov al,0
			   mov [es:di],ax
			   sub di,264
			   
			   loop up2loop
			   add bx,2
			   mov di,bx			   
			   sub dh,1
			   jnz forward2loop
			   
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 6
set_moon:
            push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+8]		    ; 132 x r
			add ax, [bp+6]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov ah, 0x60			; load attribute in ah
print_moon:
		   mov al,0
		   mov [es:di],ax
		   sub di,264
		   mov [es:di],ax
		   mov ah, [bp+4]
		   sub di,268
		   mov [es:di],ax
		   add di,2
		   mov [es:di],ax
		   add di,2
		   mov [es:di],ax
		   add di,2
		   mov [es:di],ax
		   add di,2
		   mov [es:di],ax
		   sub di,270
		   mov [es:di],ax
		   add di,2
		   mov [es:di],ax
		   add di,2
		   mov [es:di],ax
		   sub di,266
		   
		   mov [es:di],ax
		    pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 6


print_figure:push bp
mov bp,sp
push ax
push es
push si
push di
push cx

mov ax, 0xb800
mov es, ax					; point es to video base

mov al, 132				; load al with columns per row
mul byte [bp+8]		; 132 x r
add ax, [bp+6]			; word number (132xr) + c
shl ax, 1				; byte no (((132xr) + c)x2)


mov di,ax
mov si,[bp+4]

mov cx,9
mov al,' '
fig_loop:
cmp byte[si],'w'
jz white_block
cmp byte[si],'o'
jz orange_block
cmp byte[si],'y'
jz yellow_block
cmp byte[si],'s'
jz grey_block
cmp byte[si],'r'
mov bl,[si]
cmp bl,'r'
jz red_block
cmp byte[si],'b'
jz blue_block
mov ah,0x07
mov [es:di],ax
fpoint:
add di,2
add si,1
loop fig_loop


pop cx
pop di
pop si
pop es
pop ax
pop bp

ret 6

white_block:
mov ah,0xf8
mov [es:di],ax
jmp fpoint
orange_block:
mov ah,0x66
mov [es:di],ax
jmp fpoint
yellow_block:
mov ah,0xee
mov [es:di],ax
jmp fpoint
grey_block:
mov ah,0x77
mov [es:di],ax
jmp fpoint
red_block:
mov ah,0x44
mov [es:di],ax
jmp fpoint
blue_block:
mov ah,0x11
mov [es:di],ax
jmp fpoint

set_road:   push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+8]		    ; 132 x r
			add ax, [bp+6]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			
			mov ah, [bp+4]			; load attribute in ah
			mov cx,132			
print_road:
            mov al,' '
            mov [es:di],ax
            add di,2
            sub cx,1
			jnz print_road
			 pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 6
			
			
set_van:    push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+12]		; 132 x r
			add ax, [bp+10]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov si, [bp+6]			; point si to string
			mov cx, [bp+4]			; load length of string in cx
			mov ah, [bp+8]			; load attribute in ah
			
			print_van:
			mov al,[si]
			mov [es:di],ax
			add di,2
			add si,1
			loop print_van
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 10
			
print_stars:push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 132				; load al with columns per row
			mul byte [bp+8]		    ; 132 x r
			add ax, [bp+6]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			
			mov ah, [bp+4]			; load attribute in ah
			mov cx,3
			mov al,42
			star:
			sub di,510
			mov [es:di],ax
			add di,640
			mov [es:di],ax
			loop star
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 6
shiftleft:
push bp
			mov bp,sp
			push es
			push ax
			push cx
			push si
			push di
			push ds
			push bx
			push dx
			mov ax, 0xb800
			mov es, ax				; point es to video base
            mov ds,ax
			
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		    ; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov si,ax
			mov dx,di			
			mov bx,[es:di]

			add si,2
			
			mov cx,132
			
			cld
			rep movsw
            mov di,dx
			add di,262
			mov [es:di],bx			
			
			
			pop dx
			pop bx
			pop ds
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 4			
animate_left:
mov dx,0
mov cx,15
loop_shiftleft:
mov ax,dx
push ax	
xor ax,ax
push ax
call shiftleft	
inc dx
loop loop_shiftleft
ret
shiftright:
			push bp
			mov bp,sp
			push es
			push ax
			push cx
			push si
			push di
			push ds
			push bx
			push dx
			mov ax, 0xb800
			mov es, ax				; point es to video base
            mov ds,ax
			
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		    ; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)

			mov di, ax				; point di to required location
			mov si,ax
			mov dx,ax
			add si,260
			add di,262
			mov cx,132
			mov bx,[es:di]           ;store last value in bx
			std                      ;auto decrement mode
			rep movsw                ;movs from [ds:si] to [es:di]
			mov di,dx
			mov [es:di],bx			 ;add last value to the start
			
			pop dx
			pop bx
			pop ds
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 4
animate:
mov dx,15
mov cx,15
loop_shiftright:
mov ax,dx
push ax	
xor ax,ax
push ax
call shiftright	
inc dx
loop loop_shiftright
ret
saveScreen2: push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di
			push ds
mov ax,0xb800
mov es,ax
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di, ax				; point di to required location
mov cx,1320
mov si,store_rabbit
saveloop2:
mov ax, [es:di] ; no, save this character
mov [si],ax
inc si
inc di
loop saveloop2
            pop ds
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 4

saveScreen: push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di
			push ds
mov ax,0xb800
mov es,ax
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di, ax				; point di to required location
mov cx,1056
mov si,store_rabbit
saveloop:
mov ax, [es:di] ; no, save this character
mov [si],ax
inc si
inc di
loop saveloop
            pop ds
			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 4

restoreScreen:push bp
              mov bp,sp
			  push ax
			  push es
			  push di
			  push si

mov si,store_rabbit
mov ax,0xb800
mov es,ax
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di, ax				; point di to required location

mov cx,1056                             ;528
restoreloop:
mov ax,[si]
mov [es:di],ax
inc si
inc di
loop restoreloop
              
			  pop si
			  pop di
			  pop es
			  pop ax
			  pop bp
ret 4
restoreScreen2:push bp
              mov bp,sp
			  push ax
			  push es
			  push di
			  push si

mov si,store_rabbit
mov ax,0xb800
mov es,ax
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di, ax				; point di to required location

mov cx,1320
restoreloop2:
mov ax,[si]
mov [es:di],ax
inc si
inc di
loop restoreloop2
              
			  pop si
			  pop di
			  pop es
			  pop ax
			  pop bp
ret 4

print_platform:push bp
              mov bp,sp
			  push ax
			  push es
			  push di
			  push si


mov ax,0xb800
mov es,ax
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		    ; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di, ax				; point di to required location

            add di,104
			mov cx,20
			mov al,'='
			mov ah,0x44                              ;[attribute]
			cld
			rep stosw
			  pop si
			  pop di
			  pop es
			  pop ax
			  pop bp
ret 4

print_platform2:push bp
              mov bp,sp
			  push ax
			  push es
			  push di
			  push si
              push bx
mov ah, 2Ch    ; AH = Function to get system time
    int 21h        ; Call DOS to get time
    mov byte [seed], dl   ; Store seconds as the seedd
; Generate a random number
mov dl,byte[tickcount]
mov al,byte[tickcount] ;[seed]  ; Load the current seed
    xor al, ah      ; XOR with high byte of time for more randomness
    xor al, dl      ; XOR with seconds
    ror al, 1       ; Rotate right for randomness
    xor al, dl      ; XOR again for more randomness
    and al, 0x03    ; Ensure it's a 2-bit value (values 0 to 3)
mov bh,ah
mov bl, [seed]  ; Load the current seed
    xor bl, ah      ; XOR with high byte of time for more randomness
    xor bl, dl      ; XOR with seconds
    ror bl, 1       ; Rotate right for randomness
    xor bl, dl      ; XOR again for more randomness
    and bl, 0x0f    ; Ensure it's a 2-bit value (values 0 to 3)
    ; Add 1 to the random number to get a value between 1 and 4
    inc al
mov [rand_color],al
mov bh,0
inc bl
shl bl,2
mov ax,0xb800
mov es,ax
			mov al, 132				; load al with columns per row
			mul byte [bp+6]		    ; 132 x r
			add ax, [bp+4]			; word number (132xr) + c
			shl ax, 1				; byte no (((132xr) + c)x2)
			mov di, ax				; point di to required location

            mov byte[bool_greenmov],0
            add di,104
			cmp byte[score],2
			jnz pp1
			sub di,24
			add di,bx
			mov word[platform_location],di
			pp1:
			mov cx,20
			mov al,'='
			cmp byte[rand_color],1
			jz  green_color
			cmp byte[rand_color],2
			jz  yellow_color
			cmp byte[rand_color],3
			jz blue_color
			mov ah,0x44                              ;[attribute]
			cld
			rep stosw
			rpoint:
			  
			  pop bx
			  pop si
			  pop di
			  pop es
			  pop ax
			  pop bp
ret 4
green_color:
			mov ah,0x22                              ;[attribute]
			cld
			rep stosw
			mov byte[bool_greenmov],1
            jmp rpoint
yellow_color:
			mov ah,0xee                             ;[attribute]
			cld
			rep stosw
            jmp rpoint
blue_color:
			mov ah,0x33                             ;[attribute]
			cld
			rep stosw
            jmp rpoint

platform_down:
			
			mov ax,[platform_iterator]
			push ax
			mov ax,0
			push ax
			call saveScreen2
			 mov ax,[platform_iterator]
			 push ax
			 mov ax,0
			 push ax
			 call segmentclear
			 ;inc byte[platform_iterator]
			 mov ax,38                                     ;[platform_iterator]
			 push ax
			 mov ax,0
			 push ax
			 call restoreScreen2
			 ;call delay
			 ;call delay
			 ;mov ax,[platform_iterator]
			 ;cmp ax,38
             ;jnz platform_down
			 ret
check_below:
pusha

mov ax,0xb800
mov es,ax
mov ax,9504
mov di,ax	
mov si,ax
mov al,'^'

checkloop:
mov bl,[es:di]
add di,2
cmp bl,al
jnz checkloop
mov ax,0x0750
sub di,2
                                  ;we have the value where rabbit's leg is starting from.
mov bx,10
add di,260                        ;1 row down,2 column left
mov al,'='
mov dl,[es:di]
cmp al,dl
jz update_bool
add di,bx
mov dl,[es:di]
cmp al,dl
jz update_bool

popa
ret

update_bool:
mov byte[bool_check],1
popa
ret


check_for_carrot:
pusha
mov ax,0xb800
mov es,ax
mov ax,9112      ; 9504                  ;9240
mov di,ax	
mov si,ax
mov al,'^'

checkloop2:
mov bl,[es:di]
add di,2
cmp bl,al
jnz checkloop2
sub di,2

cmp byte[rand_carrot],1
jz  check_c1
cmp byte[rand_carrot],2
jz  check_c2
cmp byte[rand_carrot],3
jz  check_c3

comeback_point:

popa
ret

check_c1:
add di,6  ;4
cmp di,9082        ;9610                     ;9346
jae check2_c1
jmp comeback_point
check2_c1:
sub di,8
cmp di,9086   ;9614                      ;9350
jbe update_score
jmp comeback_point

check_c2:
add di,6
cmp di,9088   ;9616                        ;9352
jae check2_c2
jmp comeback_point
check2_c2:
sub di,8
cmp di,9092 ;9620                       ;9356
jbe update_score
jmp comeback_point


check_c3:
add di,6
cmp di,9108  ;9636                       ;9372
jae check2_c3
jmp comeback_point
check2_c3:
sub di,8
cmp di,9112    ;9640                       ;9376
jbe update_score
jmp comeback_point

update_score:
inc byte[score]
jmp comeback_point

jump_rabbit: 
			
            mov word[platform_iterator],31                               ;needed for platform down.
			mov byte[bool_movement],0			
            mov ax,38
			push ax
			mov ax,0
			push ax
            call saveScreen
						
			mov ah, 0		
            int 0x16
			
			mov ax,38
			push ax
			mov ax,0
			push ax
			call segmentclear
			
			mov ax,31
			push ax
			mov ax,0
			push ax
            call restoreScreen
			
			call check_below                                        ;not working properly!
			mov al,[bool_check]
			cmp al,0
			jz clrscr
						
            call platform_down	
            
            mov ax,35
		    push ax
		    mov ax,0
		    push ax
		    call print_platform2			
			ret
			



			rabbit_platform_shift_left:
			pusha
			mov dx,5
			mov bx,31
			rpsl:
			mov ax,bx
			push ax
			mov ax,0
			push ax
			call shiftleft
			add bx,1
			sub dx,1			
			jnz rpsl			
			popa
			ret
			
			rabbit_platform_shift_left2:
			pusha
			mov dx,5
			mov bx,38
			rpsl2:
			mov ax,bx
			push ax
			mov ax,0
			push ax
			call shiftleft
			add bx,1
			sub dx,1			
			jnz rpsl2			
			popa
			ret
			rabbit_platform_shift_right:
			pusha
			mov dx,5
			mov bx,31
			rpsr:
			mov ax,bx
			push ax
			mov ax,0
			push ax
			call shiftright
			add bx,1
			sub dx,1			
			jnz rpsr			
			popa
			ret
			rabbit_platform_shift_right2:
			pusha
			mov dx,5
			mov bx,38
			rpsr2:
			mov ax,bx
			push ax
			mov ax,0
			push ax
			call shiftright
			add bx,1
			sub dx,1			
			jnz rpsr2			
			popa
			ret

;-------------------------------------------------------------------
; keyboard interrupt service routine
;-------------------------------------------------------------------
kbisr:		push ax
			push es

			mov ax, 0xb800
			mov es, ax ; point es to video memory

			in al, 0x60 ; read a char from keyboard port
			cmp al, 0x48     ; 2a ; has the up arrow pressed.........
			jne  nextcmp           ;nomatch ; no, try next comparison
			mov word[cs:counter],5			
			mov word[platform_iterator],31                               ;needed for platform down.
			mov byte[bool_check],0
			mov byte[bool_jump_occured],1
            mov ax,38
			push ax
			mov ax,0
			push ax
            call saveScreen
			
			push ax                                              ;this code carry forwards the movement of old platform.
			mov al,byte[bool_initial]
			mov byte[bool_initial2],al	
			mov al,byte[bool_right]
			mov byte[bool_right2],al
			mov al,byte[bool_left]
			mov byte[bool_left2],al
			mov byte[bool_initial],20
			mov byte[bool_right],40
			mov byte[bool_left],40			
			pop ax
				
			
			mov ax,38
			push ax
			mov ax,0
			push ax
			call segmentclear
			
			mov ax,31
			push ax
			mov ax,0
			push ax
            call restoreScreen
			
			call check_for_carrot            
		    mov al,byte[score]
			add al,48
			mov ah,0xf
			mov di,8160
			mov [es:di],ax
			
			call check_below                                        
			mov al,[bool_check]
			cmp al,0
			jz termination               ;clrscr						  ;call instead og jump
            call platform_down	
		    cmp byte[rand_color],3
			jnz kb1
			mov word[cs:counter],0
			
			kb1:
            
            mov ax,35
		    push ax
		    mov ax,0
		    push ax
		    call print_platform2			

			call print_carrot
			;pass a random number in bool_right and left
			
			jmp exit ; leave interrupt routine
            nextcmp:
			cmp al, 0x01    
			jne nomatch
            mov dx,exc_message
			mov ah,9
			int 0x21
	        call delay
			jmp termination

			
		
nomatch:	pop es
			pop ax
			jmp far [cs:oldisr] ; call the original ISR

exit:	
            mov al, 0x20
			out 0x20, al ; send EOI to PIC
			pop es
			pop ax
			iret ; return from interrupt	
			
initial_left:
call rabbit_platform_shift_left
dec byte[bool_initial]
jmp y1		

shifter_right:
call rabbit_platform_shift_right
jmp y2


later_shift_right:
dec byte[bool_right]
cmp byte[bool_right],0
ja shifter_right
mov byte[bool_left],40
jmp y2
 

shifter_left:
call rabbit_platform_shift_left
jmp y3
;ret 2 

later_shift_left:
dec byte[bool_left]
cmp byte[bool_left],0
ja shifter_left
mov byte[bool_right],40
jmp y3

later_shift_right_more:
cmp byte[bool_right],0
ja later_shift_right
jmp y2

;--------------------------------------------
lower_segment_shifting:
cmp byte[bool_initial2],0
jle  later_shift_right_more2
y5:
cmp byte[bool_right2],0
jle later_shift_left2
call rabbit_platform_shift_left2
dec byte[bool_initial2]
y6:
jmp y4

later_shift_right_more2:
cmp byte[bool_right2],0
ja later_shift_right2
jmp y5

later_shift_right2:
dec byte[bool_right2]
cmp byte[bool_right2],0
ja shifter_right2
mov byte[bool_left2],40
jmp y4
shifter_right2:
call rabbit_platform_shift_right2
jmp y4


shifter_left2:
call rabbit_platform_shift_left2
jmp y4
;ret 2 

later_shift_left2:
dec byte[bool_left2]
cmp byte[bool_left2],0
ja shifter_left2
mov byte[bool_right2],40
jmp y4


termination:
mov ax,42
push ax
mov ax,0
push ax
mov ax,0
push ax
call set_road	
call delay
call delay
call delay
call delay
call delay
call delay
call delay
call clrscr
; mov bh,00h
; mov bl,3
; mov ah,0bh
; int 0x10

mov cx,12
mov si,0
figure_loopt:
mov ax,[fig_iteratorx]
push ax
mov ax,55
push ax
mov ax,naruto
add ax,si
push ax
call print_figure
inc byte[fig_iteratorx]
add si,9
loop figure_loopt

mov ax,24
push ax
mov ax,0
push ax
mov ax,0x8c
push ax
call set_road	

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,9   ;07h              ;47 
mov cx, 6			; length of string
mov dx, 0x1323		; row 10 column 3
push ds
pop es
mov bp, score_message
mov al,48
add byte[score],al
int 0x10
mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,2   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 1			; length of string
mov dx, 0x1330		; row 10 column 3
push ds
pop es
mov bp, score
int 0x10
mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,2   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 10			; length of string
mov dx, 0x1123		; row 10 column 3
push ds
pop es
mov bp, exit_message
int 0x10

		mov ax, 0x3100 ; terminate and stay resident
		int 0x21 
Animation:
		call animate
		call animate_left
		cmp byte[cs:counter],4
		jne ya1
		jmp termination
		ya1:
		cmp byte[bool_greenmov],1
		jz y3
		cmp byte[bool_initial],0
		jnz initial_left	
        y1:		
		cmp byte[bool_initial],0
		jle  later_shift_right_more
		y2:
		cmp byte[bool_right],0
		jle later_shift_left
		y3:
		cmp byte[bool_jump_occured],1
		je lower_segment_shifting

		y4:
		call delay
		ret
		
		
print_carrot:
            push ax
			push es
			push di
			push bx
			mov ah, 2Ch    ; AH = Function to get system time
			int 21h        ; Call DOS to get time
			mov byte [seed], dl   ; Store seconds as the seedd
		    ; Generate a random number
			mov dl,byte[tickcount]
			mov al,byte[tickcount] ;[seed]  ; Load the current seed
			xor al, ah      ; XOR with high byte of time for more randomness
			xor al, dl      ; XOR with seconds
			ror al, 1       ; Rotate right for randomness
			xor al, dl      ; XOR again for more randomness
			and al, 0x03    ; Ensure it's a 2-bit value (values 0 to 3)

			; Add 1 to the random number to get a value between 1 and 4
			inc al
			mov [rand_carrot],al
			
			mov ax,0xb800
			mov es,ax
			mov di,9240
			add di,104
			cmp byte[score],2
			jnz pc1
			mov di,[platform_location]
			pc1:
			mov bx,[rand_carrot]
			add bx,di
			mov word[carrot_location],bx
			cmp byte[rand_carrot],1
			jz  carrot_1
			cmp byte[rand_carrot],2
			jz  carrot_2
			cmp byte[rand_carrot],3
			jz  carrot_3
			
			r2point:
			
			pop bx
			pop di
			pop es
			pop ax
			ret
			
			carrot_1:
			sub di,264
			add di,2
			mov ah,0x44
			mov al,' '
			mov [es:di],ax
			add di,2
			mov [es:di],ax
			add di,2
			mov [es:di],ax
			add di,2
			sub di,268
			mov al,'*'
			mov ah,44
			mov [es:di],ax
			jmp r2point
			
			carrot_2:
			sub di,264
			add di,8
			mov ah,0x44
			mov al,' '
			mov [es:di],ax
			add di,2
			mov [es:di],ax
			add di,2
			mov [es:di],ax
			add di,2
			sub di,268
			mov al,'*'
			mov ah,44
			mov [es:di],ax
			jmp r2point

			carrot_3:
			sub di,264
			add di,28
			mov ah,0x44
			mov al,' '
			mov [es:di],ax
			add di,2
			mov [es:di],ax
			add di,2
			mov [es:di],ax
			add di,2
			sub di,268
			mov al,'*'
			mov ah,44
			mov [es:di],ax
			jmp r2point			
			
			; check_carrot:
			; pusha
			
			
			; popa
			; ret
			
			
main_screen:
mov ax, 0x0012 ; set 320x200 graphics mode;800-600
int 0x10 ; bios video services


mov bh,00h
mov bl,8               ;16     ;54
mov ah,0bh
int 0x10
mov ax, 0x0C04 ; put pixel in white color
xor bx, bx ; page number 0

mov cx, 100

mov ah, 0x13		; service 13 - print string
mov al, 1			 
mov bh, 0			; output on page 0
mov bl,07h              ;47             ; 01000111B	; normal attrib
mov cx, 59			; length of string
mov dx, 0x0408		; row 10 column 3
mov si,console
push ds
pop es				; es=ds segment of string
c1:
mov bp, si		; bp = offset of string	
add dh,1		
INT 0x10			; call BIOS video service
add si,59
dec byte[cit]
cmp byte[cit],0
jnz c1

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,47   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 7			; length of string
mov dx, 0x1323		; row 10 column 3
push ds
pop es
mov bp, message
int 0x10

call border
;----------------------------------------------------

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,[font_att]   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 18			; length of string
mov dx, 0x013c		; row 10 column 3
push ds
pop es
mov bp, name1
int 0x10

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,[font_att]   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 8			; length of string
mov dx, 0x023c		; row 10 column 3
push ds
pop es
mov bp, roll1
int 0x10

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,[font_att]   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 12			; length of string
mov dx, 0x033c		; row 10 column 3
push ds
pop es
mov bp, name2
int 0x10

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,[font_att]   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 8			; length of string
mov dx, 0x043c		; row 10 column 3
push ds
pop es
mov bp, roll2
int 0x10

; mov ah, 0x13		; service 13 - print string
; mov al, 1			
; mov bh, 0			; output on page 0
; mov bl,[font_att]   ;07h              ;47        ; 01000111B	; normal attrib
; mov cx, 11			; length of string
; mov dx, 0x0130		; row 10 column 3
; push ds
; pop es
; mov bp, p
; int 0x10

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,13      ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 14			; length of string
mov dx, 0x061f		; row 10 column 3
push ds
pop es
mov bp, game_name
int 0x10

mov ah, 0x13		; service 13 - print string
mov al, 1			
mov bh, 0			; output on page 0
mov bl,47   ;07h              ;47        ; 01000111B	; normal attrib
mov cx, 26			; length of string
mov dx, 0x181a		; row 10 column 3
push ds
pop es
mov bp, start_message
int 0x10

mov ah,0
int 0x16


mov bh,00h
mov bl,8               ;16     ;54
mov ah,0bh
int 0x10
mov ax, 0x0C04 ; put pixel in white color
xor bx, bx ; page number 0

mov cx, 250
		
mov byte[it3],100
l3:
mov byte[it2],10
mov dx,320
add cx,1
call delayx
l2:int 0x10
inc dx
dec byte[it2]
cmp byte[it2],0
jnz l2
dec byte[it3]
cmp byte[it3],0
jnz l3




;-------------------------------------------------------------------------------------------------
        mov AH,0x00
        mov al, 0x54
        int 0x10
		call delay
		call delay
		call delay
		call delay


        ;call clrscr ; call the clrscr subroutine
; mov bh,00h
; mov bl,0
; mov ah,0bh
; int 0x10

		mov ax,1003h
		mov bl,0
		int 0x10
		
		mov ax, 14
		push ax				; push r position............[bp+8]
		mov ax, 16
		push ax				; push c position............[bp+6]
		mov ax, 0x60			; blue on black attribute
		push ax				; push attribute............[bp+4]		
		call set_building
		
		mov ax, 6
		push ax				; push r position............[bp+10]
		mov ax, 26
		push ax				; push c position............[bp+8]
		mov ax, 0x01			; blue on black attribute
		push ax				; push attribute............[bp+6]
		push word [length]	; push message length ....[bp+4]		
		call set_window
		
		mov ax, 9
		push ax				; push r position............[bp+10]
		mov ax, 26
		push ax				; push c position............[bp+8]
		mov ax, 0x01			; blue on black attribute
		push ax				; push attribute............[bp+6]		
		push word [length]	; push message length ....[bp+4]		
		call set_window
		
		mov ax, 14
		push ax				; push r position............[bp+8]
		mov ax, 56
		push ax				; push c position............[bp+6]
		mov ax, 0x01			; blue on black attribute
		push ax				; push attribute............[bp+4]		
		call set_door
		
		mov ax, 13
		push ax				; push r position............[bp+8]
		mov ax, 120
		push ax				; push c position............[bp+6]
		mov ax, 0x20			; blue on black attribute
		push ax				; push attribute............[bp+4]
		
		call set_moon
		mov ax, 12
		push ax				; push r position............[bp+8]
		mov ax, 115
		push ax				; push c position............[bp+6]
		mov ax, 0x20			; blue on black attribute
		push ax				; push attribute............[bp+4]
		
		call set_moon
		mov ax, 13
		push ax				; push r position............[bp+8]
		mov ax, 110
		push ax				; push c position............[bp+6]
		mov ax, 0x20			; blue on black attribute
		push ax				; push attribute............[bp+4]
		
		call set_moon
		mov ax, 12
		push ax				; push r position............[bp+8]
		mov ax, 125
		push ax				; push c position............[bp+6]
		mov ax, 0x20			; blue on black attribute
		push ax				; push attribute............[bp+4]
		
		call set_moon
		
		
mov ax,15
push ax
mov ax,0
push ax
mov ax,0x77
push ax
call set_road
mov ax,28
push ax
mov ax,0
push ax
mov ax,0x77
push ax
call set_road		
	
		
mov cx,11
mov si,0
figure_loop1:
mov ax,[fig_iterator]
push ax
mov ax,200
push ax
mov ax,ironman
add ax,si
push ax
call print_figure
inc byte[fig_iterator]
add si,9
loop figure_loop1

mov cx,12
mov si,0
figure_loop2:
mov ax,[fig_iterator2]
push ax
mov ax,0
push ax
mov ax,naruto
add ax,si
push ax
call print_figure
inc byte[fig_iterator2]
add si,9
loop figure_loop2
		;--------------------------------------------------

mov ax,30
push ax
mov ax,114
push ax
mov ax,12
push ax
mov ax,score_message
push ax
mov ax,6
push ax
call set_van
		
		
		mov ax, 2
		push ax				; push r position............[bp+12]
		mov ax, 0
		push ax				; push c position............[bp+10]
		mov ax, 0x8f			; blue on black attribute
		push ax				; push attribute............[bp+8]
		call print_stars


		mov bx,4
		mov si,0
		print_rabbit:		
		mov ax,[rabbitindex]
		push ax
		mov ax,60
		push ax
		mov ax,[rabbit_attribtue]
		push ax
        mov ax,rabbit_boy
        add ax,si		
		push ax
		mov ax,5
		push ax
		call set_van
		inc byte[rabbitindex]
		add si,5
		sub bx,1
		jnz print_rabbit
		
		mov ax,0xb800
		mov es,ax
		mov di,10152
		mov al,' '
		mov ah,44
		add di,2
		mov [es:di],ax
		add di,4
		mov [es:di],ax
		add di,258
		mov [es:di],ax
		mov al,'*'
		mov ah,77
		add di,2
		mov [es:di],ax
		add di,2
		mov al,' '
		mov ah,44
		mov [es:di],ax
		add di,2
		mov al,'*'
		mov ah,77
		mov [es:di],ax
		mov al,' '
		mov ah,44
		add di,2
		mov [es:di],ax
		add di,256
		mov [es:di],ax
		add di,2
		mov [es:di],ax
		add di,2
		mov [es:di],ax
		add di,2
		mov [es:di],ax
		add di,2
		mov [es:di],ax
		add di,256
		; mov [es:di],ax
		 add di,2
		mov [es:di],ax
		add di,2
		mov al,'^'
		mov ah,44
		mov [es:di],ax
		add di,2
		mov al,' '
		mov ah,44
		mov [es:di],ax
		; add di,2
		; mov [es:di],ax
	
		mov ax,35
		push ax
		mov ax,0
		push ax
		call print_platform
		

		
ret        			   
; timer:		push ax
            ; inc word [cs:tickcount]; increment tick count
            ; cmp word[cs:tickcount],18
			; jnz y
			; inc word[cs:counter]
			; push word [cs:counter]

			; call printnum ; print tick count
            
			; y:
			; mov al, 0x20
			; out 0x20, al ; end of interrupt

			; pop ax
			; iret ; return from interrupt
			
			;------------------------------------------------------
; subroutine to print a number at top left of screen
; takes the number to be printed as its parameter
;------------------------------------------------------
printnum: push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov ax, [bp+4] ; load number in ax
mov bx, 10 ; use base 10 for division
mov cx, 0 ; initialize count of digits
nextdigit: mov dx, 0 ; zero upper half of dividend
div bx ; divide by 10
add dl, 0x30 ; convert digit into ascii value
push dx ; save ascii value on stack
inc cx ; increment count of values
cmp ax, 0 ; is the quotient zero
jnz nextdigit ; if no divide it again
mov di, 7920 ; point di to 70th column
nextpos: pop dx ; remove a digit from the stack
mov dh, 0x07 ; use normal attribute
;mov [es:di], dx ; print char on screen
add di, 2 ; move to next screen location
loop nextpos ; repeat for all digits on stack
mov word[cs:tickcount],0
pop di
pop dx
pop cx
pop bx
pop ax 
pop es
pop bp
ret 2


; clrscr:		push es
			; push ax
			; push di

			; mov ax, 0xb800
			; mov es, ax					; point es to video base
			; mov di, 0					; point di to top left column

; nextloc:	mov word [es:di], 0x0720	; clear next char on screen
			; add di, 2					; move to next screen location
			; cmp di, 4000				; has the whole screen cleared
			; jne nextloc					; if no clear next position

			; pop di
			; pop ax
			; pop es
			; ret

; delay:      push cx
			; mov cx, 0xFFFF
; loop1:		loop loop1
			; mov cx, 0xFFFF
; loop2:		loop loop2
			; pop cx
			; ret

;--------------------------------------------------------------------
; subroutine to print a string at top left of screen
; takes x position, y position, string attribute, address of string
; and its length as parameters
;--------------------------------------------------------------------
printstr1:	push bp
			mov bp, sp
			push es
			push ax
			push cx
			push si
			push di

			mov ax, 0xb800
			mov es, ax				; point es to video base

			mov al, 80				; load al with columns per row
			mul byte [bp+12]		; 80 x r
			add ax, [bp+10]			; word number (80xr) + c
			shl ax, 1				; byte no (((80xr) + c)x2)

			mov di, ax				; point di to required location
			mov si, [bp+6]			; point si to string
			mov cx, [bp+4]			; load length of string in cx
			mov ah, [bp+8]			; load attribute in ah

nextchar:	mov al, [si]			; load next char of string
			mov [es:di], ax			; show this char on screen
			add di, 2				; move to next screen location
			add si, 1				; move to next char in string
			call delay
			loop nextchar			; repeat the operation cx times

			pop di
			pop si
			pop cx
			pop ax
			pop es
			pop bp
			ret 10


RotateScreenRight:
            push bp
			mov bp,sp
			pusha 
			
			mov ax,0xb800
			mov es,ax
			mov al,80
			mul byte[bp+6]
			add ax,[bp+4]
			shl ax,1
			mov cx,5
			mov di,ax
			mov bx,ax
			mov si,buffer
			
			outerloop:
			mov dx,5
			
			innerloop:
			mov ax,[es:di]
			mov [si],ax
			add si,2
			add di,2
			sub dx,1
			jnz innerloop
			add di,150
			loop outerloop
			
			mov di,bx
			mov cx,5
		    add di,8
			mov si,buffer
			
			outer_rotate:
			mov dx,5
			inner:
			mov ax,[si]
			mov [es:di],ax
			add si,2
			add di,160
			sub dx,1
			jnz inner
			sub di,802
			loop outer_rotate
			
			popa
			pop bp
			ret 4

;;;;; COPY LINES 028-071 FROM EXAMPLE 10.1 (printnum) ;;;;;
; subroutine to print a number on screen
; takes the row no, column no, and number to be printed as parameters
printnum1: push bp
			mov bp, sp
			push es
			push ax
			push bx
			push cx
			push dx
			push di
			mov di, 80 ; load di with columns per row
			mov ax, [bp+8] ; load ax with row number
			mul di ; multiply with columns per row
			mov di, ax ; save result in di
			add di, [bp+6] ; add column number
			shl di, 1 ; turn into byte count
			add di, 8 ; to end of number location
			mov ax, 0xb800
			mov es, ax ; point es to video base
			mov ax, [bp+4] ; load number in ax
			mov bx, 16 ; use base 16 for division
			mov cx, 4 ; initialize count of digits
			nextdigit2: mov dx, 0 ; zero upper half of dividend
			div bx ; divide by 10
			add dl, 0x30 ; convert digit into ascii value
			cmp dl, 0x39 ; is the digit an alphabet
			jbe skipalpha ; no, skip addition
			add dl, 7 ; yes, make in alphabet code
			skipalpha: mov dh, 0x07 ; attach normal attribute
			mov [es:di], dx ; print char on screen
			sub di, 2 ; to previous screen location
			loop nextdigit2 ; if no divide it again
			pop di
			pop dx
			pop cx
			pop bx
			pop ax
			pop es
			pop bp
			ret 6



; mytask subroutine to be run as a thread
; takes line number as parameter
mytask: push bp
		mov bp, sp
		sub sp, 2 ; thread local variable
		push ax
		push bx
		mov ax, [bp+4] ; load line number parameter
		mov bx, 70 ; use column number 70
		mov word [bp-2], 0 ; initialize local variable
		
		 printagain: ;push ax ; line number
					; push bx ; column number
					; push word [bp-2] ; number to be printed
					; call printnum ; print the number
					; inc word [bp-2] ; increment the local variable
					; mov ax,0
					; push ax
					; mov ax,0
					; push ax
					; call RotateScreenRight
					j1:
					call Animation	
					jmp j1
					jmp printagain ; infinitely print
		pop bx
		pop ax
		mov sp, bp
		pop bp
		ret
		
mytask2:push bp
		mov bp, sp
		sub sp, 2 ; thread local variable
		push ax
		push bx
		mov ax, [bp+4] ; load line number parameter
		mov bx, 70 ; use column number 70
		mov word [bp-2], 0 ; initialize local variable
		
		printagain2: ;push ax ; line number
					; push bx ; column number
					; push word [bp-2] ; number to be printed
					; call printnum ; print the number
					; inc word [bp-2] ; increment the local variable
mov al, 0b6h
out 43h, al

;load the counter 2 value for d3
mov ax, 1fb4h
out 42h, al
mov al, ah
out 42h, al

;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delayx
mov al, ah
out 61h, al

;call delayx

;load the counter 2 value for a3
mov ax, 152fh
out 42h, al
mov al, ah
out 42h, al

;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
;call delayx
mov al, ah
out 61h, al

;call delayx
	
;load the counter 2 value for a4
mov ax, 0A97h
out 42h, al
mov al, ah
out 42h, al
	
;turn the speaker on
in al, 61h
mov ah,al
or al, 3h
out 61h, al
call delayx
mov al, ah
out 61h, al

;call delayx
 
		jmp printagain2 ; infinitely print
		pop bx
		pop ax
		mov sp, bp
		pop bp
		ret		
; subroutine to register a new thread
; takes the segment, offset, of the thread routine and a parameter
; for the target thread subroutine
initpcb: 	push bp
			mov bp, sp
			push ax
			push bx
			push cx
			push si
			
			mov bx, [nextpcb] ; read next available pcb index
			cmp bx, 32 ; are all PCBs used
			je exit2 ; yes, exit
			
			mov cl, 5
			shl bx, cl ; multiply by 32 for pcb start ix2^5 
			
			mov ax, [bp+8] ; read segment parameter
			mov [pcb+bx+18], ax ; save in pcb space for cs
			mov ax, [bp+6] ; read offset parameter
			mov [pcb+bx+16], ax ; save in pcb space for ip
			mov [pcb+bx+22], ds ; set stack to our segment
			
			mov si, [nextpcb] ; read this pcb index
			mov cl, 9
			shl si, cl ; multiply by 512...ix2^9 (512)
			add si, 256*2+stack ; end of stack for this thread
			mov ax, [bp+4] ; read parameter for subroutine
			sub si, 2 ; decrement thread stack pointer
			mov [si], ax ; pushing param on thread stack
			sub si, 2 ; space for return address
			mov [pcb+bx+14], si ; save si in pcb space for sp
			
			mov word [pcb+bx+26], 0x0200 ; initialize thread flags
			mov ax, [pcb+28] ; read next of 0th thread in ax
			mov [pcb+bx+28], ax ; set as next of new thread
			
			mov ax, [nextpcb] ; read new thread index
			mov [pcb+28], ax ; set as next of 0th thread
			
			inc word [nextpcb] ; this pcb is now used
			
			exit2: pop si
			pop cx
			pop bx
			pop ax
			pop bp
			ret 6
; timer interrupt service routine
timer: 		push ax
            inc word [cs:tickcount]; increment tick count
            cmp word[cs:tickcount],990
			jnz y
			inc word[cs:counter]
			push word [cs:counter]

			call printnum ; print tick count
            
			y:
			pop ax
            
			push ds
			push bx
			push cs
			pop ds ; initialize ds to data segment
			
			mov bx, [current] ; read index of current in bx
			shl bx, 1
			shl bx, 1
			shl bx, 1
			shl bx, 1
			shl bx, 1 ; multiply by 32 for pcb start
			
			mov [pcb+bx+0], ax ; save ax in current pcb
			mov [pcb+bx+4], cx ; save cx in current pcb
			mov [pcb+bx+6], dx ; save dx in current pcb
			mov [pcb+bx+8], si ; save si in current pcb
			mov [pcb+bx+10], di ; save di in current pcb
			mov [pcb+bx+12], bp ; save bp in current pcb
			mov [pcb+bx+24], es ; save es in current pcb
			pop ax ; read original bx from stack
			mov [pcb+bx+2], ax ; save bx in current pcb
			pop ax ; read original ds from stack
			mov [pcb+bx+20], ax ; save ds in current pcb
			pop ax ; read original ip from stack
			mov [pcb+bx+16], ax ; save ip in current pcb
			pop ax ; read original cs from stack
			mov [pcb+bx+18], ax ; save cs in current pcb
			pop ax ; read original flags from stack
			mov [pcb+bx+26], ax ; save cs in current pcb
			mov [pcb+bx+22], ss ; save ss in current pcb
			mov [pcb+bx+14], sp ; save sp in current pcb
			
			mov bx, [pcb+bx+28] ; read next pcb of this pcb
			mov [current], bx ; update current to new pcb
			mov cl, 5
			shl bx, cl ; multiply by 32 for pcb start
			
			mov cx, [pcb+bx+4] ; read cx of new process
			mov dx, [pcb+bx+6] ; read dx of new process
			mov si, [pcb+bx+8] ; read si of new process
			mov di, [pcb+bx+10] ; read diof new process
			mov bp, [pcb+bx+12] ; read bp of new process
			mov es, [pcb+bx+24] ; read es of new process
			mov ss, [pcb+bx+22] ; read ss of new process
			mov sp, [pcb+bx+14] ; read sp of new process
			push word [pcb+bx+26] ; push flags of new process
			push word [pcb+bx+18] ; push cs of new process
			push word [pcb+bx+16] ; push ip of new process
			push word [pcb+bx+20] ; push ds of new process
			
			mov al, 0x20
			out 0x20, al ; send EOI to PIC
			
			mov ax, [pcb+bx+0] ; read ax of new process
			mov bx, [pcb+bx+2] ; read bx of new process
			pop ds ; read ds of new process
			
			iret ; return to new process


start: 
       call main_screen
mov ax, 1100
out 0x40, al
mov al, ah
out 0x40, al

		xor ax, ax
		mov es, ax ; point es to IVT base
		mov ax, [es:9*4]
		mov [oldisr], ax ; save offset of old routine
		mov ax, [es:9*4+2]
		mov [oldisr+2], ax ; save segment of old routine

		cli ; disable interrupts
		mov word [es:9*4], kbisr ; store offset at n*4
		mov [es:9*4+2], cs ; store segment at n*4+2
		mov word [es:8*4], timer; store offset at n*4  ;--
		mov [es:8*4+2], cs ; store segment at n*4+2    ;--
		sti ; enable interrupts

		mov dx, start ; end of resident portion
		add dx, 15 ; round up to next para
		mov cl, 4
		shr dx, cl ; number of paras..../2^4
		nextkey: xor ah, ah ; service 0 – get keystroke
				 int 0x16 ; bios keyboard services
				
				push cs ; use current code segment
				mov ax, mytask
				push ax ; use mytask as offset
				push word [lineno] ; thread parameter
				call initpcb ; register the thread
				inc word [lineno] ; update line number
				push cs ; use current code segment
				mov ax, mytask2
				push ax ; use mytask as offset
				push word [lineno] ; thread parameter
				call initpcb ; register the thread
				inc word [lineno] ; update line number
				jmp nextkey ; wait for next keypress