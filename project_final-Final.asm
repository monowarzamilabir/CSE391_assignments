.MODEL SMALL
 
.STACK 100H

.DATA   

;;msg lines  
sign1 db "----------------------------$"
log_page db "X  ----- Login page -----  X$"
wrong_username db "You have entered an invalid username or password. Please try again.$" 
inc_items db "If you want to modify the number of genres, type 1. If you want to log out, type 2. And if you want to see the genres again, type 3.$"
invalid_inp db "Admin, you have entered a wrong instruction. Please correct it and try again.$"
with_genres db "If you want to increase a genre, type 1. If you want to decrease a genre, type 2. And if you want to go back, type 3.$"
;;with_books db "If you want to increase a book(in all genres), type 1. If you want to decrease a book(in all genres), type 2. And if you want to go back, type 3.$"
good_work db "Good work today (^^). $"
inc_msg_genre db "New genre added in the library.$"
dec_msg_genre db "Old genre removed from the library.$"
;;inc_msg_book db "1 New book added in all genres.$"
;;dec_msg_book db "1 Old book removed from all genres.$"
user_input db "Enter your input here: $" 
details db "XXXX------------------Details-------------------XXXX$"


;;welcome messages for customer panel
greet_1 db "X                  welcome to our small online book store                   X$"
greet_2 db "-----------------------------------------------------------------------------$" 
greet_3 db "     !!!You can select books from our different collections of genres!!!     $"
greet_4 db "!!You can even search and try to see if your favourite book is in stock or not!!$"
greet_5 db "          !!!Hope you can find the book, you are looking for (^^) !!!         $"
greet_6 db "X                             Dear customer,                                X$"   


;;welcome messages for admin panel
greet_7 db "X                  welcome,admin                   X$"
greet_8 db "----------------------------------------------------$" 
greet_9 db "X      !!!Let's make the best out of today!!!      X$" 



;;login messages
login_username db "Username: $"
login_pass db "Password: $"

;;all users login details
admin db "admin$"
adminpass db "admin$"
user1 db "user1$"
user1pass db "user1$"
user2 db "user2$"
user2pass db "user2$"
user3 db "user3$"
user3pass db "user3$" 


;;taking_input
name_ db 5 dup(?)
pass_ db 5 dup(?)


;;genres 
total_genres db 3
update_genres db 3
genres_available db "The number of genres available are : $"
a db "genre : Action$"
d db "genre : Drama$"
m db "genre : Mystery$"
r db "genre : Romance$"
w db "genre : War$"
h db "genre : Horror$"
error_max_genres db "Database has reached max space, so can't introduce more genres.$" 
error_min_genres db "There are no genres left to delete from the database.$"



;;array of books
action db "Allegiant__ 50$", "Divergent__ 60$", "Insurgent__ 60$" 
action_new db "Allegiant__ 50$", 0
       db "Divergent__ 60$", 0
       db "Insurgent__ 60$", 0

    
drama db "Hamlet_____ 20$", "Macbeth____ 25$", "Othelo_____ 10$"
                                                           
mystery db  "Blue Bird__ 20$", "Dead Time__ 13$", "Gone Girl__ 90$" 

drama_new db "Hamlet_____ 20$", 0
      db "Macbeth____ 25$", 0
      db "Othelo_____ 10$", 0

mystery_new db "Blue Bird__ 20$", 0
        db "Dead Time__ 13$", 0
        db "Gone Girl__ 90$", 0

    
romance db "Book Lovers 40$", "Clueless___ 40$", "Jane Eyre__ 42$"

war db "Gladiater__ 12$", "Kanguva____ 80$", "Gold Run___ 17$"

horror db "Sting______ 11$", "Don't come_ 70$", "Time Cut___ 16$"

total_books dw 3
;;update_books dw 3 
;;error_max_books db "Ran out of space, so no books can be added.$" 
;;error_min_books db "There are no books left to delete from all genres.$"



;;numbering
num db 31h   
loopVar db 0

newline db 0Dh, 0Ah, '$'

;;AL's variables end here
new_genre_flag db 0

genre_msg db 'Select a Genre:', 0Dh, 0Ah, '1. Action', 0Dh, 0Ah, '2. Drama', 0Dh, 0Ah, '3. Mystery', 0Dh, 0Ah, '4. Exit', 0Dh, 0Ah, '$'
Action_msg db 'Action Books:', 0Dh, 0Ah, 'a. Allegiant___50', 0Dh, 0Ah, 'b. Divergent___60', 0Dh, 0Ah, 'c. Insurgent___60', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
Drama_msg db 'Drama Books:', 0Dh, 0Ah, 'a. Hamlet_____20', 0Dh, 0Ah, 'b. Macbeth____25', 0Dh, 0Ah, 'c. Othelo_____10', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
Mystery_msg db 'Mystery Books:', 0Dh, 0Ah, 'a. Blue Bird__20', 0Dh, 0Ah, 'b. Dead Time__13', 0Dh, 0Ah, 'c. Gone Girl___90', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$' 
War_msg db 'War Books:', 0Dh, 0Ah, 'a. Gladiater__120$', 0Dh, 0Ah, 'b. Kanguva_____80$', 0Dh, 0Ah, 'c. Gold Run___170$', 0Dh, 0Ah, 'd. Mutant_____160$', 0Dh, 0Ah, 'e. Kalki9900___60$', 0Dh, 0Ah, 'f. Kingdom____200$', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
Romance_msg db 'Romance Books:', 0Dh, 0Ah, 'a. Book Lovers_40$', 0Dh, 0Ah, 'b. Clueless____40$', 0Dh, 0Ah, 'c. Jane Eyre__400$', 0Dh, 0Ah, 'd. Outlander___80$', 0Dh, 0Ah, 'e. After time__90$', 0Dh, 0Ah, 'f. Meeting____140$', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
Horror_msg db 'Horror Books:', 0Dh, 0Ah, 'a. Sting______120$', 0Dh, 0Ah, 'b. Don''t come__70$', 0Dh, 0Ah, 'c. Time Cut___160$', 0Dh, 0Ah, 'd. Afraid_____200$', 0Dh, 0Ah, 'e. Hellboy_____20$', 0Dh, 0Ah, 'f. Outsider___500$', 0Dh, 0Ah, 'x. Back to Genres', 0Dh, 0Ah, '$'
cart_msg db 'Book added to your cart!', 0Dh, 0Ah, '$'
exit_msg db 'Thank you for visiting the Online Book Store!', 0Dh, 0Ah, '$'

