org 100h

start:
  mov ah, $09
  mov dx, Hello
  int 21h
;-----------------------------------------------------
Min:               ;����������� ������� ������� (bh)
  mov si, 0h
  mov cx, 8
  mov bh, 8        ;��������� �������� ��� ��
  mov dh, 0        ;������ ������� ��� �������
.cycle2:
  mov dl, [array+si]
  cmp dl, bh
  jnb next2
  mov bh, dl
  mov bl, dh       ;��� �������
  inc bl           ;��� �������

next2:
  inc dh           ;��� �������
  add si, 1
  loop Min.cycle2
;---------------------------------------------------
  mov ah, 09h       ;������� �� ����� ������
  mov dx, Next
  int 21h
;-----------------------------------------------------
Max:               ;������������ ������� ������� (bh)
  mov si, 0h
  mov cx, 8
  mov bh, 0        ;��������� �������� ���� ��
  mov dh, 0        ;������ ������� (��� �������)
.cycle1:
  mov dl, [array+si]
  cmp dl, bh
  jb next1
  mov bh, dl
  mov al, dh      ;������ ���� �� (AL)
  inc al          ;������

next1:
  inc dh          ;��� �������
  add si, 1
  loop Max.cycle1
;-------------------------------------------------
Array:
  mov si, 0h
  mov cx, 8         ;�� � �������
  mov bh, 0         ;������ ���������� ��

.null:
  mov ah, 02h
  cmp bh, bl        ;��������� ������� ����� �� � �������� ������������ ��
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
  mov ah, $08               ;�������� �������
  int 21h
  ret
;-----------------------------------------------------
Hello db 'Hello, your array: 4,1,3,2,3,5,9,6',10,13,'$'
array db  4,1,3,2,3,5,9,6
Next db 10,13,'$'