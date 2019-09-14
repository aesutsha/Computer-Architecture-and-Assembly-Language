.data

     welmsg: .asciiz "Hello! Welcome to Digital Lock System"
     menu: .asciiz "Choose one option 1. Open the Lock 2. Set new Password"
     pass: .asciiz "Enter Password: "
     invalid_msg: .asciiz "Invalid Password..."
     success_msg: .asciiz "Successful..."
     curr_pass: .asciiz "Enter Current Password: "
     new_pass: .asciiz "Enter new Password: (Limit 6 digits)"
     set_msg: .asciiz "Successfully saved..."
     password: .asciiz "123456"


.text

    main: 
         li $v0, 4
         la $a0, welmsg           # print welcome message
         syscall 
         
         li $v0, 4
         la $a0, menu             # print menu option
         syscall 
         
         li $v0, 5                 # read option
         syscall
         add $s1, $zero, $v0       # store in $s1
         addi $s6, $zero, 1
         addi $s7, $zero, 2
         
         beq $s1, $s6, invalid
         
         j main
         
    optOne: 
         li $v0, 4
         la $a0, pass           # print password message
         syscall 
         
         li $v0, 8                 # read option
         syscall
         
         add $s2, $zero, $v0
         la $s3, password
         
         beq $s3, $s2, success
         #bne $s3, $s2, invalid
         
    success: 
         li $v0, 4
         la $a0, success_msg          # print success message
         syscall 
         beq $zero, 0, Exit
         
     Exit:
         
         
    invalid:
         li $v0, 4
         la $a0, invalid_msg          # print success message
         syscall 
         
         
         
     
         
          
    