invalid_msg db 'Invalid choice! Please restart the program.', 0Dh, 0Ah, '$'
invalid_msg2 db 'Invalid choice! Please choose from available options.', 0Dh, 0Ah, '$'


;stock
as_b1 db 5
as_b2 db 5
as_b3 db 5 
ds_b1 db 5
ds_b2 db 5
ds_b3 db 5
ms_b1 db 5
ms_b2 db 5
ms_b3 db 5
a_b1 db "Allegiant$"
a_b2 db "Divergent$"
a_b3 db "Insurgent$" 
d_b1 db "Hamlet$"
d_b2 db "Macbeth$"
d_b3 db "Othelo$"
m_b1 db "Blue Bird$"
m_b2 db "Dead Time$"
m_b3 db "Gone Girl$"  


genre_flag db ? ;flag for knowing in which genre, customer is selecting book from 
first_part db 0
 


;; New variables for cart

CART_LEN db 0            ; Counter to track the number of books in the cart
CART_TOTAL_PRICE dw 0    ; Total price of all books in the cart
FINAL_PRICE dw 0         ; Price after applying discount  
CART_DISCOUNTED_TOTAL_PRICE dw 0

BOOK_PRICE db 0                 ; To store the price of the selected book 
CART1 Dw ?
CART2 Dw ?
CART3 Dw ?
cart_var db ? 
CART1_PRICE DW ?
CART2_PRICE DW ?
CART3_PRICE DW ?
CART1_STOCK DB ?       ;1 for as_b1, 2 for as_b2, 3 for as_b3, 4 for ds_b1 .....
CART2_STOCK DB ?
CART3_STOCK DB ?




;; Messages
cart_added_msg db 'Book added to your cart!', 0Dh, 0Ah, '$'
cart_full_msg db 'Cart is full! Cannot add more items.', 0Dh, 0Ah, '$'
cart_empty_msg db 'Your cart is empty!', 0Dh, 0Ah, '$'
total_price_msg db 'Total Price (Before Discount): $', 0Dh, 0Ah, '$'
discount1 db 'Total Price (After 5 taka discount for 2 items): $', 0Dh, 0Ah, '$' 
discount2 db 'Total Price (After 10 taka discount for 3 items): $', 0Dh, 0Ah, '$'
discount_msg db 'Discount Applied: $', 0Dh, 0Ah, '$'  
unavailable_msg db 'Stock Unavailable$'


;new messages
choice_msg db 'Press x to change genre and press 1 to print the invoice.$' 
invoice db '---------INVOICE---------$',  0Dh, 0Ah,'$' 
total db 'Your total price is: $' 
delete_msg db 'Press 1 to delete from the cart, Press 2 to add more books and press 3 to checkout!$',  0Dh, 0Ah, 'Enter your input: $'
select_ab db 'Select a for deleting first item and select b for deleting second item!$',  0Dh, 0Ah, 'Enter your input: $'
select_abc db 'Select a for deleting first item, select b for deleting second item and select c for deleting third item!$',  0Dh, 0Ah, 'Enter your input: $'
stock_available db 'Book---Available Stock$'

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 

;;login interface
starts_here:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, sign1
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 9
lea dx, log_page
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, sign1
int 21h 

jmp taking_input



;user input
againtry: 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


mov ah, 9
lea dx, wrong_username
int 21h 



taking_input:

;taking username from user

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, login_username
int 21h 


mov cx, 5
mov si, 0

take_name:
mov ah, 1 
int 21h 
mov name_[si], al
inc si
loop take_name  


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h  


;taking password from the user
mov ah, 9
lea dx, login_pass
int 21h 


mov cx, 5
mov si, 0

take_pass:
mov ah, 1 
int 21h 
mov pass_[si], al
inc si
loop take_pass

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


;;comparing username 
;for admin
check0:
mov cx, 5
mov si, 0

aduser:

;for admin
mov al, admin[si]
mov bl, name_[si]

cmp al, bl
jne check1
inc si
loop aduser
jmp admin_pass_check

;for user1
check1:
mov cx, 5
mov si, 0

us1user:
mov al, user1[si]
mov bl, name_[si]

cmp al, bl
jne check2
inc si
loop us1user
jmp user1_pass_check

 
;for user2
check2: 
mov cx, 5
mov si, 0

us2user:
mov al, user2[si]
mov bl, name_[si]

cmp al, bl
jne check3
inc si
loop us2user
jmp user2_pass_check


;for user3
check3: 
mov cx, 5
mov si, 0

us3user:
mov al, user3[si]
mov bl, name_[si]

cmp al, bl
jne againtry
inc si
loop us3user
jmp user3_pass_check





;comparing password


;for admin
admin_pass_check:

mov cx, 5
mov si, 0

adpass:

mov al, adminpass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop adpass
jmp admin_panel 


user1_pass_check:

mov cx, 5
mov si, 0

