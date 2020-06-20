;;;;;;;;;;;;;;;;;Admin Functionality Completed;;;;;;;;;;;;;;;;;;
;///////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;Group Sr. No: 9;;;;;;;;;;;;;;;;;;;;;;;;;;

.stack 100h
.data
;Welcome Data
welcome1 db "****************************$"
welcome2 db "Restaurant Management System$"
welcome3 db "****************************$"

;Main Menu Data 
mainm1 db 13,10,"Press 1. To login as Admin $"
mainm2 db 13,10,"Press 2. To login as Customer $" 
mainm3 db 13,10,"Press 3. To quit $"
mainm4 db 13,10,"Enter your choice: $"
invalid_choice db 13,10,"You have entered an Invalid choice...Please enter again $"

;Admin Portal Data
adminp1 db "=====================$"
adminp2 db "    Admin Portal $"
adminp3 db "=====================$"

;Admin Login Data
username_str db "Enter Username: $"
password_str db 13,10,"Enter Password: $"
aun db 20 dup('$')
apass db 20 dup('$')
ausername db "admin$"
Len_au dw $-ausername
apassword db "12345$"
Len_ap dw $-apassword 
count db ?   


invalid_a_u db 13,10,"You have entered an invalid username...Try again!!! $"
invalid_a_p db 13,10,"You have entered an invalid password...Try again!!! $"

;Admin Menu Data
amenu1 db 13,10,"Press 1. To Add Dish $"
amenu2 db 13,10,"Press 2. To Search Dish $"
amenu3 db 13,10,"Press 3. To Delete Delete Dish $"
amenu4 db 13,10,"Press 4. To Display Dish details$"  
amenu5 db 13,10,"Press 5. Back to Main Menu $"
amenu6 db 13,10,"Enter your choice: $"

;Add Dish Data
dstr1 db 13,10,"Enter Dish Code: $"
dstr2 db 13,10,"Enter Dish Name: $"
dstr3 db 13,10,"Enter Dish Price: $"
dcode dw 5 dup('$')
dname dw 20 dup('$')
dprice dw 5 dup('$')
success db 13,10, "Dish Added Successfully $"
dcode_err db 13,10,"Invalid Dish Code. Enter Two Digit Dish Code $"
dname_err db 13,10,"Invalid Dish Name. Maximum Dish Name Characters Allowed 10 $"
dprice_err db 13,10,"Invalid Dish Price. Enter Four Digit Dish Price $"

;Display Dish Data
d_infostr1 db "Dish Information $"
d_infostr2 db "Dish Code: $"
d_infostr3 db 13,10,"Dish Name: $"
d_infostr4 db 13,10,"Dish Price: $"
d_infostr5 db "No Dish Found $"
d_infostre db 13,10,"Please Add Dish First $"


;Search Dish Menu Data
ds_menustr1 db "Dish Search $"
ds_menustr2 db 13,10,"Press 1. To Search By Dish Code $"
ds_menustr3 db 13,10,"Press 2. To Go Back To Admin Menu $"
ds_menustr4 db 13,10,"Enter Your Choice: $"
ds_menuinput db ?
ds_menustr5 db 13,10,"Invalid Choice Entered. Please Enter Again $"


;Search Dish Data
d_searchstr1 db "Dish Search $"
d_searchstr2 db 13,10,"Enter Dish Code: $"
d_suserinput dw  dup('$')


;Delete Dish Data
d_deletestr1 db 13,10,"Dish Delete $"
d_deletestr2 db 13,10,"Are You Sure Want To Delete Dish ? $"
d_deletestr3 db 13,10,"Press 1 for Yes $"
d_deletestr4 db 13,10,"Press 2 for No $"
d_deletestr5 db 13,10,"Enter Your Choice: $" 
d_deletestr6 db 13,10,"Invalid Choice Entered. Please Enter Again $"
d_deletestr7 db 13,10,"Dish Deletion Successful $"


;Customer Portal Data
custp1 db "=====================$"
custp2 db "   Customer Portal $"
custp3 db "=====================$"


;Customer Login Data
cun db 20 dup('$')
cpass db 20 dup('$')
cusername db "usman$"
Len_cu dw $-cusername
cpassword db "12345$"
Len_cp dw $-cpassword 
invalid_c_u db 13,10,"You have entered an invalid username...Try again!!! $"
invalid_c_p db 13,10,"You have entered an invalid password...Try again!!! $"



