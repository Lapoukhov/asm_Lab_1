## Lab 1 (FASM)

### Task:

An array of size H is given. Zero array elements located between the minimum and maximum elements of the array (not including the minimum and maximum elements).

### Code:

```
org 100h

start:
  mov ah, $09
  mov dx, Hello
  int 21h
;-----------------------------------------------------
Min:               ;Минимальный элемент массива (bh)
  mov si, 0h
  mov cx, 8
  mov bh, 8        ;Начальное значение мин эл
  mov dh, 0        ;начало массива для индекса
.cycle2:
  mov dl, [array+si]
  cmp dl, bh
  jnb next2
  mov bh, dl
  mov bl, dh       ;для индекса
  inc bl           ;для индекса

next2:
  inc dh           ;для индекса
  add si, 1
  loop Min.cycle2
;---------------------------------------------------
  mov ah, 09h       ;Переход на новую строку
  mov dx, Next
  int 21h
;-----------------------------------------------------
Max:               ;Максимальный элемент массива
  mov si, 0h
  mov cx, 8
  mov bh, 0        ;Начальное значение макс эл
  mov dh, 0        ;Начало массива (для индекса)
.cycle1:
  mov dl, [array+si]
  cmp dl, bh
  jb next1
  mov bh, dl
  mov al, dh      ;Индекс макс эл (AL)
  inc al          ;Индекс

next1:
  inc dh          ;Для индекса
  add si, 1
  loop Max.cycle1
;-------------------------------------------------
Array:
  mov si, 0h
  mov cx, 8         ;Эл в массиве
  mov bh, 0         ;Индекс начального эд

.null:
  mov ah, 02h
  cmp bh, bl        ;Сравнение индекса текущ эл с индексом минимального эл
  jb Label1
  cmp bh, 6
  jnb Label1
  mov dl, 0
  jmp Label2

Label1:
  mov dl, [array+si]
Label2:
  add dl, 48
  int 21h

  add bh, 1
  add si, 1
  mov dx, 32
  int 21h
  loop Array.null
;--------------------------------------------------
Exit:
  mov ah, $08               ;Ожидание нажатия
  int 21h
  ret
;-----------------------------------------------------
Hello db 'Hello, your array: 4,1,3,2,3,5,9,6',10,13,'$'
array db  4,1,3,2,3,5,9,6
Next db 10,13,'$'

```
