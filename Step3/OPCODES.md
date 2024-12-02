# Opcode Table for ALU Operations

| Opcode (4 bits) | Operation Group      | Specific Operation       | Description                                |
|-----------------|----------------------|--------------------------|--------------------------------------------|
| 0000            | Arithmetic           | Addition                 | `Y = A + B + carry_in`                     |
| 0001            | Arithmetic           | Subtraction              | `Y = A - B`                                |
| 0100            | Multiplication       | Product Low              | `Y = product_low` (Lower 4 bits of product)|
| 1000            | Division             | Quotient                 | `Y = quotient_out`                         |
| 1001            | Division             | Remainder                | `remainder = remainder_out`                |
| Default         | Undefined Operation  | No Operation             | `Y = 4'b0000` 


# Opcode Table for Logic Operations

| Control (3 bits) | Operation    | Description                |
|------------------|--------------|----------------------------|
| 000              | AND          | `Y = A & B`                |
| 001              | NAND         | `Y = ~(A & B)`             |
| 010              | OR           | `Y = A | B`                |
| 011              | NOR          | `Y = ~(A | B)`             |
| 100              | XOR          | `Y = A ^ B`                |
| 101              | XNOR         | `Y = ~(A ^ B)`             |
| 110              | NOT          | `Y = ~A`                   |
| Default          | Default      | `Y = 4'b0000`              |

# Opcode Table for Shift Operations

## 1-bit Shift Operations

| Control (2 bits) | Operation        | Description                 |
|------------------|------------------|-----------------------------|
| 00               | No Shift         | `Y = A`                     |
| 01               | Left Shift by 1  | `Y = A << 1`                |
| 10               | Right Shift by 1 | `Y = A >> 1`                |
| Default          | Default          | `Y = 4'b0000`               |

## 2x4-bit Shift Operations

| Amount (2 bits) | Direction (1 bit) | Operation           | Description                 |
|-----------------|-------------------|---------------------|-----------------------------|
| 00              | -                 | No Shift            | `Y = A`                     |
| 01              | 0 (Left)          | Left Shift by 1     | `Y = {A[2:0], 1'b0}`        |
| 01              | 1 (Right)         | Right Shift by 1    | `Y = {1'b0, A[3:1]}`        |
| 10              | 0 (Left)          | Left Shift by 2     | `Y = {A[1:0], 2'b00}`       |
| 10              | 1 (Right)         | Right Shift by 2    | `Y = {2'b00, A[3:2]}`       |
| Default         | -                 | Default             | `Y = 4'b0000`    