;Customer Menu Data
cmenu1 db 13,10,"Press 1. Show Dish Menu $"
cmenu2 db 13,10,"Press 2. Pay Bill $"
cmenu3 db 13,10,"Press 3. Back To Main Menu $"
cmenu4 db 13,10,"Enter your choice: $"
cinvalid_choice db 13,10,"Invalid Choice Entered. Please Enter Again $"


;Pay Bill Data
pb_dc dw 5 dup('$')
pb_ba dw 5 dup('$')

p_billstr1 db "Pay Bill $"
p_billstr2 db 13,10,"Enter The Following Information $"
p_billstr3 db 13,10,"Dish Code: $"
p_billstr4 db 13,10,"Bill Amount: $"
p_billstr5 db 13,10,"Do you want to pay bill (Y/N) ? $"
p_billstr6 db 13,10,"Bill Successfully Paid $"
p_billstr7 db 13,10,"You have entered incorrect dish code $"
p_billstr8 db 13,10,"You have entered incorrect bill amount $"
p_billstr9 db 13,10,"Please Enter Again $",13,10
p_billstr10 db 13,10,"No Dish Found. Please Ask Admin To Add Dish First $"
p_billstr11 db 13,10,"Invalid Choice Entered. Please Try Again $" 


.code
main proc
mov ax,@data
mov ds,ax 

push ax              ;ax  12
push bx              ;bx  10
push cx              ;cx  8
push dx              ;dx  6
push si              ;si  4
push di              ;di  2
push bp              ;bp  0
mov bp,sp

call welcome_screen  ;calling welcome_screen procedure
call main_menu       ;calling main_menu procedure   

pop bp
pop di
pop si
pop dx
pop cx
pop bx
pop ax

call exit            ;calling exit procedure
endp


;=====================WELCOME SCREEN START======================;


welcome_screen proc  
mov dh,1      ;dh->row=1
mov dl,26     ;dl->col=26
mov ah,2      ;ah=2
int 10h       ;BIOS interrupt

lea dx,welcome1
mov ah,09h    ;****************************
int 21h 

mov dh,2      ;dh->row=2
mov dl,26     ;dl->col=26
mov ah,2      ;ah=2
int 10h       ;BIOS interrupt

lea dx,welcome2
mov ah,09h    ;Restaurant Management System
int 21h  

mov dh,3      ;dh->row=3
mov dl,26     ;dl->col=26
mov ah,2      ;ah=2
int 10h       ;BIOS interrupt

lea dx,welcome3
mov ah,09h    ;****************************
int 21h 

ret    
welcome_screen endp


;=====================WELCOME SCREEN ENDS=======================;


;=======================MAIN MENU START=========================;

main_menu proc
again1:
lea dx,mainm1        ;Press 1. To login as Admin
mov ah,09h            
int 21h
lea dx,mainm2        ;Press 2. To login as Customer
int 21h              
lea dx,mainm3        ;Press 3. To quit
int 21h              
lea dx,mainm4        ;Enter your choice:
int 21h

              
mov ah,01h           ; input
int 21h              

cmp al,31h           ;if al<1 && al>3 then goto label invalid
jnae invalid
cmp al,33h
jnbe invalid

valid:
cmp al,31h
je admin            ;if al==1 then goto admin label
cmp al,32h
je customer         ;if al==2 then goto customer label
cmp al,33h
je quit             ;if al==3 then goto quit label
 
admin:
call admin_login    ;calling admin_login procedure
jmp return1 
 
customer:
call customer_login
jmp return1         ;calling customer_login procedure
 
quit:
call exit           ;calling exit procedure
  
invalid:  
mov ah,09h
lea dx,invalid_choice ;You have entered an Invalid choice...Please enter again
int 21h     
mov ah,08h          ;character input without echo
int 21h
call clear_screen
call set_registers
call welcome_screen 
jmp again1
 
return1:  
ret
main_menu endp              

;=======================MAIN MENU ENDS==========================;


;====================ADMIN PORTAL STARTS========================;

admin_portal proc 
mov dh,0          ;dh->row=0
mov dl,29         ;dl->col=29
mov ah,2          ;ah=2
int 10h           ;BIOS interrupt

lea dx,adminp1
mov ah,09h        ;=========================
int 21h 

mov dh,1          ;dh->row=1
mov dl,29         ;dl->col=29
mov ah,2          ;ah=2
int 10h           ;BIOS interrupt

lea dx,adminp2
mov ah,09h        ;Admin Portal
int 21h 

mov dh,2          ;dh->row=2
mov dl,29         ;dl->col=29
mov ah,2          ;ah=2
int 10h           ;BIOS interrupt
  