us1pass:

mov al, user1pass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop us1pass
jmp user_panel


user2_pass_check:

mov cx, 5
mov si, 0

us2pass:

mov al, user2pass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop us2pass
jmp user_panel


user3_pass_check:

mov cx, 5
mov si, 0

us3pass:

mov al, user3pass[si]
mov bl, pass_[si]

cmp al, bl
jne againtry
inc si
loop us3pass
jmp user_panel

;login part ends here


;; admin interface
admin_panel:

;;welcome statement starts here

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_8
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_7
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_9
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_8
int 21h 


;; welcome statement ends here

;;when the admin wants to see the genres again by option 3 in seen_genres
from_start:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov bl, update_genres
mov total_genres, bl


;;Summary of books and genres 

showing_books:

mov ah, 9
lea dx, details
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9 
lea dx, genres_available
int 21h 


mov ah, 2
mov dl, total_genres
add dl, 30h
int 21h 


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


first:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, a
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


act:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, action[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop act

dec total_genres



second:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, d
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


dra:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, drama[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop dra

dec total_genres




third:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, m
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mys:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, mystery[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop mys

dec total_genres



fourth:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, r
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


rom:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, romance[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop rom

dec total_genres




fifth:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, w
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


wa:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, war[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop wa

dec total_genres




sixth:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h



cmp total_genres, 0
je seen_genres


mov cx, total_books
mov si, 0
mov bl, num 

mov ah, 9
lea dx, h
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


hor:

mov ah, 2
mov dl, bl
int 21h
inc bl 

mov ah, 2
mov dl, "."
int 21h

mov ah, 9
lea dx, horror[si]
int 21h 
add si, 15

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

loop hor

dec total_genres





seen_genres:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, inc_items
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, user_input
int 21h

mov ah, 1
int 21h
 

cmp al, "1"
je modify_genres

cmp al, "2"
je log_out

cmp al, "3"
je from_start

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, invalid_inp
int 21h

jmp seen_genres 



modify_genres:

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 

mov ah, 9
lea dx, with_genres
int 21h 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, user_input
int 21h

mov ah, 1
int 21h

cmp al, "1"
je plus_genre

cmp al, "2"
je minus_genre

cmp al, "3"
je seen_genres 

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9
lea dx, invalid_inp
int 21h

jmp modify_genres


plus_genre:
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


inc update_genres

cmp update_genres, 7
je max_genres


mov bl, update_genres
mov total_genres, bl

mov ah, 9
lea dx, inc_msg_genre
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


jmp showing_books



minus_genre:
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


dec update_genres

cmp update_genres, 0
jl min_genres


mov bl, update_genres
mov total_genres, bl

mov ah, 9
lea dx, dec_msg_genre
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


jmp showing_books



max_genres:

dec update_genres 

mov ah, 9
lea dx, error_max_genres
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

jmp seen_genres 


min_genres:

inc update_genres 

mov ah, 9
lea dx, error_min_genres
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

jmp seen_genres


log_out: 
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 9 
lea dx, good_work 
int 21h

jmp starts_here


;;user interface
user_panel:

;;welcome statement starts here
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_2
int 21h 
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 9
lea dx, greet_6
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
    

mov ah, 9
lea dx, greet_1
int 21h 
        
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 


mov ah, 9
lea dx, greet_2
int 21h  

        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
        
mov ah, 9
lea dx, greet_3
int 21h
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
        
mov ah, 9
lea dx, greet_4
int 21h
        
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
        
mov ah, 9
lea dx, greet_5
int 21h
        

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h


mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h        
;; welcome statement ends here


;;;my part (Al-Nahian's) ends here

;;[Welcome page er kaj kore disi, so oita nia pera khete hbe na :)]

;;Nigi's part starts from here

select_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    

    mov ah, 09h              ; Print genre selection message
    lea dx, genre_msg
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, user_input
    int 21h

    mov ah, 01h              ; Wait for genre selection input
    int 21h
    mov bl, al               ; Store input in BL register

    cmp bl, '1'
    mov genre_flag, 1              ; Check if input is '1'
    je Action_genre

    cmp bl, '2'
    mov genre_flag, 2              ; Check if input is '2'
    je Drama_genre

    cmp bl, '3'
    mov genre_flag, 3             ; Check if input is '3'
    je Mystery_genre

    cmp bl, '4'              ; Check if input is '4'
    je exit_program
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 09h              ; Print invalid choice message
    lea dx, invalid_msg
    int 21h 

    jmp select_genre         ; Invalid input, re-prompt

Action_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h


    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    lea dx, Action_msg
    mov ah, 09h
    int 21h
    
    ;my part 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    
    mov ah, 9
    lea dx, stock_available
    int 21h
    
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
      
    
    
    mov ah, 09h
    lea dx, a_b1
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, as_b1
    add dl, 30h
    int 21h 
    ;a_b1 end here 
        mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    
    mov ah, 09h
    lea dx, a_b2
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, as_b2
    add dl, 30h
    int 21h 
    ;a_b2 end here
        mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    
    mov ah, 09h
    lea dx, a_b3
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, as_b3
    add dl, 30h
    int 21h 
    ;a_b3 end here
    
    
    
    call book_selection
    jmp select_genre

Drama_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    lea dx, Drama_msg
    mov ah, 09h
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    ;my part 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    
    mov ah, 9
    lea dx, stock_available
    int 21h
    
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
       
    
    
    mov ah, 09h
    lea dx, d_b1
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, ds_b1
    add dl, 30h
    int 21h 
    ;d_b1 end here 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    
    mov ah, 09h
    lea dx, d_b2
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, ds_b2
    add dl, 30h
    int 21h 
    ;d_b2 end here
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    
    mov ah, 09h
    lea dx, d_b3
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, ds_b3
    add dl, 30h
    int 21h 
    ;d_b3 end here
    
    
    call book_selection
    jmp select_genre

Mystery_genre:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 09h              ; Print mystery books
    lea dx, Mystery_msg
    int 21h  
    
    ;my part 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    
    mov ah, 9
    lea dx, stock_available
    int 21h
    
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
      
    
    
    mov ah, 09h
    lea dx, m_b1
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, ms_b1
    add dl, 30h
    int 21h 
    ;a_b1 end here 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    
    mov ah, 09h
    lea dx, m_b2
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, ms_b2
    add dl, 30h
    int 21h 
    ;m_b2 end here
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h  
    
    
    mov ah, 09h
    lea dx, m_b3
    int 21h
                       
    
    ; Print a space
    mov ah, 02h                
    mov dl, ' '                 
    int 21h 
    
    
    mov dl, ms_b3
    add dl, 30h
    int 21h 
    ;m_b3 end here
    
    
    call book_selection
    jmp select_genre

book_selection:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
           
    mov ah, 9       
    lea dx, choice_msg
    int 21h 
    
    mov ah, 9
    lea dx, user_input
    int 21h        
    
    
    mov ah, 01h              ; Wait for book selection input
    int 21h  
    
  

;;;;;;;;;;;;;;Abir cart er kaj, dekho kothay add korba.
 
    cmp al, 'a'
    je select_first_book
    cmp al, 'b'               ; If 'b', select the second book
    je select_second_book
    cmp al, 'c'               ; If 'c', select the third book
    je select_third_book 
    ;cmp al, '1'
    ;je select_genre
    

;;;;;;;;;;;;; aita tomar part
    
    cmp al, 'x'              ; Check if input is 'x', this goes to select genre
    je exit_genre 
    
    cmp al, '1'
    je exit_program
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah, 09h              ; Print cart message
    lea dx, cart_msg
    int 21h
    ret

exit_genre:
    ret    



select_first_book:
    cmp CART_LEN, 3
    je cart_full
    
    cmp genre_flag, 1
    je action1  
    cmp genre_flag, 2
    je drama1
    cmp genre_flag, 3
    je mystery1
    action1:
    CMP as_b1, 0      ;checking if stock is available
    je unavailable
    dec as_b1     ;reducing stock
    INC CART_LEN
    mov si, 0  
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 50
    mov CART_TOTAL_PRICE, ax
    
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_action1_cart1
    cmp CART_LEN, 2
    je delete_action1_cart2
    cmp CART_LEN, 3
    je delete_action1_cart3 
    delete_action1_cart1:
    mov CART1_PRICE, 50
    mov CART1_STOCK, 1 ;Indicates second book of action genre
    jmp add_to_cart
    delete_action1_cart2:
    mov CART2_PRICE, 50
    mov CART2_STOCK, 1 ;Indicates second book of action genre
    jmp add_to_cart
    delete_action1_cart3:
    mov CART3_PRICE, 50
    mov CART3_STOCK, 1 ;Indicates second book of action genre
    jmp add_to_cart
    
    drama1:
    CMP ds_b1, 0
    je unavailable
    dec ds_b1     ;reducing stock 
    INC CART_LEN
    mov si, 0  
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 20
    mov CART_TOTAL_PRICE, ax
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_drama1_cart1
    cmp CART_LEN, 2
    je delete_drama1_cart2
    cmp CART_LEN, 3
    je delete_drama1_cart3 
    delete_drama1_cart1:
    mov CART1_PRICE, 20
    mov CART1_STOCK, 4 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_drama1_cart2:
    mov CART2_PRICE, 20
    mov CART2_STOCK, 4 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_drama1_cart3:
    mov CART3_PRICE, 20
    mov CART3_STOCK, 4 ;Indicates third book of drama genre
    jmp add_to_cart
    
    mystery1:
    CMP ms_b1, 0
    je unavailable
    dec ms_b1     ;reducing stock 
    INC CART_LEN
    mov si, 0 
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 20
    mov CART_TOTAL_PRICE, ax
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_mystery1_cart1
    cmp CART_LEN, 2
    je delete_mystery1_cart2
    cmp CART_LEN, 3
    je delete_mystery1_cart3 
    delete_mystery1_cart1:
    mov CART1_PRICE, 20
    mov CART1_STOCK, 7 ;Indicates second book of mystery genre
    jmp add_to_cart
    delete_mystery1_cart2:
    mov CART2_PRICE, 20
    mov CART2_STOCK, 7 ;Indicates third book of mystery genre
    jmp add_to_cart
    delete_mystery1_cart3:
    mov CART3_PRICE, 20
    mov CART3_STOCK, 7 ;Indicates third book of mystery genre
    jmp add_to_cart 
    
    

select_second_book:
    cmp CART_LEN, 3
    je cart_full 
    
    cmp genre_flag, 1
    je action2  
    cmp genre_flag, 2
    je drama2
    cmp genre_flag, 3
    je mystery2
    action2:
    CMP as_b2, 0      ;checking if stock is available
    je unavailable
    dec as_b2     ;reducing stock
    INC CART_LEN
    mov si, 16 
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 60
    mov CART_TOTAL_PRICE, ax
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_action2_cart1
    cmp CART_LEN, 2
    je delete_action2_cart2
    cmp CART_LEN, 3
    je delete_action2_cart3 
    delete_action2_cart1:
    mov CART1_PRICE, 60
    mov CART1_STOCK, 2 ;Indicates second book of action genre
    jmp add_to_cart
    delete_action2_cart2:
    mov CART2_PRICE, 60
    mov CART2_STOCK, 2 ;Indicates second book of action genre
    jmp add_to_cart
    delete_action2_cart3:
    mov CART3_PRICE, 60
    mov CART3_STOCK, 2 ;Indicates second book of action genre
    jmp add_to_cart 
    
    drama2:
    CMP ds_b2, 0
    je unavailable
    dec ds_b2     ;reducing stock 
    INC CART_LEN
   
    mov si, 16
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 25
    mov CART_TOTAL_PRICE, ax
     
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_drama2_cart1
    cmp CART_LEN, 2
    je delete_drama2_cart2
    cmp CART_LEN, 3
    je delete_drama2_cart3 
    delete_drama2_cart1:
    mov CART1_PRICE, 25
    mov CART1_STOCK, 5 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_drama2_cart2:
    mov CART2_PRICE, 25
    mov CART2_STOCK, 5 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_drama2_cart3:
    mov CART3_PRICE, 25
    mov CART3_STOCK, 5 ;Indicates third book of drama genre
    jmp add_to_cart 
    
    mystery2:
    CMP ms_b2, 0
    je unavailable
    dec ms_b2     ;reducing stock 
    INC CART_LEN
   
    mov si, 16
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 13
    mov CART_TOTAL_PRICE, ax
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_mystery2_cart1
    cmp CART_LEN, 2
    je delete_mystery2_cart2
    cmp CART_LEN, 3
    je delete_mystery2_cart3 
    delete_mystery2_cart1:
    mov CART1_PRICE, 13
    mov CART1_STOCK, 8 ;Indicates second book of mystery genre
    jmp add_to_cart
    delete_mystery2_cart2:
    mov CART2_PRICE, 13
    mov CART2_STOCK, 8 ;Indicates third book of mystery genre
    jmp add_to_cart
    delete_mystery2_cart3:
    mov CART3_PRICE, 13
    mov CART3_STOCK, 8 ;Indicates third book of mystery genre
    jmp add_to_cart
    
    

select_third_book:
    cmp CART_LEN, 3
    je cart_full
    
    cmp genre_flag, 1
    je action3  
    cmp genre_flag, 2
    je drama3
    cmp genre_flag, 3
    je mystery3
    action3:
    CMP as_b3, 0      ;checking if stock is available
    je unavailable
    dec as_b3     ;reducing stock
    INC CART_LEN 
    mov si, 32 ;for accessing 3rd index 
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 60
    mov CART_TOTAL_PRICE, ax 
    
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_action3_cart1
    cmp CART_LEN, 2
    je delete_action3_cart2
    cmp CART_LEN, 3
    je delete_action3_cart3 
    delete_action3_cart1:
    mov CART1_PRICE, 60
    mov CART1_STOCK, 3 ;Indicates third book of action genre
    jmp add_to_cart
    delete_action3_cart2:
    mov CART2_PRICE, 60
    mov CART2_STOCK, 3 ;Indicates third book of action genre
    jmp add_to_cart
    delete_action3_cart3:
    mov CART3_PRICE, 60
    mov CART3_STOCK, 3 ;Indicates third book of action genre
    jmp add_to_cart
    
    
    drama3:
    CMP ds_b3, 0
    je unavailable
    dec ds_b3     ;reducing stock 
    INC CART_LEN 
    mov si, 32 ;for accessing 3rd index
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 10
    mov CART_TOTAL_PRICE, ax
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_drama3_cart1
    cmp CART_LEN, 2
    je delete_drama3_cart2
    cmp CART_LEN, 3
    je delete_drama3_cart3 
    delete_drama3_cart1:
    mov CART1_PRICE, 10
    mov CART1_STOCK, 6 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_drama3_cart2:
    mov CART2_PRICE, 10
    mov CART2_STOCK, 6 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_drama3_cart3:
    mov CART3_PRICE, 10
    mov CART3_STOCK, 6 ;Indicates third book of drama genre
    jmp add_to_cart
    
    
    mystery3:
    CMP ms_b3, 0
    je unavailable
    dec ms_b3     ;reducing stock 
    INC CART_LEN 
    mov si, 32 ;for accessing 3rd index
    
    ;add the price of book into total
    mov ax, CART_TOTAL_PRICE
    add ax, 90
    mov CART_TOTAL_PRICE, ax
    
    ;part for managing delete from cart
    cmp CART_LEN, 1
    je delete_mystery3_cart1
    cmp CART_LEN, 2
    je delete_mystery3_cart2
    cmp CART_LEN, 3
    je delete_mystery3_cart3 
    delete_mystery3_cart1:
    mov CART1_PRICE, 90
    mov CART1_STOCK, 9 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_mystery3_cart2:
    mov CART2_PRICE, 90
    mov CART2_STOCK, 9 ;Indicates third book of drama genre
    jmp add_to_cart
    delete_mystery3_cart3:
    mov CART3_PRICE, 90
    mov CART3_STOCK, 9 ;Indicates third book of drama genre
    jmp add_to_cart
     
    
    
add_to_cart:
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah, 09h              ; Print cart message
    lea dx, cart_msg
    int 21h
    
    cmp CART_LEN, 1     ;cart is empty so store in 1st val
    je cart_var1
    cmp CART_LEN, 2     
    je cart_var2
    cmp CART_LEN, 3    
    je cart_var3
    
    cart_var1:
                
    mov cart_var, 1          ;used in parse price
    
    cmp genre_flag, 1
    je add_action1  
    cmp genre_flag, 2
    je add_drama1
    cmp genre_flag, 3
    je add_mystery1
    
    add_action1:
    
    lea ax, action_new[si]     ; Load the address of the string into AX
    mov CART1, ax          ; Store the address in CART1
     
    jmp price 
    
    add_drama1:
    lea ax, drama_new[si]     ; Load the address of the string into AX
    mov CART1, ax          ; Store the address in CART1
    jmp price  
    
    add_mystery1:
    lea ax, mystery_new[si]     ; Load the address of the string into AX
    mov CART1, ax          ; Store the address in CART1 
    jmp price 
    
    
    cart_var2:
     
    mov cart_var, 2 
    
    cmp genre_flag, 1
    je add_action2  
    cmp genre_flag, 2
    je add_drama2
    cmp genre_flag, 3
    je add_mystery2
    
    add_action2:
    lea ax, action_new[si]     ; Load the address of the string into AX
    mov CART2, ax          ; Store the address in CART1 
    jmp price
    
    add_drama2:
    lea ax, drama_new[si]     ; Load the address of the string into AX
    mov CART2, ax          ; Store the address in CART1 
    jmp price 
    
    add_mystery2:
    lea ax, mystery_new[si]     ; Load the address of the string into AX
    mov CART2, ax          ; Store the address in CART1lea CART2, mystery[si] 
    jmp price
    
    
    cart_var3:
    
    mov cart_var, 3
    cmp genre_flag, 1
    je add_action3  
    cmp genre_flag, 2
    je add_drama3
    cmp genre_flag, 3
    je add_mystery3
    
    add_action3:
    lea ax, action_new[si]     ; Load the address of the string into AX
    mov CART3, ax          ; Store the address in CART1 
    jmp price
    
    add_drama3:
    lea ax, drama_new[si]     ; Load the address of the string into AX
    mov CART3, ax          ; Store the address in CART1 
    jmp price 
    
    add_mystery3:
    lea ax, mystery_new[si]     ; Load the address of the string into AX
    mov CART3, ax          ; Store the address in CART1lea CART2, mystery[si] 
    jmp price 
    
    price:
    CMP genre_flag, 1
    je  Action_genre
    CMP genre_flag, 2             ;after calculating price we are again printing the books at the current genre and the updated stock
    je  Drama_genre
    CMP genre_flag, 3
    je  Mystery_genre
    

     



cart_full: 
mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

mov ah, 2
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
mov ah, 9
lea dx, cart_full_msg
int 21h

jmp exit_program ;eta change kore update er option e nite hobe jodi user update korte na chay tokhon payslip print kore exit e jete hobe

unavailable:
mov al, 9
lea dx, unavailable_msg
int 21h

jmp book_selection


invalid_choice:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h

    mov ah, 09h              ; Print invalid choice message
    lea dx, invalid_msg
    int 21h

exit_program:
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, invoice 
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    cmp CART_LEN, 0
    je rest
    
    cmp CART_LEN, 1  ;start of printing invoice
    je one_item
      
    
    cmp CART_LEN, 2
    je two_item
    
    cmp CART_LEN, 3
    je three_item
    
    one_item:
    mov dx, CART1
    mov ah, 9
    int 21h
    jmp rest 
    
    two_item:
    mov dx, CART1
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    MOV AH, 9 
    mov dx, CART2
    int 21h
    jmp rest      
    
    three_item:
    mov dx, CART1
    mov ah, 9
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    MOV AH, 9
    mov dx, CART2
    int 21h
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    MOV AH, 9 
    mov dx, CART3
    int 21h  
    
    rest: 
    
     
    
    ; Print a newline for clarity
    MOV AH, 02H
    MOV DL, 0Dh               ; Carriage return
    INT 21H
    MOV DL, 0Ah               ; Line feed
    INT 21H 
    
    MOV AH, 9
    LEA DX, total_price_msg
    INT 21H
    
    ; Load CART_TOTAL_PRICE into AX
    MOV AX, CART_TOTAL_PRICE  ; AX = CART_TOTAL_PRICE

    ; Extract hundreds place
    MOV BX, 100               ; Divisor for hundreds place
    XOR DX, DX                ; Clear DX for division
    DIV BX                    ; AX / 100: Quotient in AL, remainder in DX
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H               ; DOS print character function
    INT 21H                   ; Print hundreds place
    MOV AX, CX                ; Move remainder back to AX (remaining value)

    ; Extract tens place
    MOV BX, 10                ; Divisor for tens place
    XOR DX, DX
    DIV BX                    ; AX / 10: Quotient in AL, remainder in DX
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H
    INT 21H                   ; Print tens place
    MOV AX, CX                ; Move remainder back to AX (remaining value)

    ; Extract units place
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H
    INT 21H                   ; Print units place

    ; Print a newline for clarity
    MOV AH, 02H
    MOV DL, 0Dh               ; Carriage return
    INT 21H
    MOV DL, 0Ah               ; Line feed
    INT 21H
            
            
    ;discount
    cmp CART_LEN, 1
    je delete
    cmp CART_LEN, 2
    je five
    cmp CART_LEN, 3
    je ten
    
    five:
    mov ax, CART_TOTAL_PRICE 
    sub ax, 5
    mov CART_DISCOUNTED_TOTAL_PRICE, ax
    
    mov ah, 9
    lea dx, discount1
    int 21h 
    
    ; Load CART_TOTAL_PRICE into AX
    MOV AX, CART_DISCOUNTED_TOTAL_PRICE  ; AX = CART_TOTAL_PRICE

    ; Extract hundreds place
    MOV BX, 100               ; Divisor for hundreds place
    XOR DX, DX                ; Clear DX for division
    DIV BX                    ; AX / 100: Quotient in AL, remainder in DX
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H               ; DOS print character function
    INT 21H                   ; Print hundreds place
    MOV AX, CX                ; Move remainder back to AX (remaining value)

    ; Extract tens place
    MOV BX, 10                ; Divisor for tens place
    XOR DX, DX
    DIV BX                    ; AX / 10: Quotient in AL, remainder in DX
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H
    INT 21H                   ; Print tens place
    MOV AX, CX                ; Move remainder back to AX (remaining value)

    ; Extract units place
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H
    INT 21H                   ; Print units place

    ; Print a newline for clarity
    MOV AH, 02H
    MOV DL, 0Dh               ; Carriage return
    INT 21H
    MOV DL, 0Ah               ; Line feed
    INT 21H  
    
    jmp delete
    
    ten:
    
    mov ax, CART_TOTAL_PRICE
    sub ax, 10
    mov CART_DISCOUNTED_TOTAL_PRICE, ax
    
    mov ah, 9
    lea dx, discount2
    int 21h 
    
    ; Load CART_TOTAL_PRICE into AX
    MOV AX, CART_DISCOUNTED_TOTAL_PRICE  ; AX = CART_TOTAL_PRICE

    ; Extract hundreds place
    MOV BX, 100               ; Divisor for hundreds place
    XOR DX, DX                ; Clear DX for division
    DIV BX                    ; AX / 100: Quotient in AL, remainder in DX
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H               ; DOS print character function
    INT 21H                   ; Print hundreds place
    MOV AX, CX                ; Move remainder back to AX (remaining value)

    ; Extract tens place
    MOV BX, 10                ; Divisor for tens place
    XOR DX, DX
    DIV BX                    ; AX / 10: Quotient in AL, remainder in DX
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H
    INT 21H                   ; Print tens place
    MOV AX, CX                ; Move remainder back to AX (remaining value)

    ; Extract units place
    ADD AL, 30h
    MOV CX, DX
    MOV DL, AL               ; Convert to ASCII
    MOV AH, 02H
    INT 21H                   ; Print units place

    ; Print a newline for clarity
    MOV AH, 02H
    MOV DL, 0Dh               ; Carriage return
    INT 21H
    MOV DL, 0Ah               ; Line feed
    INT 21H  
    
 
    
    


    delete:
    ;DELETE FROM CART  
    mov ah, 9
    lea dx, delete_msg
    int 21h
    
    mov ah, 1
    int 21h
    
    cmp al, '1'
    je delete_from_cart
    cmp al, '2'
    je select_genre
    cmp al, '3'
    je rest2
    
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, invalid_msg2
    int 21h
    jmp exit_program 
    
    delete_from_cart:
    cmp CART_LEN, 0
    je cart_already_empty
    cmp CART_LEN, 1
    je delete_one
    cmp CART_LEN, 2
    je delete_two
    cmp CART_LEN, 3
    je delete_three
    
    cart_already_empty:
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, cart_empty_msg
    int 21h
    jmp exit_program
    
    delete_one:
    dec CART_LEN
    mov ax, CART_TOTAL_PRICE   ; price substraction
    sub ax, CART1_PRICE
    mov CART1_PRICE, 0        
    mov CART_TOTAL_PRICE, ax
    
    cmp CART1_STOCK, 1
    call as_b1_stock  
    jmp exit_program
    
    
    cmp CART1_STOCK, 2
    call as_b2_stock 
    jmp exit_program
    
    
    cmp CART1_STOCK, 3
    call as_b3_stock 
    jmp exit_program
    
    
    cmp CART1_STOCK, 4
    call ds_b1_stock 
    jmp exit_program
    
      
    cmp CART1_STOCK, 5
    call ds_b2_stock  
    jmp exit_program
    
    
    cmp CART1_STOCK, 6
    call ds_b3_stock 
    jmp exit_program
    
    
    cmp CART1_STOCK, 7
    call ms_b1_stock 
    jmp exit_program
    
    
    cmp CART1_STOCK, 8
    call ms_b2_stock 
    jmp exit_program
    
    
    cmp CART1_STOCK, 9
    call ms_b3_stock
     
    
    jmp exit_program
    
    delete_two:
    dec CART_LEN
    
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, select_ab
    int 21h   
    
    mov ah, 1
    int 21h
    
    cmp al, 'a'
    je mod1
    cmp al, 'b'
    je mod2
    
    mod1: 
    mov ax, CART_TOTAL_PRICE   ; price substraction
    sub ax, CART1_PRICE
    mov bx, CART2_PRICE
    mov CART2_PRICE, 0
    mov CART1_PRICE, bx ;since cart1 item will be deleted so the price of cart2 should be on cart1 now
    
    mov CART_TOTAL_PRICE, ax
        
     
    mov ax, CART2
    mov CART1, ax 
     
    cmp CART1_STOCK, 1
    call as_b1_stock  
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 2
    call as_b2_stock 
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 3
    call as_b3_stock 
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 4
    call ds_b1_stock 
    jmp change_stock_position_1
    
      
    cmp CART1_STOCK, 5
    call ds_b2_stock  
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 6
    call ds_b3_stock 
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 7
    call ms_b1_stock 
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 8
    call ms_b2_stock 
    jmp change_stock_position_1
    
    
    cmp CART1_STOCK, 9
    call ms_b3_stock
    
    change_stock_position_1: 
    ;;
    mov cl, CART2_STOCK
    mov CART1_STOCK, cl
    
    jmp exit_program
    
    mod2:
    mov ax, CART_TOTAL_PRICE   ; price substraction
    sub ax, CART2_PRICE 
    mov CART2_PRICE, 0     
    mov CART_TOTAL_PRICE, ax
    
    
    cmp CART2_STOCK, 1
    call as_b1_stock  
    jmp exit_program
    
    
    cmp CART2_STOCK, 2
    call as_b2_stock 
    jmp exit_program
    
    
    cmp CART2_STOCK, 3
    call as_b3_stock 
    jmp exit_program
    
    
    cmp CART2_STOCK, 4
    call ds_b1_stock 
    jmp exit_program
    
      
    cmp CART2_STOCK, 5
    call ds_b2_stock  
    jmp exit_program
    
    
    cmp CART2_STOCK, 6
    call ds_b3_stock 
    jmp exit_program
    
    
    cmp CART2_STOCK, 7
    call ms_b1_stock 
    jmp exit_program
    
    
    cmp CART2_STOCK, 8
    call ms_b2_stock 
    jmp exit_program
    
    
    cmp CART2_STOCK, 9
    call ms_b3_stock
    
    
    jmp exit_program
                      
                      
    delete_three:
    
    dec CART_LEN
    
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    
    mov ah, 9
    lea dx, select_abc
    int 21h   
    
    mov ah, 1
    int 21h
    
    cmp al, 'a'
    je mod1_1
    cmp al, 'b'
    je mod2_1
    cmp al, 'c'
    je mod3 
    
    mod1_1: 
    mov ax, CART_TOTAL_PRICE   ; price substraction
    sub ax, CART1_PRICE
    mov bx, CART2_PRICE
    mov CART1_PRICE, bx
    mov bx, CART3_PRICE 
    mov CART2_PRICE, bx
    mov CART3_PRICE, 0 
            
    mov CART_TOTAL_PRICE, ax 
    
   
    
     
    mov ax, CART2
    mov CART1, ax
    
    mov ax, CART3
    mov CART2, ax
    
     
     
    cmp CART1_STOCK, 1
    call as_b1_stock  
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 2
    call as_b2_stock 
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 3
    call as_b3_stock 
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 4
    call ds_b1_stock 
    jmp change_stock_position_1_1
    
      
    cmp CART1_STOCK, 5
    call ds_b2_stock  
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 6
    call ds_b3_stock 
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 7
    call ms_b1_stock 
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 8
    call ms_b2_stock 
    jmp change_stock_position_1_1
    
    
    cmp CART1_STOCK, 9
    call ms_b3_stock
    
    change_stock_position_1_1: 
    ;;
    mov cl, CART2_STOCK
    mov CART1_STOCK, cl
    mov cl, CART3_STOCK
    mov CART2_STOCK, cl 
    ;;
    
    
    
    jmp exit_program
    
    mod2_1:
    mov ax, CART_TOTAL_PRICE   ; price substraction
    sub ax, CART2_PRICE
    mov bx, CART3_PRICE
    mov CART2_PRICE, bx
    mov CART3_PRICE, 0       
    mov CART_TOTAL_PRICE, ax
    
    mov ax, CART3
    mov CART2, ax
    
    
    cmp CART2_STOCK, 1
    call as_b1_stock  
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 2
    call as_b2_stock 
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 3
    call as_b3_stock 
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 4
    call ds_b1_stock 
    jmp change_stock_position_2_1
    
      
    cmp CART2_STOCK, 5
    call ds_b2_stock  
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 6
    call ds_b3_stock 
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 7
    call ms_b1_stock 
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 8
    call ms_b2_stock 
    jmp change_stock_position_2_1
    
    
    cmp CART2_STOCK, 9
    call ms_b3_stock
    
    
    
    
    change_stock_position_2_1: 
    mov cl, CART3_STOCK
    mov CART2_STOCK, cl  
    
    
    
    jmp exit_program
           
    
    mod3: 
    mov ax, CART_TOTAL_PRICE   ; price substraction
    sub ax, CART3_PRICE
    mov CART3_PRICE, 0       
    mov CART_TOTAL_PRICE, ax 
    
    
    
    cmp CART3_STOCK, 1
    call as_b1_stock  
    jmp exit_program
    
    
    cmp CART3_STOCK, 2
    call as_b2_stock 
    jmp exit_program
    
    
    cmp CART3_STOCK, 3
    call as_b3_stock 
    jmp exit_program
    
    
    cmp CART3_STOCK, 4
    call ds_b1_stock 
    jmp exit_program
    
      
    cmp CART3_STOCK, 5
    call ds_b2_stock  
    jmp exit_program
    
    
    cmp CART3_STOCK, 6
    call ds_b3_stock 
    jmp exit_program
    
    
    cmp CART3_STOCK, 7
    call ms_b1_stock 
    jmp exit_program
    
    
    cmp CART3_STOCK, 8
    call ms_b2_stock 
    jmp exit_program
    
    
    cmp CART3_STOCK, 9
    call ms_b3_stock
    
    
    
    
    jmp exit_program
    
    
    
  
    
    

    
    
    
    
    
    rest2:
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h 
    
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h    
    
    
    
    
    mov ah, 09h              ; Print exit message
    lea dx, exit_msg
    int 21h

    mov ah, 4Ch              ; Exit the program
    int 21h


;;Nigi's part ends here




















exit:
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
 ;   END MAIN
 
 
 
 
 
as_b1_stock proc
inc as_b1
ret
as_b1_stock ENDP

as_b2_stock proc 
inc as_b2
ret
as_b2_stock ENDP

as_b3_stock proc  
inc as_b3
ret
as_b3_stock ENDP 



ds_b1_stock proc  
inc ds_b1
ret
ds_b1_stock ENDP

ds_b2_stock proc  
inc ds_b2
ret
ds_b2_stock ENDP

ds_b3_stock proc  
inc ds_b3
ret
ds_b3_stock ENDP



ms_b1_stock proc   
inc ms_b1
ret
ms_b1_stock ENDP

ms_b2_stock proc      
inc ms_b2
ret
ms_b2_stock ENDP

ms_b3_stock proc      
inc ms_b3
ret
ms_b3_stock ENDP
     