lea dx,adminp3
mov ah,09h        ;===========================
int 21h

mov dh,3          ;dh->row=3
mov dl,0          ;dl->col=0
mov ah,02h        ;ah=2
int 10h           ;BIOS interrupt
    
ret
admin_portal endp   

;=====================ADMIN PORTAL END==========================;

;=====================ADMIN LOGIN STARTS========================;

admin_login proc      
                      
again2:   
call clear_screen
call set_registers   
call admin_portal                      
                      

;///Username///                      
lea dx,username_str
mov ah,09h              ;Enter Username
int 21h


mov bx,offset aun
mov [count],0           ;Take input from user in Username array
mov ah,01h              ;get character input without echo
un_while:   
int 21h
cmp al,0dh              ;if al=enter key ascii then goto
je end_unwhile          ;label end_while 
mov [bx],al             ;store input in pass array
                        

inc bx                  ;increment address
inc [count]             ;count number of characters
jmp un_while


end_unwhile:
lea si,ausername   
lea di,aun       
mov ax,[Len_au]     
dec al
cmp al,[count]
jne not_uequal
jmp checku

not_uequal: 
mov dh,5                ;row=5
mov dl,0                ;col=0
mov ah,02               ;ah=02h (sub-routine for gotoxy)
int 10h                 ;BIOS interrupt
                       
lea dx,invalid_a_u           
mov ah,09h              ;You have entered an invalid     
int 21h                 ;username...Try again!!!

mov ah,08h              ;wait for user to enter a key
int 21h             
                      
call clear_screen       ;calling clear_screen procedure   
jmp again2             

checku:
mov ch,0
mov cl,[count]   
mov bx,offset aun
mov si,offset ausername
compareu:               ;comparing two strings  
mov al,[bx]             ;character by character
cmp al,[si]
jne not_uequal  
inc bx
inc si
loop compareu 


;///Password////////////////////////////////////////////
lea dx,password_str
mov ah,09h              ;Enter Password
int 21h

mov bx,offset apass
mov [count],0           ;Take input from user in Pass array

   
while:
mov ah,08h              ;get character input without echo
int 21h
cmp al,0dh    
je end_while            ;if al=enter key ascii then goto 
mov [bx],al             ;label end_while
                        ;store input in pass array

mov ah,02h 
mov dl,'*'              ;print *
int 21h

inc bx                  ;increment address
inc [count]             ;count number of characters
jmp while

end_while:

lea si,apassword   
lea di,apass       
mov ax,[Len_ap]     
dec al
cmp al,[count]
jne not_equal
jmp check

not_equal: 
mov dh,5                ;row=5
mov dl,0                ;col=0
mov ah,02               ;ah=02h (sub-routine for gotoxy)
int 10h                 ;BIOS interrupt
                       
lea dx,invalid_a_p           
mov ah,09h              ;You have entered an invalid     
int 21h                 ;password...Try again!!!

mov ah,08h              ;wait for user to enter a key
int 21h
                      
call clear_screen       ;calling clear_screen procedure   
jmp again2             

check:
mov ch,0
mov cl,[count]   
mov bx,offset apass
mov si,offset apassword
compare:           
mov al,[bx]             ;comparing two strings 
cmp al,[si]             ;character by character
jne not_equal  
inc bx
inc si
loop compare 

call clear_screen       ;calling clear_screen procedure                    
call set_registers      ;calling set_registers procedure
call admin_portal       ;calling admin_portal procedure
call admin_main_menu    ;calling admin_main_menu procedure

return:        
ret                     ;returning from admin_login procedure
admin_login endp    

                                                    
;=======================ADMIN LOGIN ENDS========================;


;=====================ADMIN MAIN MENU STARTS====================;


admin_main_menu proc  

mov dh,2                ;row=2
mov dl,29               ;col=29
mov ah,2    
int 10h                 ;BIOS interrupt

lea dx,amenu1
mov ah,09h              ;Press 1. To Create Account
int 21h 

mov dh,3                ;row=3
mov dl,29               ;col=29
mov ah,2
int 10h                 ;BIOS interrupt

lea dx,amenu2
mov ah,09h              ;Press 2. To Search Account 
int 21h  

mov dh,4                ;row=4
mov dl,29               ;col=29
mov ah,2
int 10h                 ;BIOS interrupt

lea dx,amenu3
mov ah,09h              ;Press 3. To Delete Account
int 21h 

mov dh,5                ;row=5
mov dl,29               ;col=29
mov ah,2
int 10h                 ;BIOS interrup

lea dx,amenu4
mov ah,09h              ;Press 4. To Display Account details
int 21h 

lea dx,amenu5
mov ah,09h              ;Press 5. Back to Main Menu
int 21h 

lea dx,amenu6
mov ah,09h              ;Enter your choice:
int 21h 

mov ah,01h              ; user input
int 21h      
mov bl,al

cmp bl,31h              ;if bl<1 && bl>5 then goto 
jnae invalid2
cmp bl,35h
jnbe invalid2           ;label invalid2

valid2:
cmp bl,31h
je add_d                ;if bl==1 then goto add_d label
          
cmp bl,32h
je search_d             ;if bl==2 then goto search_d label
         
cmp bl,33h
je delete_d             ;if bl==3 then goto delete_d label
     
cmp bl,34h
je display_d            ;if bl==4 then goto display_d label
     
cmp bl,35h
je back                 ;if bl==5 then goto back label
     
add_d:
call add_dish           ;go to label add_dish
jmp return3
     
search_d:
call search_menu        ;go to label search_menu
jmp return3  
     
delete_d:
call delete_dish        ;go to label delete_dish
jmp return3
     
display_d:
call display_dish       ;go to label display_dish
jmp return3
     
back:
call clear_screen
call set_registers
call welcome_screen     ;go to main_menu
call main_menu
jmp return3
          
invalid2:
lea dx,invalid_choice   ;if option selected in not valid
mov ah,09h
int 21h
mov ah,08h
int 21h  
     
call clear_screen
call set_registers
call admin_portal 
call admin_main_menu      
               
return3:
ret    
admin_main_menu endp


;=====================ADMIN MAIN MENU ENDS======================;




;========================ADD DISH STARTS========================;
add_dish proc
again4:
call clear_screen
call set_registers
call admin_portal


;///Dish Code///
lea dx,dstr1   
mov ah,09h              ;Enter Dish Code:
int 21h

mov ah,10
lea dx,dcode            ;Take string input in dcode
mov dcode,5
int 21h              

mov ah,0
mov ax,[dcode+1]
cmp al,2
jne dcode_again
jmp dname_enter          


dcode_again:
lea dx,dcode_err
mov ah,09h              ;Invalid Dish Code
int 21h
mov ah,08h
int 21h 
jmp again4



;///Dish Name///
dname_enter:
lea dx,dstr2   
mov ah,09h              ;Enter Dish Name:
int 21h

mov ah,10
lea dx,dname            ;Take string input in dname
mov dname,15
int 21h              

mov ah,0
mov ax,[dname+1]
cmp al,10
jle dprice_enter          
jge dname_again



dname_again:
lea dx,dname_err
mov ah,09h              ;Invalid Dish Name
int 21h
mov ah,08h
int 21h 
jmp again4



;///Dish Price///
dprice_enter:
lea dx,dstr3   
mov ah,09h              ;Enter Dish Price:
int 21h

mov ah,10
lea dx,dprice           ;Take string input in dprice
mov dprice,6
int 21h              

mov ah,0
mov ax,[dprice+1]
cmp al,4
jg dprice_again
jle d_comp         



dprice_again:
lea dx,dprice_err
mov ah,09h              ;Invalid Dish Price
int 21h
mov ah,08h
int 21h 
jmp again4


d_comp:
lea dx,success
mov ah,09h              ;Dish Added Successfully
int 21h   
mov ah,08h
int 21h 
jmp last


last:
call clear_screen
call set_registers
call admin_portal
call admin_main_menu   

ret
add_dish endp 

;========================ADD DISH ENDS==========================;



;======================DISPLAY DISH STARTS======================;
display_dish proc
call clear_screen
call set_registers
call admin_portal

lea dx,d_infostr1       ;Dish Information
mov ah,09h       
int 21h

mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

cmp dcode[si],'$'       ;Check if dish exists or not
je empty


lea dx,d_infostr2       ;Dish Code:
mov ah,09h       
int 21h


mov cx,dcode[1]         ;Display Dish Code
mov ch,0
mov si,2           
mov ah,02h
display_dcode:
mov dx,dcode[si]
int 21h
inc si
loop display_dcode



lea dx,d_infostr3       ;Dish Name:
mov ah,09h       
int 21h


mov cx,dname[1]         ;Display Dish Name
mov ch,0
mov si,2           
mov ah,02h
display_dname:
mov dx,dname[si]
int 21h
inc si
loop display_dname


lea dx,d_infostr4       ;Dish Price:
mov ah,09h       
int 21h


mov cx,dprice[1]        ;Display Dish Price
mov ch,0
mov si,2           
mov ah,02h
display_dprice:
mov dx,dprice[si]
int 21h
inc si
loop display_dprice
jmp w

empty:
lea dx,d_infostr5       ;No Dish Found
mov ah,09h       
int 21h

lea dx,d_infostre       ;Please Add Dish First
mov ah,09h       
int 21h

jmp w

w:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

mov ah,08h              ;wait for input
int 21h  

call clear_screen
call set_registers
call admin_portal 
call admin_main_menu

    
ret
display_dish endp 

;=======================DISPLAY DISH ENDS=======================;


;======================SEARCH MENU STARTS=======================;

search_menu proc
call clear_screen
call set_registers
call admin_portal



lea dx,ds_menustr1      ;Dish Search
mov ah,09h       
int 21h


lea dx,ds_menustr2      ;Press 1
mov ah,09h       
int 21h


lea dx,ds_menustr3      ;Press 2
mov ah,09h       
int 21h

lea dx,ds_menustr4      ;Your Choice
mov ah,09h       
int 21h



mov ah,01 
int 21h
mov ds_menuinput,al     ;store input in ds_menuinput


cmp ds_menuinput,31h    ;if ds_menuinput<1 && 
jnae err                ;ds_menuinput>2 then 
cmp ds_menuinput,32h    ;goto label err
jnbe err


cmp al,31h              ;if al==1 then goto admin label
je sd                   
cmp al,32h              ;if al==2 then goto customer label
je mm                   


sd:
call search_dish        ; go to search dish label


mm:
call clear_screen       ; go to admin main menu
call set_registers
call admin_portal
call admin_main_menu


err:
lea dx,ds_menustr5      ;Dish Menu Error Invalid Choice Entered
mov ah,09h       
int 21h

mov ah,08h              ;wait for input
int 21h

call search_menu        ; go to search menu


ui:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

mov ah,08h              ;wait for input
int 21h


call clear_screen
call set_registers
call admin_portal 
call admin_main_menu

ret
search_menu endp


;======================SEARCH MENU ENDS=======================;


;======================SEARCH DISH STARTS=======================;

search_dish proc
call clear_screen
call set_registers
call admin_portal


lea dx,d_searchstr1     ;Dish Search
mov ah,09h       
int 21h

cmp dcode[si],'$'       ;check if dcode contains any dish
je ds_notfound          ;code, if not print dish not found
                        ;if yes then take input from user



lea dx,d_searchstr2     ;Enter Dish Code
mov ah,09h       
int 21h

mov ah,10
lea dx,d_suserinput     ;Take string input in d_suserinput
mov d_suserinput,3
int 21h

mov ax,d_suserinput[1]  ;compare dcode and user input are
mov bx,dcode[1]         ;of same length
cmp al,bl
jne ds_notfound


mov cx,dcode[1]
mov ch,0
mov si,2
l2:
mov ax,dcode[si]        ;char by char check of user input and
mov bx,d_suserinput[si] ;dish code
cmp ax,bx                    
jne ds_notfound
inc si
loop l2



call display_dish



ds_notfound:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h


lea dx,d_infostr5       ;No Dish Found
mov ah,09h       
int 21h
jmp ds_in


ds_in:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

mov ah,08h              ;wait for input
int 21h 

call clear_screen
call set_registers
call admin_portal 
call admin_main_menu


ret
search_dish endp

;=======================SEARCH DISH ENDS========================;




;======================DELETE DISH STARTS=======================;


delete_dish proc
call clear_screen
call set_registers
call admin_portal

lea dx,d_deletestr1     ;Dish Delete
mov ah,09h       
int 21h

cmp dcode[si],'$'
je d_dnotfound


lea dx,d_deletestr2     ;Are you sure want to delete ?
mov ah,09h       
int 21h

lea dx,d_deletestr3     ;Press 1
mov ah,09h       
int 21h

lea dx,d_deletestr4     ;Press 2
mov ah,09h       
int 21h


lea dx,d_deletestr5     ;Enter your choice
mov ah,09h       
int 21h

mov ah,01
int 21h
mov bl,al

cmp bl,31h              ;if bl<1 && 
jnae d_dinvalid         ;bl>2 then 
cmp bl,32h              ;goto label d_dinvalid
jnbe d_dinvalid


cmp bl,31h
je delete               ;if bl==1 then goto delete label
          
cmp bl,32h
je end                  ;if bl==2 then goto 
                        ;admin main menu label

delete:
mov dcode,'$'
mov dname,0
mov dprice,0

lea dx,d_deletestr7     ;Dish Deletion Successful
mov ah,09h       
int 21h

mov ah,08h              ;wait for input
int 21h 
jmp end



d_dinvalid:
lea dx,d_deletestr6     ;Invalid Choice
mov ah,09h       
int 21h

mov ah,08h              ;wait for input
int 21h

call clear_screen
call set_registers
call admin_portal 
call delete_dish


d_dnotfound:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h


lea dx,d_infostr5       ;No Dish Found
mov ah,09h       
int 21h
jmp dd_in


dd_in:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

mov ah,08h              ;wait for input
int 21h 


end:
call clear_screen
call set_registers
call admin_portal 
call admin_main_menu


ret
delete_dish endp


;=======================DELETE DISH ENDS========================;


;====================CUSTOMER PORTAL STARTS=====================;

customer_portal proc 
mov dh,0                ;dh->row=0
mov dl,29               ;dl->col=29
mov ah,2                ;ah=2
int 10h                 ;BIOS interrupt

lea dx,custp1
mov ah,09h              ;=========================
int 21h 

mov dh,1                ;dh->row=1
mov dl,29               ;dl->col=29
mov ah,2                ;ah=2
int 10h                 ;BIOS interrupt

lea dx,custp2
mov ah,09h              ;Customer Portal
int 21h 

mov dh,2                ;dh->row=2
mov dl,29               ;dl->col=29
mov ah,2                ;ah=2
int 10h                 ;BIOS interrupt
  
lea dx,custp3
mov ah,09h              ;===========================
int 21h

mov dh,3                ;dh->row=3
mov dl,0                ;dl->col=0
mov ah,02h              ;ah=2
int 10h                 ;BIOS interrupt
    
ret
customer_portal endp


;=====================CUSTOMER PORTAL ENDS======================;



;=====================CUSTOMER LOGIN STARTS=====================;

customer_login proc

again:
call clear_screen
call set_registers
call customer_portal

;///Username///                      
lea dx,username_str
mov ah,09h              ;Enter Username
int 21h


mov bx,offset cun
mov [count],0           ;Take input from user in cun array
mov ah,01h              ;get character input without echo
cun_while:   
int 21h
cmp al,0dh    
je end_cunwhile         ;if al=enter key ascii then goto label end_while
mov [bx],al             ;store input in pass array


inc bx                  ;increment address
inc [count]             ;count number of characters
jmp cun_while

end_cunwhile:
lea si,cusername   
lea di,cun       
mov ax,[Len_cu]     
dec al
cmp al,[count]
jne not_cuequal
jmp cchecku

not_cuequal: 
mov dh,5                ;row=5
mov dl,0                ;col=0
mov ah,02               ;ah=02h (sub-routine for gotoxy)
int 10h                 ;BIOS interrupt
                       
lea dx,invalid_c_u           
mov ah,09h              ;You have entered an invalid username...Try again!!!    
int 21h               

mov ah,08h              ;wait for user to enter a key
int 21h
                      
call clear_screen       ;calling clear_screen procedure   
jmp again             

cchecku:
mov ch,0
mov cl,[count]   
mov bx,offset cun
mov si,offset cusername 

comparecu:              ;comparing two strings  
mov al,[bx]             ;character by character
cmp al,[si]
jne not_cuequal  
inc bx
inc si
loop comparecu 


;///Password///
lea dx,password_str
mov ah,09h              ;Enter Password
int 21h

mov bx,offset cpass
mov [count],0           ;Take input from user in cpass array

   
cwhile:
mov ah,08h              ;get character input without echo
int 21h
cmp al,0dh    
je end_cwhile           ;if al=enter key ascii then goto label end_while
mov [bx],al             ;store input in pass array

mov ah,02h
mov dl,'*'              ;print *
int 21h


inc bx                  ;increment address
inc [count]             ;count number of characters
jmp cwhile

end_cwhile:

lea si,cpassword   
lea di,cpass       
mov ax,[Len_cp]     
dec al
cmp al,[count]
jne not_cequal
jmp ccheck

not_cequal: 
mov dh,5                ;row=5
mov dl,0                ;col=0
mov ah,02               ;ah=02h (sub-routine for gotoxy)
int 10h                 ;BIOS interrupt
                       
lea dx,invalid_c_p           
mov ah,09h              ;You have entered an invalid password...Try again!!!    
int 21h               

mov ah,08h              ;wait for user to enter a key
int 21h
                      
call clear_screen       ;calling clear_screen procedure   
jmp again             

ccheck:
mov ch,0
mov cl,[count]   
mov bx,offset cpass
mov si,offset cpassword 

ccompare:               ;comparing two strings  
mov al,[bx]             ;character by character
cmp al,[si]
jne not_cequal  
inc bx
inc si
loop ccompare 

call clear_screen       ;calling clear_screen procedure                    
call set_registers      ;calling set_registers procedure
call customer_portal    ;calling admin_portal procedure
call customer_main_menu ;calling admin_main_menu procedure

  
ret
customer_login endp
;======================CUSTOMER LOGIN ENDS======================;
 



;===================CUSTOMER MAINMENU STARTS====================;
customer_main_menu proc  

mov dh,2                ;row=2
mov dl,29               ;col=29
mov ah,2    
int 10h                 ;BIOS interrupt

lea dx,cmenu1
mov ah,09h              ;Press 1. Show Dish Menu
int 21h 

mov dh,3                ;row=3
mov dl,29               ;col=29
mov ah,2
int 10h                 ;BIOS interrupt

lea dx,cmenu2
mov ah,09h              ;Press 2. Pay Bill 
int 21h  

mov dh,4                ;row=4
mov dl,29               ;col=29
mov ah,2
int 10h                 ;BIOS interrupt

lea dx,cmenu3
mov ah,09h              ;Press 3. Back To Main Menu
int 21h 

mov dh,5                ;row=5
mov dl,29               ;col=29
mov ah,2
int 10h                 ;BIOS interrupt


lea dx,cmenu4
mov ah,09h              ;Enter your choice:
int 21h 

mov ah,01h              ; mov al into bl
int 21h      
mov bl,al

cmp bl,31h              ;if bl<1 && bl>3
jnae cinvalid           ;then goto label invalid2
cmp bl,33h
jnbe cinvalid   

cvalid:
cmp bl,31h
je show_d               ;if bl==1 then goto show_d label
          
cmp bl,32h
je pay_b                ;if bl==2 then goto pay_b label
         
cmp bl,33h
je main_m               ;if bl==3 then goto main_m label
     
       
     
show_d:
call customer_display_dish ;go to customer_display_dish label
jmp returnc
     
pay_b:
call pay_bill           ;go to pay_bill label
jmp returnc  
     
     
main_m:
call clear_screen       ;go to main_menu label
call set_registers
call welcome_screen
call main_menu
jmp returnc
          
cinvalid:
lea dx,cinvalid_choice  ;Invalid Choice Entered
mov ah,09h
int 21h
mov ah,08h
int 21h  
     
call clear_screen
call set_registers
call customer_portal 
call customer_main_menu      
               
returnc:
ret    
customer_main_menu endp



;====================CUSTOMER MAINMENU ENDS=====================;
 




;==================CUSTOMER DISPLAY DISH STARTS=================;
customer_display_dish proc
call clear_screen
call set_registers
call customer_portal

lea dx,d_infostr1       ;Dish Information
mov ah,09h       
int 21h

mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

cmp dcode[si],'$'       ;Check If Dish is added or not
je emptyc               ;jmp to emptyc if dish isn't added


lea dx,d_infostr2       ;Dish Code:
mov ah,09h       
int 21h


mov cx,dcode[1]         ;Display Dish Code
mov ch,0
mov si,2           
mov ah,02h
displayc_dcode:
mov dx,dcode[si]
int 21h
inc si
loop displayc_dcode




lea dx,d_infostr3       ;Dish Name:
mov ah,09h       
int 21h


mov cx,dname[1]         ;Display Dish Name
mov ch,0
mov si,2           
mov ah,02h
displayc_dname:
mov dx,dname[si]
int 21h
inc si
loop displayc_dname



lea dx,d_infostr4       ;Dish Price:
mov ah,09h       
int 21h


mov cx,dprice[1]        ;Display Dish Price
mov ch,0
mov si,2           
mov ah,02h
displayc_dprice:
mov dx,dprice[si]
int 21h
inc si
loop displayc_dprice
jmp wc

emptyc:
lea dx,d_infostr5       ;No Dish Found
mov ah,09h       
int 21h
jmp wc

wc:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

mov ah,08h              ;wait for input
int 21h  

call clear_screen
call set_registers
call customer_portal 
call customer_main_menu

    
ret
customer_display_dish endp 

;===================CUSTOMER DISPLAY DISH ENDS=================;



;========================PAY BILL STARTS=======================;
pay_bill proc

call clear_screen
call set_registers
call customer_portal


lea dx,p_billstr1       ;Pay Bill
mov ah,09h       
int 21h



cmp dcode[si],'$'       ;Check if dish exists
je no_dish              ;jmp to no_dish label if dish doesn't exists


lea dx,p_billstr2   
mov ah,09h              ;Enter Following Information
int 21h



;///Dish Code///
lea dx,p_billstr3   
mov ah,09h              ;Dish Code:
int 21h

mov ah,10
lea dx,pb_dc            ;Take string input in dcode
mov pb_dc,3
int 21h              


mov ax,pb_dc[1]         ;compare dcode and user input are
mov bx,dcode[1]         ;of same length
cmp al,bl
jne wrong_dc



mov cx,dcode[1]
mov ch,0
mov si,2
che:
mov ax,dcode[si]        ;char by char check of user input and
mov bx,pb_dc[si] ;dish code
cmp ax,bx                    
jne wrong_dc
inc si
loop che


;///Bill Amount///
lea dx,p_billstr4   
mov ah,09h              ;Bill Amount:
int 21h

mov ah,10
lea dx,pb_ba            ;Take string input in dcode
mov pb_ba,5
int 21h    


mov ax,pb_ba[1]         ;compare dcode and user input are
mov bx,dprice[1]        ;of same length
cmp al,bl
jne wrong_ba



mov cx,dprice[1]
mov ch,0
mov si,2
chec:
mov ax,dprice[si]       ;char by char check of user input and
mov bx,pb_ba[si]        ;dish code
cmp ax,bx                    
jne wrong_ba
inc si
loop chec


lea dx,p_billstr5       ;Pay Bill Y|N
mov ah,09h       
int 21h

mov ah,01h              ;mov al into bl
int 21h      
mov bl,al


cmp al,'Y'              ;compare input with 'Y'
je suc                  ;if true go label suc

cmp al,'y'              ;compare input with 'y'
je suc                  ;if true go label suc

cmp al,'N'              ;compare input with 'N'
je no                   ;if true go label no

cmp al,'n'              ;compare input with 'n'
je no                   ;if true go label no


jne pb_invalid          ;if above conditions are false
                        ;go to label pb_invalid


suc:
lea dx,p_billstr6       ;Bill Paid Successfully
mov ah,09h       
int 21h

mov ah,08h              ;wait for input
int 21h

jmp pb_mm               ;jmp to label pb_mm


no:
jmp pb_mm


no_dish:
lea dx,p_billstr10      ;No Dish Found
mov ah,09h       
int 21h
jmp pb



wrong_dc:
lea dx,p_billstr7       ;Wrong Dish Code
mov ah,09h       
int 21h
jmp pb


wrong_ba:
lea dx,p_billstr8       ;Wrong Bill Amount
mov ah,09h       
int 21h
jmp pb


pb_invalid:
lea dx,p_billstr11      ;Wrong Choice Entered
mov ah,09h       
int 21h
jmp pb

pb:
mov dl,0dh
mov ah,02h
int 21h                 ;New Line

mov dl,0ah
mov ah,02h
int 21h

mov ah,08h              ;wait for input
int 21h  
 
call pay_bill



pb_mm:
call clear_screen       ;Go Back To Customer Main Menu
call set_registers
call customer_portal
call customer_main_menu



pay_bill endp 
;==========================PAY BILL ENDS=======================;





;////////////////////UNIVERSAL PROCEDURES////////////////////////

;======================CLEAR SCREEN STARTS======================;

clear_screen proc
mov ax,0600h  ;ah=6 scroll up function, al=no of lines to scroll (0 = whole screen)
mov cx,0      ;ch=upper left corner row, cl=upper left corner column 
mov dx,2479   ;dh=lower right corner row, dl=lower right corner column
mov bh,7      ;normal video attribute
int 10h       ;BIOS interrupt
ret
clear_screen endp 

;======================CLEAR SCREEN ENDS========================;


;=====================SET REGISTERS STARTS======================;

set_registers proc
mov ax,[bp+12]        
mov bx,[bp+10]        
mov cx,[bp+8]
mov dx,[bp+6] 
mov si,[bp+4]
mov di,[bp+2] 
ret
set_registers endp  

;=====================SET REGISTERS ENDS========================;


;========================EXIT STARTS============================;

exit proc
mov ah,4ch
int 21h        
ret
exit endp

;=========================EXIT ENDS=============================;

end main